import { PlayersOnGames, PrismaClient, Round } from '@prisma/client';
import {v4 as uuidv4} from 'uuid';
import { serverSupabaseUser } from '#supabase/server';
import {
    readBody,
  } from 'h3';

const prisma = new PrismaClient();
export default defineEventHandler(async (event) => {
    const user = await serverSupabaseUser(event);
    console.log(event.node.req.method);
    if(!user) { 
        return {status: 401};
    }

    switch(event.node.req.method) {
        case 'GET': { 
            console.log("Get all games");
            return getAllGames(user.id);

        }
        case 'POST': {
            const body = await readBody(event);
            await createGame(body);
            return {status: 200};
        }
    }
})

async function getAllGames(userId: string) {
    const games = await prisma.game.findMany({
        where: {
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
            },
            rounds: {
                include: {
                    player_values: {
                        include: {
                            player: {
                                
                            }
                        }
                    }
                }
            }
        }
    });

    return games;
}

async function createGame(game: any) {
    await prisma.game.create({
        data: {
            id: uuidv4(),
            name: game.name,
            players: {
                create: getPlayersModel(game.players)
            },
            rounds: {
                create: game.rounds
            },
            updated_at: new Date(),
        }
    });
}

function getPlayersModel(players: PlayersOnGames[]) {
    return players.map((player: any) => {
        return {
            profile_id: player.id,
        }
    });
}