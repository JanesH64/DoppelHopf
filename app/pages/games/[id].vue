<template>
    <div class="h-full w-full flex flex-col items-center">
        <div role="tablist" class="tabs tabs-boxed tabs-lg justify-center items-center w-full h-full">
            <input type="radio" name="my_tabs_1" role="tab" class="tab" aria-label="Tab 1" />
            <div role="tabpanel" class="tab-content p-10">Tab content 1</div>
    
            <input type="radio" name="my_tabs_1" role="tab" class="tab" aria-label="Tab 2" checked />
            <div role="tabpanel" class="tab-content p-10">Tab content 2</div>
    
            <input type="radio" name="my_tabs_1" role="tab" class="tab" aria-label="Tab 3" />
            <div role="tabpanel" class="tab-content p-10">Tab content 3</div>
        </div>
    </div>
</template>

<script setup lang="ts">
const route = useRoute();
</script>