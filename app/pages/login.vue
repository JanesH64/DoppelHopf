<template>
  <div class="hero min-h-screen bg-base-200">
    <div class="hero-content text-center">
      <div class="flex flex-col items-center">
        <img src="/icon.png" class="h-2/5 w-2/5 m-6" alt="">
        <div class="max-w-md">
          <h1 class="text-5xl font-bold">Doppelhopf</h1>
          <p class="py-6 flex flex-col"><span>
              Welcome to Doppelhopf.
            </span>
            <span>This is your place to brew your luck.</span>
          </p>
          <button class="btn btn-primary" v-on:click="login()">
            <img class="h-6 w-6" src="/google-logo.png" alt="">
            Login with Google
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
  
<script setup lang="ts">
  definePageMeta({
      middleware: [
          'auth',
      ]
  });
  
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
  