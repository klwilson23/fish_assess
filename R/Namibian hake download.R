install.packages("remotes")
remotes::install_github("smartell/CatchMSY")
library(catchMSY)
hake <- data(NamibianHake)
hake$data
hake_data <- catchMSY::hake$data
saveRDS(hake_data,file="Data/namibian_hake.rds")
