if(!requireNamespace("nCov2019")) {
  devtools::install_github("GuangchuangYu/nCov2019")
}
x1 <- nCov2019::load_nCov2019(lang = 'en')
hubei = x1$province[which(x1$province$province == 'Hubei'), ]
hubei$deaths = c(0, diff(hubei$cum_dead))
italy = x1$global[which(x1$global$country == 'Italy'), ]
italy$deaths = c(0, diff(italy$cum_dead))
x = list(Hubei= hubei, Italy=italy)

for(D in names(x)) {
  plot(x[[D]][,c('time','deaths')], xlim = as.Date(c('2020/1/10', '2020/4/1')))
}