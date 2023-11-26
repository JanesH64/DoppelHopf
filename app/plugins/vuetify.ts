import '@mdi/font/css/materialdesignicons.css'
import 'vuetify/styles'
import { createVuetify } from 'vuetify'

const customDarkTheme = {
  dark: true,
  colors: {
    background: "#121212",
    surface: "#212121",
    primary: "#BB86FC",
    secondary: "#03DAC5",
    error: "#CF6679",
    info: "#2196F3",
    success: "#4CAF50",
    warning: "#FB8C00"
  }
}

export default defineNuxtPlugin((app) => {
  const vuetify = createVuetify({
    ssr: true,
    theme: {
      defaultTheme: 'customDarkTheme',
      themes: {
        customDarkTheme
      } 
    }
  })
  app.vueApp.use(vuetify)
})