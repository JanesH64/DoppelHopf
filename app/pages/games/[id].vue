<template>
    <div class="h-full w-full flex flex-col items-center">
        <div v-if="!game" class="h-full flex items-center justify-center">
            <span class="loading loading-spinner"></span>
        </div>

        <div v-if="game" role="tablist" class="tabs tabs-boxed tabs-lg justify-center items-center w-full h-full">
            <input type="radio" name="game_tabs" role="tab" class="tab" aria-label="Players" />
            <div role="tabpanel" class="tab-content p-3 w-full h-full">
                <PlayerTable v-model="game.players" :canRemove="false"/>
            </div>
    
            <input type="radio" name="game_tabs" role="tab" class="tab" aria-label="Table" checked />
            <div role="tabpanel" class="tab-content p-3">Table</div>
    
            <input type="radio" name="game_tabs" role="tab" class="tab" aria-label="Add values" />
            <div role="tabpanel" class="tab-content p-3">Add values</div>
        </div>
    </div>
</template>

<script setup lang="ts">

const route = useRoute();
let loading: Ref<boolean> = ref(false);

const gameId: string = route.params.id as string;
let game: Ref<any> = ref(null);
await getGame(gameId);
loading.value = false;


async function getGame(gameId: string) {
    let { data } = await useLazyFetch(`/api/games/${gameId}`);
    game.value = data.value;
    console.log(game.value);
}
</script>