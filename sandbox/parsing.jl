### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 5dba54c8-4c0f-11eb-2dcc-d9dfb217a7a5
using EzXML

# ╔═╡ 74a04cec-4c0f-11eb-342a-4febe21b36da
md"### Sandbox for learning EzXML"

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



# ╔═╡ 5d159fd2-4c0f-11eb-2f04-3b9467554387
doc = parsexml(xml)

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

# ╔═╡ c04206f2-4c11-11eb-31c4-45d878cb2532
tei = namespace(doc.root)

# ╔═╡ fd0f6938-4c11-11eb-312f-c95356a03933
findall("//ns:div", doc.root, ["ns"=> tei]) 

# ╔═╡ Cell order:
# ╟─74a04cec-4c0f-11eb-342a-4febe21b36da
# ╟─3d48f8a4-4c0f-11eb-22b0-512a08a42041
# ╠═5dba54c8-4c0f-11eb-2dcc-d9dfb217a7a5
# ╠═5daadd5e-4c0f-11eb-307f-572d095cf26b
# ╠═5d159fd2-4c0f-11eb-2f04-3b9467554387
# ╠═d61c1370-4c0f-11eb-3187-eb30e0694af4
# ╠═d7f65038-4c10-11eb-2fb2-eb470cd75dbd
# ╠═7eee7f88-4c10-11eb-06b3-e5d98838308e
# ╠═8aa587ce-4c10-11eb-3f8e-552c82686791
# ╠═921e7a68-4c10-11eb-1c26-f98aec9e0c49
# ╠═687e3724-4c11-11eb-1e64-fb6efd5802ab
# ╠═c04206f2-4c11-11eb-31c4-45d878cb2532
# ╠═fd0f6938-4c11-11eb-312f-c95356a03933
