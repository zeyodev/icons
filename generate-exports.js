import { readdirSync, writeFileSync } from 'fs';
import { join, resolve, dirname } from 'path';
const __dirname = resolve(dirname(''))
const iconsDir = join(__dirname, 'src', 'business_and_online_icons');
const files = readdirSync(iconsDir).filter(f => f.startsWith('icons') && f.endsWith('.ts'));

const exports = files.map(f => {
    const name = f.replace('icons', '').replace('.ts', '');
    return `export { default as ${name} } from './${f.replace('.ts', '')}';`;
});

writeFileSync(
    join(iconsDir, 'index.ts'),
    join('\n')
);
