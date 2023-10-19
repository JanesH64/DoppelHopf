<template>
    <div class="h-full w-full flex flex-col items-center">
        <h1 class="text-3xl font-bold uppercase">New Game</h1>
        <NewGameStepper :stepIndex="stepIndex" class="py-12" />

        <div v-if="stepIndex === 0">
            <label class="label">
                <span class="label-text">What should the game be named?</span>
            </label>
            <input v-model="game.name" type="text" placeholder="Type here" class="input input-bordered input-primary w-full max-w-xs" />
        </div>

        <div v-if="stepIndex === 1" class="w-full">
            <SelectPlayers v-model="game.players"/>
        </div>
    </div>

    <div class='fixed bottom-12 flex justify-end w-full px-8 gap-x-2'>
        <button class='tracking-wide btn w-28' v-on:click="previous()" :disabled="!canGoBack()">Back</button>
        <button class='tracking-wide btn w-28' v-on:click="next()" :disabled="!canContinue()">Continue</button>
    </div>
</template>

<script setup lang="ts">
const stepIndex = ref(0);

let game = ref({
    name: '',
    createdOn: null,
    players: [],
    rounds: [],
});


function next(): void {
    if (stepIndex.value === 3) {
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
    switch (stepIndex.value) {
        case 0:
            return game.value.name?.length > 0;
        case 1:
            return game.value.players?.length >= 4;
        default:
            return true;
    }
};

function canGoBack(): boolean {
    return stepIndex.value > 0;
};
</script>
