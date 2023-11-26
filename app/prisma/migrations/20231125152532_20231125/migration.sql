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

-- DropIndex
DROP INDEX "Game_id_key";

-- DropIndex
DROP INDEX "PlayerValues_id_key";

-- DropIndex
DROP INDEX "Profile_id_key";

-- DropIndex
DROP INDEX "Round_id_key";

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
