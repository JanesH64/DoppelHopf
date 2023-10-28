/*
  Warnings:

  - The primary key for the `PlayersOnGames` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `player_id` on the `PlayersOnGames` table. All the data in the column will be lost.
  - Added the required column `profile_id` to the `PlayersOnGames` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "PlayersOnGames" DROP CONSTRAINT "PlayersOnGames_player_id_fkey";

-- AlterTable
ALTER TABLE "PlayersOnGames" DROP CONSTRAINT "PlayersOnGames_pkey",
DROP COLUMN "player_id",
ADD COLUMN     "profile_id" UUID NOT NULL,
ADD CONSTRAINT "PlayersOnGames_pkey" PRIMARY KEY ("profile_id", "game_id");

-- AddForeignKey
ALTER TABLE "PlayersOnGames" ADD CONSTRAINT "PlayersOnGames_profile_id_fkey" FOREIGN KEY ("profile_id") REFERENCES "Profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
