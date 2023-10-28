-- CreateTable
CREATE TABLE "Profile" (
    "id" UUID NOT NULL,
    "updated_at" TIMESTAMPTZ(6),
    "email" TEXT,
    "email_verified" BOOLEAN,
    "full_name" TEXT,
    "avatar_url" TEXT,

    CONSTRAINT "Profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Game" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "updated_at" TIMESTAMPTZ(6),

    CONSTRAINT "Game_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PlayersOnGames" (
    "player_id" UUID NOT NULL,
    "game_id" UUID NOT NULL,

    CONSTRAINT "PlayersOnGames_pkey" PRIMARY KEY ("player_id","game_id")
);

-- CreateTable
CREATE TABLE "Round" (
    "id" UUID NOT NULL,
    "updated_at" TIMESTAMPTZ(6),
    "game_id" UUID NOT NULL,

    CONSTRAINT "Round_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PlayerValues" (
    "id" UUID NOT NULL,
    "updated_at" TIMESTAMPTZ(6),
    "round_id" UUID NOT NULL,
    "player_id" UUID NOT NULL,
    "value" INTEGER NOT NULL,

    CONSTRAINT "PlayerValues_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Profile_id_key" ON "Profile"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_email_key" ON "Profile"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Game_id_key" ON "Game"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Round_id_key" ON "Round"("id");

-- CreateIndex
CREATE UNIQUE INDEX "PlayerValues_id_key" ON "PlayerValues"("id");

-- AddForeignKey
ALTER TABLE "PlayersOnGames" ADD CONSTRAINT "PlayersOnGames_player_id_fkey" FOREIGN KEY ("player_id") REFERENCES "Profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlayersOnGames" ADD CONSTRAINT "PlayersOnGames_game_id_fkey" FOREIGN KEY ("game_id") REFERENCES "Game"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Round" ADD CONSTRAINT "Round_game_id_fkey" FOREIGN KEY ("game_id") REFERENCES "Game"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlayerValues" ADD CONSTRAINT "PlayerValues_round_id_fkey" FOREIGN KEY ("round_id") REFERENCES "Round"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlayerValues" ADD CONSTRAINT "PlayerValues_player_id_fkey" FOREIGN KEY ("player_id") REFERENCES "Profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
