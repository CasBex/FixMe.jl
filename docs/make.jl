using FixMe
using Documenter

DocMeta.setdocmeta!(FixMe, :DocTestSetup, :(using FixMe); recursive = true)

const page_rename = Dict("developer.md" => "Developer docs") # Without the numbers

makedocs(;
  modules = [FixMe],
  authors = "Cas Bex <cas.bex@kuleuven.be> and contributors",
  repo = "https://github.com/CasBex/FixMe.jl/blob/{commit}{path}#{line}",
  sitename = "FixMe.jl",
  format = Documenter.HTML(; canonical = "https://CasBex.github.io/FixMe.jl"),
  pages = [
    "index.md"
    [
      file for
      file in readdir(joinpath(@__DIR__, "src")) if file != "index.md" && splitext(file)[2] == ".md"
    ]
  ],
)

deploydocs(; repo = "github.com/CasBex/FixMe.jl")
