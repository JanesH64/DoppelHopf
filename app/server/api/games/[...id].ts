import { PlayersOnGames, PrismaClient, Round } from '@prisma/client';
import {v4 as uuidv4} from 'uuid';
import { serverSupabaseUser } from '#supabase/server';
import {
    readBody,
  } from 'h3';

const prisma = new PrismaClient();
export default defineEventHandler(async (event) => {
    const user = await serverSupabaseUser(event);
    if(!user) { 
        return {status: 401};
    }

    switch(event.node.req.method) {
        case 'GET': { 
            const id = event?.context?.params?.slug;
            if(!id) {
                return {status: 400};
            }

            return await getGame(id, user.id);
        }
        case 'DELETE': {
            const id = event?.context?.params?.slug;
            if(!id) {
                return {status: 400};
            }

            await deleteGame(id);
            return {status: 200};
        }
    }
})

async function getGame(id: string, userId: string) {
    const game = await prisma.game.findFirst({
        where: {
            id: id,
            players: {
                some: {
                    profile_id: userId
                }
            }
        },
        include: {
            players: {
                include: {
                    profile: true
                }
            }
        }
    });

    if(!game) {
        return {status: 404};
    }

    return game;
}

async function updateGame(id: string, round: Round) {
    await prisma.game.update({
        where: {
            id: id
        },
        data: {
            rounds: {
                create: {
                    id: uuidv4(),
                    player_values: {
                        create: getPlayerValuesModel(round)
                    }
                }
            }
        }
    });
}

async function deleteGame(id: string) {
    await prisma.game.delete({
        where: {
            id: id
        }
    });
}

function getPlayerValuesModel(players: Round) {
    // return players.map((player: any) => {
    //     return {
    //         profile_id: player.id,
    //     }
    // });
    return [];
}
