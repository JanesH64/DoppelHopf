<template>
    <VitePwaManifest />
    <div class="h-full">
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
                <ul class="menu p-4 w-80 min-h-full bg-base-200 text-base-content">
                    <h2 class="p-4 text-xl">Doppelhopf</h2>
                    <NuxtLink to="/games" class="btn" v-on:click="closeSidebar()">Games</NuxtLink>
                    <NuxtLink to="/profile" class="btn" v-on:click="closeSidebar()">Profile</NuxtLink>
                </ul>
            </div>
        </div>
    </div>
</template>


<script setup lang="ts">
const closeSidebar = () => {
    const sidebar = document.getElementById('main-drawer') as HTMLInputElement;
    if (sidebar) {
        sidebar.checked = false;
    }
}
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