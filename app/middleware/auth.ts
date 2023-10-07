export default defineNuxtRouteMiddleware((to, from) => {
    const user = useSupabaseUser();

    console.log('user', user?.value);
    console.log('to', to);

    // Login
        // eingeloggt?
            // ja: /
            // nein nichts
    // Andere Seite
        // eingeloggt?
            // ja: nichts
            // nein: /login

    if (to.path === '/login' && user.value) {
        return navigateTo('/');
    }

    if (to.path !== '/login' && !user.value) {
        return navigateTo('/login');
    }
});