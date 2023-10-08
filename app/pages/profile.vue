<template>
    <h1>Hello Profile</h1>
    <h3>Mail: {{ user?.email }}</h3>
</template>


<script setup lang="ts">
    const user = useSupabaseUser();
</script>