import { defineConfig } from 'vite-plus/pack'

export default defineConfig({
  entry: ['src/index.ts', 'src/cli.ts'],
  format: 'esm',
  clean: true,
  dts: true,
  outDir: 'dist',
  external: ['@lydell/node-pty'],
})
