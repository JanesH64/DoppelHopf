import { PrismaClient, Round } from '@prisma/client';
import {v4 as uuidv4} from 'uuid';
import { serverSupabaseClient } from '#supabase/server';

const prisma = new PrismaClient();
export default defineEventHandler(async (event) => {
    const client = await serverSupabaseClient(event);
    const {data: user, error} = await client.auth.getUser();
    if(!user?.user || error) { 
        console.log(error);
        return {status: 401};
    }

    switch(event.node.req.method) {
        case 'GET': { 
            const id = event?.context?.params?.id;
            if(!id) {
                return {status: 400};
            }

            return await getGame(id, user.user.id);
        }
        case 'DELETE': {
            const id = event?.context?.params?.id;
            if(!id) {
                return {status: 400};
            }
            await deleteGame(id, user.user.id);
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

async function deleteGame(id: string, userId: string) {
    await prisma.round.deleteMany({
        where: {
            game_id: id
        }
    });

    await prisma.playersOnGames.deleteMany({
        where: {
            game_id: id,
        }
    });
    
    await prisma.game.delete(
        {
            where: {
                id: id
            }
        }
    );
}

function getPlayerValuesModel(players: Round) {
    // return players.map((player: any) => {
    //     return {
    //         profile_id: player.id,
    //     }
    // });
    return [];
}
