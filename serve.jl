using Pkg
using Pollen

# using MyPackage
const PACKAGE = Pollen


# Create Project
m = PACKAGE
ms = [PACKAGE,]


@info "Creating project..."
project = Project(
    Pollen.Rewriter[
        Pollen.DocumentFolder(pkgdir(m), prefix = "documents"),
        Pollen.ParseCode(),
        Pollen.ExecuteCode(),
        Pollen.PackageDocumentation(ms),
        Pollen.DocumentGraph(),
        Pollen.SearchIndex(),
        Pollen.SaveAttributes((:title,)),
        Pollen.LoadFrontendConfig(pkgdir(m))
    ],
)

@info "Rewriting documents..."
Pollen.rewritesources!(project)

@info "Writing to disk at \"$DIR\"..."
builder = Pollen.FileBuilder(
    Pollen.JSON(),
    DIR,
)

Pollen.serve(project, lazy=true, format = Pollen.JSON())
