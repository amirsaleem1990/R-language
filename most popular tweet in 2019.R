# https://media.licdn.com/dms/image/C4E22AQHOioOT-XDMEQ/feedshare-shrink_800/0?e=1580947200&v=beta&t=DUlwNp1F_62s4lzCH1DR6jHJBDpXq8F2-NTnmZNWtYc

library(rtweet)
library(tidyverse)
library(lubridate)

show_most_popular_tweet <- function(user){
	get_timeline(user, n=3200) %>% 
		mutate(year = year(created_at)) %>%
		filter(year = 2019) %>% 
		arrange(-favorite_count) %>% 
		slice(1) %>%
		pull(status_id) %>% 
		paste0("https://twitter.com/", user, "/status/", .) %>% 
		browseURL()
}

show_most_popular_tweet("nnstats")