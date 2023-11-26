/*
  Warnings:

  - The primary key for the `Game` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `PlayerValues` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `PlayersOnGames` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Profile` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Round` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "PlayerValues" DROP CONSTRAINT "PlayerValues_player_id_fkey";

-- DropForeignKey
ALTER TABLE "PlayerValues" DROP CONSTRAINT "PlayerValues_round_id_fkey";

-- DropForeignKey
ALTER TABLE "PlayersOnGames" DROP CONSTRAINT "PlayersOnGames_game_id_fkey";

-- DropForeignKey
ALTER TABLE "PlayersOnGames" DROP CONSTRAINT "PlayersOnGames_profile_id_fkey";

-- DropForeignKey
ALTER TABLE "Round" DROP CONSTRAINT "Round_game_id_fkey";

-- AlterTable
ALTER TABLE "Game" DROP CONSTRAINT "Game_pkey",
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Game_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "PlayerValues" DROP CONSTRAINT "PlayerValues_pkey",
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "round_id" SET DATA TYPE TEXT,
ALTER COLUMN "player_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "PlayerValues_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "PlayersOnGames" DROP CONSTRAINT "PlayersOnGames_pkey",
ALTER COLUMN "game_id" SET DATA TYPE TEXT,
ALTER COLUMN "profile_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "PlayersOnGames_pkey" PRIMARY KEY ("profile_id", "game_id");

-- AlterTable
ALTER TABLE "Profile" DROP CONSTRAINT "Profile_pkey",
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Profile_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Round" DROP CONSTRAINT "Round_pkey",
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "game_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Round_pkey" PRIMARY KEY ("id");

-- AddForeignKey
ALTER TABLE "PlayersOnGames" ADD CONSTRAINT "PlayersOnGames_profile_id_fkey" FOREIGN KEY ("profile_id") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlayersOnGames" ADD CONSTRAINT "PlayersOnGames_game_id_fkey" FOREIGN KEY ("game_id") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Round" ADD CONSTRAINT "Round_game_id_fkey" FOREIGN KEY ("game_id") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlayerValues" ADD CONSTRAINT "PlayerValues_round_id_fkey" FOREIGN KEY ("round_id") REFERENCES "Round"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlayerValues" ADD CONSTRAINT "PlayerValues_player_id_fkey" FOREIGN KEY ("player_id") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;
