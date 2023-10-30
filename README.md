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
  ghtemplate:
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
      run: |
        pip install cookiecutter
        cookiecutter ./cookiecutter/
```
