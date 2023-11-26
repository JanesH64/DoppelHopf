<template>
    <table class="table w-full">
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
            <tr v-for="(player, index) in modelValue" :key="player.id ?? player.profile.id">
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
                                <img :src="player.avatar_url ?? player.profile.avatar_url" referrerpolicy="no-referrer" />
                            </div>
                        </div>
                        {{ player.full_name ?? player.profile.full_name }}
                    </div>
                </td>
                <th>
                    <div class="flex justify-center">
                        <button v-if="canRemove" class="btn btn-ghost" v-on:click="removePlayer(index)">
                            <MdiIcon icon="mdiClose" />
                        </button>
                    </div>
                </th>
            </tr>
        </tbody>
    </table>
</template>

<script setup lang="ts">
import { useSortable, moveArrayElement } from '@vueuse/integrations/useSortable';

let props = defineProps(['modelValue', 'canRemove'])
defineEmits(['update:modelValue'])

const sortableTable = ref<HTMLElement | null>(null);
useSortable(sortableTable, props.modelValue, {
    animation: 200,
    handle: '.handle',
    onUpdate: (e: any) => {
        moveArrayElement(props.modelValue, e.oldIndex, e.newIndex);
    },
});

function removePlayer(index: any) {
    props.modelValue.splice(index, 1);
}
</script>