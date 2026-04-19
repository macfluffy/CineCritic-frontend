import { defineConfig, loadEnv } from 'vite';
import react from '@vitejs/plugin-react';

// https://vite.dev/config/
export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, process.cwd(), '');

  return {
    plugins: [react()],
    server: {
      host: true,
      allowedHosts: env.VITE_ALLOWED_HOSTS ? env.VITE_ALLOWED_HOSTS.split(',') : [],
      port: 5173,
      watch: {
        usePolling: true,
      },
    },
    test: {
      globals: true,
      environment: 'jsdom',
      setupFiles: './tests/setupTests.js',
    },
  }
});
