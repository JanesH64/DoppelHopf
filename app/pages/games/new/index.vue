<template>
    <div class="h-full w-full flex flex-col items-center">
        <h1 class="text-3xl font-bold uppercase">New Game</h1>
        <NewGameStepper :stepIndex="stepIndex" class="py-12" />

        <div v-if="stepIndex === 0">
            <label class="label">
                <span class="label-text">What should the game be named?</span>
            </label>
            <input v-model="game.name" type="text" placeholder="Type here"
                class="input input-bordered input-primary w-full max-w-xs" />
        </div>

        <div v-if="stepIndex === 1" class="w-full">
            <SelectPlayers v-model="game.players" />
        </div>

        <div v-if="stepIndex === 2">
            <div class="loading loading-spinner"></div>
        </div>
    </div>

    <div class='fixed bottom-12 flex justify-end w-full px-8 gap-x-2'>
        <button class='tracking-wide btn w-28' v-on:click="previous()" :disabled="!canGoBack()"
            v-if="stepIndex !== 2">Back</button>
        <button class='tracking-wide btn w-28' v-on:click="next()" v-if="stepIndex === 0"
            :disabled="!canContinue()">Continue</button>
        <button class='tracking-wide btn w-28' v-on:click="createGame()" v-if="stepIndex === 1"
            :disabled="!canCreate()">Create</button>
    </div>
</template>

<script setup lang="ts">
import players from '~/server/api/players';

let stepIndex = ref(0);

let game = ref({
    id: "1234",
    name: '',
    createdOn: null,
    players: [],
    rounds: [],
});


function next(): void {
    if (stepIndex.value === 1) {
        return;
    }

    stepIndex.value++;
};

function previous(): void {
    if (stepIndex.value === 0) {
        return;
    }

    stepIndex.value--;
};

function canContinue(): boolean {
    return game.value.name?.length > 0;
};

function canGoBack(): boolean {
    return stepIndex.value > 0;
};

function canCreate(): boolean {
    return game.value.players.length >= 4;
};

function onGameCreated(id: string | null): void {
    if (id) {
        navigateTo(`/games/${id}`);
    }
};

async function createGame() {
    stepIndex.value = 2;
    const {data: id} = await useFetch<string>('/api/games', {
        method: 'POST',
        body: JSON.stringify(game.value),
    });

    onGameCreated(id.value);
}
</script>
