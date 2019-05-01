## Create list to hold output
time_graph <- list()

## Create a 2x2 layout for plots and increase margins
par(mfrow = c(2, 2), mar = c(1.1, 1.1, 1.1, 1.1))
## Loop over the data to build
for(i in 1:length(d)){
## Create a data frame at each time stamp
ip_df <- amzn_raw %>%
filter(date == d[i]) %>%
right_join(tmp_df, by = c("from" = "imp_prod")) %>%
na.omit()
## Create an igraph object from that data frame
time_graph[[i]] <- ip_df %>%
select(from, to) %>%
graph_from_data_frame(directed = TRUE)
## See what important vertices look like by date
plot(time_graph[[i]], main = d[i])