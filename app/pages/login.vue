<template>
  <div class="hero min-h-screen bg-base-200">
    <div class="hero-content text-center">
      <div class="max-w-md">
        <h1 class="text-5xl font-bold">Doppelhopf</h1>
        <p class="py-6">Welcome to Doppelhopf. This is your place to brew your luck.</p>
        <button class="btn btn-primary" v-on:click="login()">
          <img class="h-6 w-6" src="/google-logo.png" alt="">
          Login with Google
        </button>
      </div>
    </div>
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
  