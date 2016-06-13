
initialDir = getwd()
setwd("/Users/yangbo/Documents/2016 spring/research/tensordata_compos/")
x <- read.table("matrix_ns_freq.txt",header=FALSE)
names(x) <- c('row','col','value')
mat <- matrix(0,length(unique(x$row)),length(unique(x$col)))
x$row <- x$row+1
x$col <- x$col+1
el <- cbind(a=x$row,b=x$col)
mat[el] <- x$value
mat_sum <- sum(mat)
mat <- mat/mat_sum 

write.table(mat, "mat.txt",sep="\t", col.names = F, row.names = F)


