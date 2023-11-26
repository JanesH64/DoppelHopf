<template>
    <VitePwaManifest />
    <!-- <div class="h-full">
        <div class="drawer">
            <input id="main-drawer" type="checkbox" class="drawer-toggle" />
            <div class="drawer-content">
                <div class="navbar bg-base-100 pt-safe-top fixed top-0">
                    <div class="flex-none">
                        <label for="main-drawer" class="btn btn-square btn-ghost">
                            <MdiIcon icon="mdiMenu" />
                        </label>
                    </div>
                    <div class="flex-1">
                        <NuxtLink class="btn btn-ghost normal-case text-xl" to="/">Doppelhopf</NuxtLink>
                    </div>
                    <div class="flex-none">
                        <NuxtLink class="btn btn-square btn-ghost" to="/profile">
                            <MdiIcon icon="mdiAccount" />
                        </NuxtLink>
                    </div>
                </div>

                <div class="pt-safe-top h-full mt-16 ml-4 mr-4">
                    <slot />
                </div>
            </div>
            <div class="drawer-side z-10">
                <label for="main-drawer" aria-label="close sidebar" class="drawer-overlay"></label>
                <ul class="menu p-4 w-80 min-h-full bg-base-200 text-base-content mt-safe-top">
                    <h2 class="p-4 text-xl">Doppelhopf</h2>
                    <NuxtLink to="/games" class="btn" v-on:click="closeSidebar()">Games</NuxtLink>
                    <NuxtLink to="/profile" class="btn" v-on:click="closeSidebar()">Profile</NuxtLink>
                </ul>
            </div>
        </div>
    </div> -->
    <v-app>
        <v-layout>
            <v-app-bar :elevation="2" class="pt-safe-top fixed top-0">
                <v-app-bar-nav-icon @click.stop="drawer = !drawer" variant="text"></v-app-bar-nav-icon>
                <v-toolbar-title>
                    <NuxtLink to="/">
                        <v-btn variant="plain">
                            Doppelhopf
                        </v-btn>
                    </NuxtLink>
                </v-toolbar-title>
                <template v-slot:append>
                    <v-btn icon="mdi-account" to="/profile" nuxt></v-btn>
                </template>
            </v-app-bar>
            <v-navigation-drawer v-model="drawer" location="left" temporary></v-navigation-drawer>
            <v-main class="h-full mt-16 ml-4 mr-4 pt-safe-top">
                <slot />
            </v-main>
        </v-layout>
    </v-app>
</template>


<script setup lang="ts">
let drawer = ref(false);

useHead({
    link: [
        {
            rel: 'icon',
            href: 'favicon-196.png',
            type: 'image/png',
        },
        {
            rel: 'apple-touch-icon',
            href: 'apple-icon-180.png',
            type: 'image/png',
        },
        {
            rel: 'apple-touch-startup-image',
            href: 'apple-splash-2048-2732.jpg',
            media: '(device-width: 1024px) and (device-height: 1366px) and (-webkit-device-pixel-ratio: 2) and (orientation: portrait)'
        },
        {
            rel: 'apple-touch-startup-image',
            href: 'apple-splash-2732-2048.jpg',
            media: '(device-width: 1024px) and (device-height: 1366px) and (-webkit-device-pixel-ratio: 2) and (orientation: landscape)'
        },
        {
            rel: 'apple-touch-startup-image',
            href: 'apple-splash-1668-2388.jpg',
            media: '(device-width: 834px) and (device-height: 1194px) and (-webkit-device-pixel-ratio: 2) and (orientation: portrait)'
        },
        {
            rel: 'apple-touch-startup-image',
            href: 'apple-splash-2388-1668.jpg',
            media: '(device-width: 834px) and (device-height: 1194px) and (-webkit-device-pixel-ratio: 2) and (orientation: landscape)'
        },
        {
            rel: 'apple-touch-startup-image',
            href: 'apple-splash-1536-2048.jpg',
            media: '(device-width: 768px) and (device-height: 1024px) and (-webkit-device-pixel-ratio: 2) and (orientation: portrait)'
        },
        {
            rel: 'apple-touch-startup-image',
            href: 'apple-splash-2048-1536.jpg',
            media: '(device-width: 768px) and (device-height: 1024px) and (-webkit-device-pixel-ratio: 2) and (orientation: landscape)'
        },
        {
            rel: 'apple-touch-startup-image',
            href: 'apple-splash-1668-2224.jpg',
            media: '(device-width: 834px) and (device-height: 1112px) and (-webkit-device-pixel-ratio: 2) and (orientation: portrait)'
        },
        {
            rel: 'apple-touch-startup-image',
            href: 'apple-splash-2224-1668.jpg',
            media: '(device-width: 834px) and (device-height: 1112px) and (-webkit-device-pixel-ratio: 2) and (orientation: landscape)'
        }
    ],
    meta: [
        {
            name: 'apple-mobile-web-app-capable',
            content: 'yes',
        },
        {
            name: 'apple-mobile-web-app-status-bar-style',
            content: 'black-translucent',
        },
        {
            name: 'viewport',
            content: 'initial-scale=1, viewport-fit=cover, user-scalable=no',
        },
    ],
});
</script>

<!-- <script>
  export default {
    data: () => ({
      drawer: false,
      group: null,
      items: [
        {
          title: 'Foo',
          value: 'foo',
        },
        {
          title: 'Bar',
          value: 'bar',
        },
        {
          title: 'Fizz',
          value: 'fizz',
        },
        {
          title: 'Buzz',
          value: 'buzz',
        },
      ],
    }),

    watch: {
      group () {
        this.drawer = false
      },
    },
  }
</script> -->