using Pkg
pkg"activate .."
push!(LOAD_PATH,"../src/")
using Documenter, DocStringExtensions, CitableXML

makedocs(sitename = "CitableXML Documentation")
