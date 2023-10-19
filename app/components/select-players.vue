
import { SelectPlayers } from '#build/components';

import { normalizeClass } from 'vue';

import { MdiIcon } from '#build/components';

import { MdiIcon } from '#build/components';

<template>
    <div class="overflow-x-auto overflow-y-scroll flex flex-col justify-center w-full">
        <div class="max-h-80 overflow-y-scroll">
            <table class="table w-full">
                <!-- head -->
                <thead>
                    <tr>
                        <th>
                            <MdiIcon icon="mdiDragHorizontalVariant" />
                        </th>
                        <th>
                            <div class="flex justify-center">
                                no.
                            </div>
                        </th>
                        <th>
                            <div class="flex justify-center">
                                Player
                            </div>
                        </th>
                        <th></th>
                    </tr>
                </thead>
                <tbody ref="sortableTable">
                    <tr v-for="(player, index) in modelValue" :key="player.id">
                        <th class="handle">
                            <MdiIcon icon="mdiDragHorizontalVariant" />
                        </th>
                        <td>
                            <div class="flex justify-center">
                                {{ index + 1 }}
                            </div>
                        </td>
                        <td>
                            <div class="flex flex-row items-center justify-start gap-x-2">
                                <div class="avatar">
                                    <div class="w-8 h-8 rounded-full">
                                        <img :src="player.avatarUrl" referrerpolicy="no-referrer" />
                                    </div>
                                </div>
                                {{ player.name }}
                            </div>
                        </td>
                        <th>
                            <div class="flex justify-center">
                                <button class="btn btn-ghost" v-on:click="removePlayer(index)">
                                    <MdiIcon icon="mdiClose" />
                                </button>
                            </div>
                        </th>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="flex flex-row gap-x-4 pt-4 justify-center px-5">
            <select class="select select-bordered w-full max-w-xs" v-model="selectedPlayer">
                <option disabled value="">Please select a player</option>
                <option v-for="player in availablePlayers()" :value="player">{{ player.name }}</option>
            </select>
            <button class="btn btn-circle" v-on:click="addPlayer(selectedPlayer)">
                <MdiIcon icon="mdiPlus" />
            </button>
        </div>
    </div>
</template>

<script setup lang="ts">
import { useSortable, moveArrayElement } from '@vueuse/integrations/useSortable';


let props = defineProps(['modelValue'])
defineEmits(['update:modelValue'])

let players = ref([
    {
        "id": "0",
        "name": "Janes Horst",
        "avatarUrl": "https://lh3.googleusercontent.com/a/ACg8ocL_whTcuKvtmPGW_P-z9_wNWgGuoOrft4jVxTE4CPeI=s96-c",
        "position": 1
    },
    {
        "id": "1",
        "name": "Yannik Horst",
        "avatarUrl": "https://lh3.googleusercontent.com/a/ACg8ocL_whTcuKvtmPGW_P-z9_wNWgGuoOrft4jVxTE4CPeI=s96-c",
        "position": 2
    },
    {
        "id": "2",
        "name": "Tim Lüdiger",
        "avatarUrl": "https://lh3.googleusercontent.com/a/ACg8ocL_whTcuKvtmPGW_P-z9_wNWgGuoOrft4jVxTE4CPeI=s96-c",
        "position": 2
    },
    {
        "id": "3",
        "name": "Leonard Demes",
        "avatarUrl": "https://lh3.googleusercontent.com/a/ACg8ocL_whTcuKvtmPGW_P-z9_wNWgGuoOrft4jVxTE4CPeI=s96-c",
        "position": 2
    },
    {
        "id": "4",
        "name": "Bastian Gödde",
        "avatarUrl": "https://lh3.googleusercontent.com/a/ACg8ocL_whTcuKvtmPGW_P-z9_wNWgGuoOrft4jVxTE4CPeI=s96-c",
        "position": 2
    }
]);

let selectedPlayer = ref(null);

const sortableTable = ref<HTMLElement | null>(null);
useSortable(sortableTable, players, {
    animation: 200,
    handle: '.handle',
    onUpdate: (e) => {
        moveArrayElement(props.modelValue, e.oldIndex, e.newIndex);
    },
});

function removePlayer(index: any): void {
    props.modelValue.splice(index, 1);
}

function addPlayer(player: any): void {
    props.modelValue.push(player);
}

function availablePlayers(): any[] {
    return players.value.filter((player) => !props.modelValue?.includes(player));
}
</script>