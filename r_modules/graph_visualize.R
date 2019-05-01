sg <- induced_subgraph(amzn_g, 1:500)
sg <- delete.vertices(sg, degree(sg) == 0)
plot(sg, vertex.label = NA, edge.arrow.width = 0,
edge.arrow.size = 0, margin = 0, vertex.size = 2)