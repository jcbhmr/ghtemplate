# ghtemplate
📋 The easiest way to create self-preparing templates

## Usage

```yml
# https://github.com/jcbhmr/ghtemplate
name: ghtemplate
on:
  create:
  issue:
    types: opened
jobs:
  lock-repo:
    permissions: write-all
    secrets: inherit
    uses: jcbhmr/ghtemplate/.github/workflows/workflow.yml@v1
    with:
      inputs: |
        name:
          type: string
          required: true
        favorite-ice-cream:
          type: choice
          options:
            - vanilla
            - chocolate
            - strawberry
      steps: |
        - uses: deno/setup-deno@v1
        - shell: deno run -A {0}
          run: |
            import { readdir, stat, readFile, writeFile } from 'node:fs/promises';
            import { join } from 'node:path';
            import process from "node:process";
            async function findAndReplaceDirectory(directory, find, replace) {
              for (const name of await readdir(directory)) {
                const file = join(directory, name);
                if ((await stat(file)).isDirectory()) {
                  await findAndReplaceInDirectory(file, find, replace);
                } else {
                  let text = await readFile(file, 'utf8');
                  text = text.replaceAll(find, replace)
                  await writeFile(file, text);
                }
              }
            }
            await findAndReplaceDirectory(".", "$")
            for (const [name, value] of Object.entries(process.env)) {
            }
```
