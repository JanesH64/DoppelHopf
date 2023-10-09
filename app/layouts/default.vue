<template>
    <VitePwaManifest />
    <div class="h-full">
        <div class="drawer">
            <input id="main-drawer" type="checkbox" class="drawer-toggle" />
            <div class="drawer-content">
                <!-- Page content here -->
                <div class="navbar bg-base-100 pt-safe-top fixed top-0">
                    <div class="flex-none">
                        <label for="main-drawer" class="btn btn-square btn-ghost">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                class="inline-block w-5 h-5 stroke-current">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M4 6h16M4 12h16M4 18h16">
                                </path>
                            </svg>
                        </label>
                    </div>
                    <div class="flex-1">
                        <NuxtLink class="btn btn-ghost normal-case text-xl" to="/">Doppelhopf</NuxtLink>
                    </div>
                    <div class="flex-none">
                        <button class="btn btn-square btn-ghost">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                class="inline-block w-5 h-5 stroke-current">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z">
                                </path>
                            </svg>
                        </button>
                    </div>
                </div>

                <div class="pt-safe-top h-full mt-16 ml-4 mr-4">
                    <slot />
                </div>
            </div>
            <div class="drawer-side">
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