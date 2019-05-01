#Create graph from subset
amzn_g <- amzn_raw %>%
	filter(date == "2003-03-02") %>%
	select(from, to) %>% 
	graph_from_data_frame(directed=TRUE)
#Size your graph 
gorder(amzn_g)
gsize(amzn_g)