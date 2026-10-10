// Rebuilds capes/index.json from the PNG files in this folder. Run by the "Cape index" workflow.
import { readdirSync, writeFileSync } from 'node:fs';
const title = (s) => s.replace(/[-_]+/g, ' ').replace(/\b\w/g, (c) => c.toUpperCase());
const capes = readdirSync(new URL('.', import.meta.url))
  .filter((f) => /\.png$/i.test(f))
  .sort((a, b) => a.localeCompare(b))
  .map((file) => {
    const id = file.replace(/\.png$/i, '').toLowerCase();
    return { id, name: title(id), file };
  });
writeFileSync(new URL('index.json', import.meta.url), JSON.stringify({ capes }, null, 2) + '\n');
console.log(`indexed ${capes.length} cape(s)`);
