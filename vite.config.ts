/* eslint-disable import/no-extraneous-dependencies */
import { defineConfig } from 'vite';
import elmPlugin from 'vite-plugin-elm';

export default defineConfig({
  plugins: [elmPlugin()],
});
