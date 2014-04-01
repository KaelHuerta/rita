library(GGally)

datos <- read.table(file = 'dvsd.out', sep = ",", header = TRUE)
head(datos)

#datos$qdelay <- cut(datos$avg_delay, quantile(datos$avg_delay, c(0,.1, .2, .3, .4, .5, .6, .7, .8, .9, 1)))
#tab <- xtabs(~ qdistance + qtime + qdelay, data = datos[datos$year == 2003, ])
#tab <- xtabs(avg_delay ~ qdistance + qtime, data = datos[datos$year == 2003, ])
#ftable(t.gen.age.sur)

#datos$avg_delay[is.na(datos$avg_delay)] <- 0

png('distance_vs_delay.png', width = 1360, height = 768)
#mosaic(tab, shade=TRUE, legend=TRUE)
ggpairs(datos)
dev.off()
