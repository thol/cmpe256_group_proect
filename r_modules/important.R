# Get unique Dates
d <- sort(unique(amzn_raw$date))
# Create graph from first date
amzn_g <- graph_from_data_frame(
amzn_raw %>%
filter(date == d[1]) %>%
select(from, to), directed = TRUE
)
# Find products that are "important"
high_out_degree <- degree(amzn_g, mode = "out") > 2
low_in_degree <- degree(amzn_g, mode = "in") < 1
importnant_nodes <- high_out_degree & low_in_degree
imp_prod <- V(amzn_g)[importnant_nodes]
# Store as a data frame to later join on
tmp_df <- data.frame(imp_prod = as.numeric(names(imp_prod)))