import fs from 'node:fs';
import path from 'node:path';

const [, , prompt, outputPath = 'design-system/assets/logo-concept.png'] = process.argv;

if (!prompt) {
  console.error('Uso: node scripts/generate-logo.mjs "<prompt>" [outputPath]');
  process.exit(1);
}

const enhancedPrompt = `${prompt}, minimalist vector logo mark, flat design, clean geometric shapes, centered, solid plain background, high contrast, professional brand identity, no mockups, no watermarks`;
const seed = Math.floor(Math.random() * 100000);
const url = `https://image.pollinations.ai/prompt/${encodeURIComponent(enhancedPrompt)}?width=1024&height=1024&model=flux&seed=${seed}&nologo=true`;

console.log(`Gerando logo via Pollinations (Flux)...`);

const res = await fetch(url);
if (!res.ok) {
  console.error(`Erro na API: ${res.status} ${res.statusText}`);
  process.exit(1);
}

const buffer = Buffer.from(await res.arrayBuffer());
fs.mkdirSync(path.dirname(outputPath), { recursive: true });
fs.writeFileSync(outputPath, buffer);

console.log(`Logo salva em: ${outputPath}`);