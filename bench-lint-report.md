## Benchmark: `vp lint/fmt` vs direct `oxlint/oxfmt`

**Related issue:** [voidzero-dev/vite-plus-discussions#9](https://github.com/voidzero-dev/vite-plus-discussions/issues/9)

### Environment

- **OS:** Darwin 25.2.0 (arm64)
- **Node.js:** v24.14.0
- **pnpm:** 10.30.1
- **vite-plus:** 0.0.0-g52709db6.20260226-1136
- **Date:** 2026-02-26

### Scripts

| Script         | Command                     |
| -------------- | --------------------------- |
| `pnpm lint`    | `oxlint && oxfmt --check`   |
| `pnpm lint:vp` | `vp lint && vp fmt --check` |

### Results

| Command        | Mean (s) | Std Dev (s) |
| -------------- | -------- | ----------- |
| `pnpm lint`    | 1.987    | ±0.032      |
| `pnpm lint:vp` | 2.187    | ±0.031      |

**Overhead ratio:** 1.10x

### Raw output

```
Benchmark 1: pnpm lint
  Time (mean ± σ):      1.987 s ±  0.032 s    [User: 12.256 s, System: 1.057 s]
  Range (min … max):    1.939 s …  2.045 s    10 runs

Benchmark 2: pnpm lint:vp
  Time (mean ± σ):      2.187 s ±  0.031 s    [User: 12.484 s, System: 1.106 s]
  Range (min … max):    2.148 s …  2.242 s    10 runs

Summary
  pnpm lint ran
    1.10 ± 0.02 times faster than pnpm lint:vp
```
