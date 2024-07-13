using FixMe
using Documenter

DocMeta.setdocmeta!(FixMe, :DocTestSetup, :(using FixMe); recursive = true)

const page_rename = Dict("developer.md" => "Developer docs") # Without the numbers

function nice_name(file)
  file = replace(file, r"^[0-9]*-" => "")
  if haskey(page_rename, file)
    return page_rename[file]
  end
  return splitext(file)[1] |> x -> replace(x, "-" => " ") |> titlecase
end

makedocs(;
  modules = [FixMe],
  doctest = true,
  linkcheck = false, # Rely on Lint.yml/lychee for the links
  authors = "Cas Bex <cas.bex@kuleuven.be> and contributors",
  repo = "https://github.com/CasBex/FixMe.jl/blob/{commit}{path}#{line}",
  sitename = "FixMe.jl",
  format = Documenter.HTML(;
    prettyurls = true,
    canonical = "https://CasBex.github.io/FixMe.jl",
    assets = ["assets/style.css"],
  ),
  pages = [
    "Home" => "index.md"
    [
      nice_name(file) => file for
      file in readdir(joinpath(@__DIR__, "src")) if file != "index.md" && splitext(file)[2] == ".md"
    ]
  ],
)

deploydocs(; repo = "github.com/CasBex/FixMe.jl", push_preview = true)
