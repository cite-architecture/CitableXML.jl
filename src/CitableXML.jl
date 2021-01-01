module CitableXML


"Compose opening tag for an element"
function elementopen(n)
	"<$(n.name) " * join(map(a -> attstring(a), attributes(n)),"") * ">"
end

"Compose closing tag for an element"
function elementclose(n)
    "</" * n.name * ">"
end


"Compose name=value string for an attribute"
function attstring(a)
	"""$(a.name)="$(a.content)" """
end


function collecttext(e, s)
    # To be implemented
end

end # module
