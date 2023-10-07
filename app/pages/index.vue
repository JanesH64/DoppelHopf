<template>
    <h1>Welcome! {{ user?.email }}</h1>
    <NuxtLink class="btn" v-on:click="logout()">Sign out</NuxtLink>
    <NuxtLink class="btn" to="/profile" prefetch>Profile</NuxtLink>
</template>

<script setup lang="ts">
    const router = useRouter();
    const supabase = useSupabaseClient();
    const user = useSupabaseUser();
    const logout = async () => {
        const { error } = await supabase.auth.signOut();
        if (error) {
            console.error(error);
        }
    };
</script>