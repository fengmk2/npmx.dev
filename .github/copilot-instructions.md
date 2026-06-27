# Core Requirements

- The end goal is stability, speed and great user experience.

## Code Quality Requirements

- Follow standard TypeScript conventions and best practices
- Use the Composition API when creating Vue components
- Use clear, descriptive variable and function names
- Accessibility should always be a first-class consideration and should be part of the initial planning and design.
- Add comments only to explain complex logic or non-obvious implementations
- Write unit tests for core functionality using `vitest`
- Write end-to-end tests using Playwright and `@nuxt/test-utils`
- Keep functions focused and manageable (generally under 50 lines)
- Use error handling patterns consistently
- Ensure you write strictly type-safe code, for example by ensuring you always check when accessing an array value by index

<!--VITE PLUS START-->

# Using Vite+, the Unified Toolchain for the Web

This project is using Vite+, a unified toolchain built on top of Vite, Rolldown, Vitest, tsdown, Oxlint, Oxfmt, and Vite Task. Vite+ wraps runtime management, package management, and frontend tooling in a single global CLI called `vp`. Vite+ is distinct from Vite, and it invokes Vite through `vp dev` and `vp build`. Run `vp help` to print a list of commands and `vp <command> --help` for information about a specific command.

Docs are local at `node_modules/vite-plus/docs` or online at https://viteplus.dev/guide/.

## Review Checklist

- [ ] Run `vp install` after pulling remote changes and before getting started.
- [ ] Run `vp check` and `vp test` to format, lint, type check and test changes.
- [ ] Check if there are `vite.config.ts` tasks or `package.json` scripts necessary for validation, run via `vp run <script>`.
- [ ] If setup, runtime, or package-manager behavior looks wrong, run `vp env doctor` and include its output when asking for help.

<!--VITE PLUS END-->
