initialDir = getwd()
setwd("/Users/yangbo/Documents/2016 spring/research/tensordata_compos/")
##########################################
#########read in verbs and nouns##########
##########################################
df <- read.table('http://www.cs.ox.ac.uk/activities/compdistmeaning/GS2011data.txt',header=T)
verb <- read.table('verbs.989')
noun <- read.table('so.10057')

substrRight <- function(x, n){
  substr(x, 1, nchar(x)-n)
}
verb <- data.frame(lapply(verb, as.character), stringsAsFactors=FALSE)
verb <- data.frame(lapply(verb,substrRight,2))

noun <- data.frame(lapply(noun, as.character), stringsAsFactors=FALSE)
noun <- data.frame(lapply(noun,substrRight,2))
noun <- data.frame(lapply(noun, tolower), stringsAsFactors=FALSE)
##########################################
######convert verb and noun in GS2011data##
######to the corresponding number#########
###########################################
df <- data.frame(lapply(df, as.character), stringsAsFactors=FALSE)
V_num <- NULL
V=df$verb
for (i in 1:2500){
  V_num[i] <- which(verb==V[i])
}
V_num <- data.frame(V_num)

#noun <- tolower(noun)
#noun <- data.frame(noun)
O=df$object
O_num <- NULL
for (i in 1:2500){
  if (length(which(noun==tolower(O[i])))==0) {
    O_num[i] <- 0
  }
  else{O_num[i] <- which(noun==tolower(O[i]))}
}
O_num <- data.frame(O_num)


S=df$subject
S_num <- NULL
for (i in 1:2500){
  if (length(which(noun==tolower(S[i])))==0) {
    S_num[i] <- 0
  }
  else{S_num[i] <- which(noun==tolower(S[i]))}
}
S_num <- data.frame(S_num)

test <- cbind(V_num,S_num,O_num)

W <- read.table('W.txt')  #10057*300
##########################################
##replicate part 4 in paper##############
###########################################
# 4. Example
##########################################
###'athlete runs the race'###############
which(noun=="athlete")  #1484
W_athlete=W[1484,]
which(noun=="race")  #519
W_race=W[519,]
T_athlete_race=t(W_athlete)%*%as.matrix(W_race)
which(T_athlete_race == max(T_athlete_race), arr.ind = TRUE) #The index for maximum value is (154,119)
largest <- order(T_athlete_race, na.last=TRUE, decreasing=TRUE)[1:5] 
which(T_athlete_race==5.725355e-29,arr.ind = TRUE)
#s=sum(T_athlete_race)
#T_athlete_race[195,119]/s  #the value of index (195,119) 1.805552e-05
which(verb=="run")  #68
####Get the first five largest value and corresponding index
b <- data.frame(row = rep(1:300, 300), col = rep(1:300, each = 300), 
                x = as.vector(T_athlete_race)) 
# relatively time consuming...about 13.5 s on my machine 
bb <- b[rev(order(b$x, na.last = FALSE)), ] 
bb[1:5, ] 
#row col            x
#35554 154 119 7.139016e-25
#35492  92 119 6.447422e-25
#35594 194 119 6.119832e-25
#58654 154 196 4.385441e-25
#16954 154  57 4.153477e-25
##########################################
###'user runs the command'###############
which(noun=="user")  #1484
W_user=W[74,]
which(noun=="command")  #519
W_command=W[566,]
T_user_command=t(W_user)%*%as.matrix(W_command)
####Get the first five largest value and corresponding index
c<- data.frame(row = rep(1:300, 300), col = rep(1:300, each = 300), 
                x = as.vector(T_user_command)) 
# relatively time consuming...about 13.5 s on my machine 
cc <- c[rev(order(c$x, na.last = FALSE)), ] 
cc[1:5, ] 
#row col            x
#52094 194 174 2.149440e-24
#45194 194 151 1.400411e-24
#51915  15 174 1.238623e-24
#52074 174 174 8.248167e-25
#52124 224 174 8.091520e-25