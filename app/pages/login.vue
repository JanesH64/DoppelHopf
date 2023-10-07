<template>
    <div>
      <h1>Doppelhopf</h1>
      <button class="btn" v-on:click="login()">Test</button>
    </div>
  </template>
  
  <script setup lang="ts">
    const supabase = useSupabaseClient();
    const login = async () => {
    const { error } = await supabase.auth.signInWithOAuth({
      provider: 'google',
    });
  
    if (error) {
      console.error(error);
    }
  };
  </script>
  