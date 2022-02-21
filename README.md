# pollenjl-actions

## How to setup

Configure the docs/ folder:

```julia
using Pkg
Pkg.activate("./docs/")
Pkg.add([
    PackageSpec(url="https://github.com/lorenzoh/ModuleInfo.jl"),
    PackageSpec(url="https://github.com/lorenzoh/Pollen.jl", rev="frontend"),
])
```

Add `pollenexport.yml` to the main branch.

Create orphaned `pollen` and `gh-pages` branches.

```bash
git checkout --orphan pollen
git rm -rf .
rm .gitignore
touch .nojekyll
mkdir -p .github/workflows
cp $DIR/pollenbuild.yml ./.github/workflows/
git add .
git commit -m "Set up pollen branch"
git push origin
```
