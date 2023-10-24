<template>
    <ul class="steps pt-4 w-4/5">
        <li class="step" :class="{ 'step-primary': isStepActive(0) }">Choose name</li>
        <li class="step" :class="{ 'step-primary': isStepActive(1) }">Add players</li>
        <li class="step" :class="{ 'step-primary': isStepActive(2) }">Done</li>
    </ul>
</template>

<script setup lang="ts">
    const props = defineProps(['stepIndex']);

    function isStepActive(stepIndex: number): boolean {
        if(!props?.stepIndex) {
            return false;
        }
        return props?.stepIndex >= stepIndex
    }
</script>