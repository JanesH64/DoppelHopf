<template>
    <div class="flex items-center w-full flex-col max-h-[70%] overflow-y-scroll">
        <h1 class="text-3xl font-bold uppercase my-4">Games</h1>
        <div class="flex items-center w-full justify-center flex-col h-full gap-y-4">
            <div class="card card-compact bg-neutral text-neutral-content shadow-xl w-full" v-for="game in games">
            <div class="card-body">
                <h2 class="card-title">
                    {{ game.name }}
                </h2>
                <div class="flex flex-row items-center gap-x-2">
                    <span class="font-bold">Players:</span>
                    <div class="avatar-group -space-x-6">
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
                <div class="card-actions justify-end">
                    <NuxtLink class="btn btn-primary btn-circle" :to="`/games/${game.id}`">
                        <MdiIcon icon="mdiPlay" />
                    </NuxtLink>
                </div>
            </div>
        </div>
        </div>
    </div>
</template>


<script setup lang="ts">
let intializing = true;
const { data: games } = await useFetch('/api/games');
console.log(games);
intializing = false;
</script>