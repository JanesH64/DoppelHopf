
import { SelectPlayers } from '#build/components';

import { normalizeClass } from 'vue';

import { MdiIcon } from '#build/components';

import { MdiIcon } from '#build/components';

<template>
    <div class="overflow-x-auto overflow-y-scroll flex flex-col justify-center w-full">
        <div v-if="loading" class="h-full flex items-center justify-center">
            <span class="loading loading-spinner"></span>
        </div>
        <div v-if="!loading" class="max-h-80 overflow-y-scroll">
            <PlayerTable v-model="props.modelValue" :canRemove="true"></PlayerTable>
        </div>
        <div class="flex flex-row gap-x-4 pt-4 justify-center px-5">
            <select class="select select-bordered w-full max-w-xs" v-model="selectedPlayer">
                <option disabled value="">Please select a player</option>
                <option v-for="player in availablePlayers()" :value="player">{{ player.full_name }}</option>
            </select>
            <button class="btn btn-circle" v-on:click="addPlayer(selectedPlayer)" :disabled="!selectedPlayer">
                <MdiIcon icon="mdiPlus" />
            </button>
        </div>
    </div>
</template>

<script setup lang="ts">


let props = defineProps(['modelValue'])
defineEmits(['update:modelValue'])

let loading = ref(true);

const { data: profiles } = await useFetch('/api/players');
let players = ref(profiles);
let selectedPlayer = ref(null);

loading.value = false;

function addPlayer(player: any) {
    props.modelValue.push(player);
    selectedPlayer.value = null;
}

function availablePlayers() {
    return players?.value?.filter((player) => !props.modelValue?.includes(player)) ?? [];
}
</script>