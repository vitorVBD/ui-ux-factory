import fs from 'node:fs';

const filePath = process.argv[2] || 'design-system/tokens/design-tokens.json';

function hexToRgb(hex) {
  const clean = hex.replace('#', '');
  const full = clean.length === 3 ? clean.split('').map(c => c + c).join('') : clean;
  const num = parseInt(full, 16);
  return [(num >> 16) & 255, (num >> 8) & 255, num & 255];
}

function luminance([r, g, b]) {
  const [rs, gs, bs] = [r, g, b].map(v => {
    const s = v / 255;
    return s <= 0.03928 ? s / 12.92 : Math.pow((s + 0.055) / 1.055, 2.4);
  });
  return 0.2126 * rs + 0.7152 * gs + 0.0722 * bs;
}

function contrastRatio(hex1, hex2) {
  const l1 = luminance(hexToRgb(hex1));
  const l2 = luminance(hexToRgb(hex2));
  return (Math.max(l1, l2) + 0.05) / (Math.min(l1, l2) + 0.05);
}

const data = JSON.parse(fs.readFileSync(filePath, 'utf-8'));
const pairs = data.contrastChecks || [];

if (!pairs.length) {
  console.log('Aviso: adicione um array "contrastChecks": [{ "name": "...", "fg": "#...", "bg": "#..." }] no JSON.');
  process.exit(0);
}

let failed = false;
for (const { name, fg, bg, min = 4.5 } of pairs) {
  const ratio = contrastRatio(fg, bg);
  const ok = ratio >= min;
  console.log(`${ok ? 'PASS' : 'FAIL'} | ${name}: ${ratio.toFixed(2)}:1 (min ${min}:1) [${fg} sobre ${bg}]`);
  if (!ok) failed = true;
}

if (failed) {
  console.error('\nFalha de contraste WCAG. Ajuste os tokens e rode novamente.');
  process.exit(1);
}
console.log('\nTodos os pares passaram no teste WCAG!');