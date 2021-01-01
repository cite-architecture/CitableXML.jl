### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 5dba54c8-4c0f-11eb-2dcc-d9dfb217a7a5
using EzXML

# ╔═╡ 74a04cec-4c0f-11eb-342a-4febe21b36da
md"### Sandbox for learning EzXML"

# ╔═╡ 05f119c8-4c16-11eb-2bdc-7126564242d3
md"Define some data to play with."

# ╔═╡ 3d48f8a4-4c0f-11eb-22b0-512a08a42041
xp = "/tei:TEI/tei:text/tei:body/tei:div[@n = '?']/tei:div[@n = '?']/tei:ab[@n = '?']"


# ╔═╡ 5daadd5e-4c0f-11eb-307f-572d095cf26b
xml = """<?xml version="1.0" encoding="UTF-8"?>
<TEI xmlns="http://www.tei-c.org/ns/1.0">
  <text>
    <body>

      <div n="h007">
        <div n="h00">
          <ab n="1">In XII. <abbr>Lect</abbr></ab>
        </div>
        <div n="h01">
          <ab n="1">Veni et ostende nobis faciem
            tuam domine qui sedes super cherubim et salui erimus.</ab>
        </div>
	</div>
  </body>
 </text>
</TEI>
"""



# ╔═╡ 58ad6400-4c16-11eb-1685-3b12ced520a9
md"""---

DOM and navigation
"""

# ╔═╡ 5d159fd2-4c0f-11eb-2f04-3b9467554387
doc = parsexml(xml)

# ╔═╡ c04206f2-4c11-11eb-31c4-45d878cb2532
tei = namespace(doc.root)

# ╔═╡ d61c1370-4c0f-11eb-3187-eb30e0694af4
r = root(doc)

# ╔═╡ d7f65038-4c10-11eb-2fb2-eb470cd75dbd
nodetype(r)

# ╔═╡ 7eee7f88-4c10-11eb-06b3-e5d98838308e
r.name


# ╔═╡ 8aa587ce-4c10-11eb-3f8e-552c82686791
r.namespace

# ╔═╡ 921e7a68-4c10-11eb-1c26-f98aec9e0c49
nodes(r)

# ╔═╡ 687e3724-4c11-11eb-1e64-fb6efd5802ab
findall("//div", doc)

# ╔═╡ fd0f6938-4c11-11eb-312f-c95356a03933
divs = findall("//ns:div", doc.root, ["ns"=> tei]) 

# ╔═╡ ed65231a-4c13-11eb-278e-f9f4d1af5c57
map(d -> d.name, divs)

# ╔═╡ 93e465f4-4c12-11eb-2491-413112e60d3f
nodes(divs[3])[2]


# ╔═╡ 968d136e-4c12-11eb-1043-39e7d6df24f0
countattributes(nodes(divs[3])[2])

# ╔═╡ 20326466-4c13-11eb-33f7-571100d96ade
attrs = attributes(nodes(divs[3])[2])

# ╔═╡ c23b3ca0-4c14-11eb-3b5f-cb7fd7f04b95
divs[1].name

# ╔═╡ 34fa49d0-4c14-11eb-1195-1332e2649c27
attrs[1]

# ╔═╡ 296308c4-4c13-11eb-3e78-159a247a3a45
attrs[1].name

# ╔═╡ 1c0363c6-4c14-11eb-3a4c-c3e3a761f055
attrs[1].content

# ╔═╡ 4265d204-4c16-11eb-2bd3-a7fa692b3a26
md"""---

Prototype functions"""

# ╔═╡ 28d506b8-4c14-11eb-1513-ab1f51b48641
function attstring(a)
	"""$(a.name)="$(a.content)" """
end

# ╔═╡ 727bc180-4c14-11eb-02d1-3db3384fab77
map(a -> attstring(a), attrs)

# ╔═╡ 5c791f8a-4c15-11eb-34ef-d5fa1fed5dc3
join(map(a -> attstring(a), attributes(divs[1])), " ")

# ╔═╡ 5b5e04b8-4c14-11eb-2bb8-69eedf8a603e
attstring(attrs[1])

# ╔═╡ 82585596-4c14-11eb-3d9b-d370c6e01a6e
function elementopen(n)
	"<$(n.name) " * join(map(a -> attstring(a), attributes(n)),"") * ">"
end

# ╔═╡ edc0d2c2-4c14-11eb-28e9-af0db772ce4c
elementopen(divs[1])

# ╔═╡ Cell order:
# ╟─74a04cec-4c0f-11eb-342a-4febe21b36da
# ╠═5dba54c8-4c0f-11eb-2dcc-d9dfb217a7a5
# ╟─05f119c8-4c16-11eb-2bdc-7126564242d3
# ╟─3d48f8a4-4c0f-11eb-22b0-512a08a42041
# ╟─5daadd5e-4c0f-11eb-307f-572d095cf26b
# ╟─58ad6400-4c16-11eb-1685-3b12ced520a9
# ╠═5d159fd2-4c0f-11eb-2f04-3b9467554387
# ╠═c04206f2-4c11-11eb-31c4-45d878cb2532
# ╠═d61c1370-4c0f-11eb-3187-eb30e0694af4
# ╠═d7f65038-4c10-11eb-2fb2-eb470cd75dbd
# ╠═7eee7f88-4c10-11eb-06b3-e5d98838308e
# ╠═8aa587ce-4c10-11eb-3f8e-552c82686791
# ╠═921e7a68-4c10-11eb-1c26-f98aec9e0c49
# ╠═687e3724-4c11-11eb-1e64-fb6efd5802ab
# ╠═fd0f6938-4c11-11eb-312f-c95356a03933
# ╠═ed65231a-4c13-11eb-278e-f9f4d1af5c57
# ╠═93e465f4-4c12-11eb-2491-413112e60d3f
# ╠═968d136e-4c12-11eb-1043-39e7d6df24f0
# ╠═20326466-4c13-11eb-33f7-571100d96ade
# ╠═727bc180-4c14-11eb-02d1-3db3384fab77
# ╠═edc0d2c2-4c14-11eb-28e9-af0db772ce4c
# ╠═c23b3ca0-4c14-11eb-3b5f-cb7fd7f04b95
# ╠═5c791f8a-4c15-11eb-34ef-d5fa1fed5dc3
# ╠═34fa49d0-4c14-11eb-1195-1332e2649c27
# ╠═296308c4-4c13-11eb-3e78-159a247a3a45
# ╠═1c0363c6-4c14-11eb-3a4c-c3e3a761f055
# ╠═5b5e04b8-4c14-11eb-2bb8-69eedf8a603e
# ╟─4265d204-4c16-11eb-2bd3-a7fa692b3a26
# ╠═82585596-4c14-11eb-3d9b-d370c6e01a6e
# ╠═28d506b8-4c14-11eb-1513-ab1f51b48641
