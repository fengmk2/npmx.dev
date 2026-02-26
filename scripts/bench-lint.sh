#!/bin/bash
# Benchmark: vp lint/fmt vs direct oxlint/oxfmt
# Usage: ./scripts/bench-lint.sh [output_file]

set -e

OUTPUT="${1:-bench-lint-report.md}"
VP_VERSION=$(node -e "console.log(require('./node_modules/vite-plus/package.json').version)")
NODE_VERSION=$(node -v)
PNPM_VERSION=$(pnpm -v)

echo "Running benchmarks..."

RESULT=$(hyperfine --warmup 1 --export-json /tmp/bench-lint.json \
  "pnpm lint" \
  "pnpm lint:vp" 2>&1)

echo "$RESULT"

# Extract times from JSON
DIRECT_MEAN=$(node -e "const d=require('/tmp/bench-lint.json'); console.log(d.results[0].mean.toFixed(3))")
DIRECT_STDDEV=$(node -e "const d=require('/tmp/bench-lint.json'); console.log(d.results[0].stddev.toFixed(3))")
VP_MEAN=$(node -e "const d=require('/tmp/bench-lint.json'); console.log(d.results[1].mean.toFixed(3))")
VP_STDDEV=$(node -e "const d=require('/tmp/bench-lint.json'); console.log(d.results[1].stddev.toFixed(3))")
RATIO=$(node -e "const d=require('/tmp/bench-lint.json'); console.log((d.results[1].mean / d.results[0].mean).toFixed(2))")

cat > "$OUTPUT" <<EOF
## Benchmark: \`vp lint/fmt\` vs direct \`oxlint/oxfmt\`

**Related issue:** [voidzero-dev/vite-plus-discussions#9](https://github.com/voidzero-dev/vite-plus-discussions/issues/9)

### Environment

- **OS:** $(uname -s) $(uname -r) ($(uname -m))
- **Node.js:** ${NODE_VERSION}
- **pnpm:** ${PNPM_VERSION}
- **vite-plus:** ${VP_VERSION}
- **Date:** $(date -u +%Y-%m-%d)

### Scripts

| Script | Command |
|---|---|
| \`pnpm lint\` | \`oxlint && oxfmt --check\` |
| \`pnpm lint:vp\` | \`vp lint && vp fmt --check\` |

### Results

| Command | Mean (s) | Std Dev (s) |
|---|---|---|
| \`pnpm lint\` | ${DIRECT_MEAN} | ±${DIRECT_STDDEV} |
| \`pnpm lint:vp\` | ${VP_MEAN} | ±${VP_STDDEV} |

**Overhead ratio:** ${RATIO}x

### Raw output

\`\`\`
${RESULT}
\`\`\`
EOF

echo ""
echo "Report saved to $OUTPUT"
