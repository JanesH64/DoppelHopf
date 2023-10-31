<template>
    <div class="flex items-center w-full flex-col max-h-[90vh] overflow-y-scroll">
        <h1 class="text-3xl font-bold uppercase my-4">Games</h1>
        <div v-if="!loading" class="flex items-center w-full justify-center flex-col gap-y-4">
            <div class="card card-compact bg-neutral text-neutral-content shadow-xl w-full" v-for="game in games.value">
                <div class="card-body">
                    <h2 class="card-title">
                        {{ game.name }}
                    </h2>
                    <div class="flex flex-row items-center gap-x-2">
                        <span class="font-bold">Players:</span>
                        <div class="avatar-group -space-x-4">
                            <div class="avatar" v-for="player in game.players">
                                <div class="w-8">
                                    <img :src="player?.profile?.avatar_url" referrerpolicy="no-referrer" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="flex flex-row items-center gap-x-2">
                        <span class="font-bold">Last played:</span>
                        <p>{{ new Date(game.updated_at).toLocaleString() }}</p>
                    </div>
                    <div class="card-actions justify-end gap-x-6">
                        <NuxtLink class="btn btn-error btn-circle" v-on:click="deleteGame(game.id)" >
                            <MdiIcon icon="mdiDelete" />
                        </NuxtLink>
                        <NuxtLink class="btn btn-primary btn-circle" :to="getLink(game)">
                            <MdiIcon icon="mdiPlay" />
                        </NuxtLink>
                    </div>
                </div>
            </div>
            <h3 class="text-1xl" v-if="games.value.length === 0">No games found</h3>
        </div>
        <div v-if="loading" class="h-full flex items-center justify-center">
            <span class="loading loading-spinner"></span>
        </div>
    </div>
</template>


<script setup lang="ts">
let loading = ref(true);
let games = ref<any>([]);

async function loadGames() {
    loading.value = true;
    const {data} = await useFetch<any[]>('/api/games');
    games.value = data;
    loading.value = false;
}

loadGames();

function getLink(game: any) {
    return `/games/${game.id}`;
}

async function deleteGame(id: string) {
    const {error} = await useFetch(`/api/games/${id}`, {
        method: 'DELETE',
    });

    if(error) {
        console.log(error);
        return;
    }

    await loadGames();
}
</script>