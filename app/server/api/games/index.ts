import { PlayersOnGames, PrismaClient, Round } from '@prisma/client';
import {v4 as uuidv4} from 'uuid';
import { serverSupabaseClient } from '#supabase/server';
import {
    readBody,
  } from 'h3';

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
            console.log("Get all games");
            return getAllGames(user.user.id);

        }
        case 'POST': {
            const body = await readBody(event);
            let id = await createGame(body);
            return id;
        }
    }
})

async function getAllGames(userId: string) {
    const games = await prisma.game.findMany({
        orderBy: [
            {
                updated_at: 'desc',
            },
            {
              name: 'desc',
            },
          ],
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

async function createGame(game: any): Promise<string> {
    let createdGame = await prisma.game.create({
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

    return createdGame.id;
}

function getPlayersModel(players: PlayersOnGames[]) {
    return players.map((player: any) => {
        return {
            profile_id: player.id,
        }
    });
}