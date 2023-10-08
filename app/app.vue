<template>
    <NuxtLayout>
        <NuxtPage />
    </NuxtLayout>
</template>

<script setup lang="ts">

const supabase = useSupabaseClient();
const router = useRouter();
onMounted(() => {
    supabase.auth.onAuthStateChange((event, session) => {
        if (router.currentRoute.value.path === '/login' && session !== null) {
            router.push('/');
            return;
        }

        if (router.currentRoute.value.path !== '/login' && session === null) {
            router.push('/login');
        }
    });
});
</script>