<template>
    <VitePwaManifest />
    <div class="h-full">
        <div class="pt-safe-top h-full mt-16 ml-4 mr-4">
            <slot />
        </div>
    </div>
</template>


<script setup lang="ts">
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