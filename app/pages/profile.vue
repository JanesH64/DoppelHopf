<template>
    <div class="h-full w-full flex flex-col items-center">
        <div class="avatar mb-4">
            <div class="w-24 rounded-full ring ring-secondary ring-offset-base-100 ring-offset-2">
                <img :src="userData?.picture" class="h-36 w-36" referrerpolicy="no-referrer" />
            </div>
        </div>
        <div class="card w-11/12 bg-base-200 shadow-xl">
            <div class="card-body">
                <p>Mail: {{ userData?.email }}</p>
                <p>Name: {{ userData?.full_name }}</p>
                <p>Verified: {{ userData?.email_verified }}</p>
            </div>
        </div>
    </div>
</template>


<script setup lang="ts">
const user = useSupabaseUser();
const userData = user.value?.identities ? user.value?.user_metadata : null;
</script>