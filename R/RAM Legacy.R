# install.packages("devtools")
# library(devtools)
# install_github("ropensci/ramlegacy")
# load("~/My Drive/SFU REM/Courses/REM 423_613/Datasets/R Data/DBdata[asmt][v4.65].RData",  temp_env <- new.env())
# data <- as.list(temp_env)
# library("ramlegacy")
# saveRDS(data,file="~/My Drive/SFU REM/Courses/REM 423_613/Datasets/R Data/RAM_4.65.rds")
# ramlegacy::download_ramlegacy(ram_path = NULL,ram_url = "https://doi.org/10.5281/zenodo.11995054")
# ramlegacy::load_ramlegacy()
# data <- ramlegacy::load_ramlegacy()

library("tidyverse")
data <- readRDS(file="~/My Drive/SFU REM/Courses/REM 423_613/Datasets/R Data/RAM_4.65.rds")
ts <- data$timeseries
stock <- data$stock
ts_views <- data$timeseries_values_views
data$r.data$SSALMADAMS

ram_dat <- select(stock, stockid, scientificname, commonname, region) %>%
  inner_join((ts_views))
rec_dat <- ram_dat %>%
  mutate("stock_num"=as.numeric(as.factor(stockid))) %>%
  group_by(stockid) %>%
  filter(!all(is.na(R)) & !all(is.na(SSB))) %>%
  ungroup()
sub_stocks <- sample(1:max(rec_dat$stock_num),15)
rec_sub <- rec_dat[rec_dat$stock_num %in%sub_stocks,]
# ram_dat <- inner_join(ram_dat,ts_list,by=c(stockid, scientificname, commonname, region))
qb_dat <- ram_dat[ram_dat$stockid=="QROCKPCOASTOUT",]##stockid=="QROCKPCOASTOUT"
adams_dat <- ram_dat[ram_dat$stockid=="SSALMADAMS",]##stockid=="QROCKPCOASTOUT"

library(ggplot2)
head(qb_dat,2)
ggplot(data=rec_sub,aes(x=SSB,y=R)) +
  geom_point()+
  geom_smooth(method="gam")+
  facet_wrap(~stockid,scales="free") +
  theme_minimal()
