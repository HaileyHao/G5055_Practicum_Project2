library(network)
library(sna)
library(dplyr)

# 1. coefficient matrix
# Indonesia coefficient matrix
load("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/coefficient_network/indo_coefficient_net_weighted_sig.RData")
indo_cm <- cm

# Guatemala coefficient matrix
load("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/coefficient_network/gua_coefficient_net_weighted_sig.RData")
gua_cm <- cm


# positive to predict positive
# negative to predict negative

# positive networks
indo_cmP <- indo_cm
indo_cmP[indo_cmP < 0] <- 0
indo_cmP[indo_cmP > 0] <- 1

gua_cmP <- gua_cm
gua_cmP[gua_cmP < 0] <- 0
gua_cmP[gua_cmP > 0] <- 1


diffP <- setdiff(rownames(indo_cmP), rownames(gua_cmP))
common_for_qap <- setdiff(rownames(indo_cmP), diffP)
# diff2 <- setdiff(rownames(gua_cm), rownames(indo_cm))
# common_for_qap <- setdiff(rownames(gua_cm), diff2) # same result 87 common indicators

indo_cmP2 <- indo_cmP[common_for_qap, common_for_qap]
gua_cmP2 <- gua_cmP[common_for_qap, common_for_qap]


# OLS model # sig
nl_2countryP <- netlm(indo_cmP2, gua_cmP2)
summary(nl_2countryP)

# Net Logit model # sig, Total Fraction Correct: 0.8600518
nlo_2countryP <- netlogit(indo_cmP2, gua_cmP2)
summary(nlo_2countryP)

#-----------------------------------------------------------------------

# negative networks
indo_cmN <- indo_cm
indo_cmN[indo_cmN > 0] <- 0
indo_cmN[indo_cmN < 0] <- 1

gua_cmN <- gua_cm
gua_cmN[gua_cmN > 0] <- 0
gua_cmN[gua_cmN < 0] <- 1


diffN <- setdiff(rownames(indo_cmN), rownames(gua_cmN))
common_for_qap <- setdiff(rownames(indo_cmN), diffN)
# diff2 <- setdiff(rownames(gua_cm), rownames(indo_cm))
# common_for_qap <- setdiff(rownames(gua_cm), diff2) # same result 87 common indicators

indo_cmN2 <- indo_cmP[common_for_qap, common_for_qap]
gua_cmN2 <- gua_cmP[common_for_qap, common_for_qap]

# OLS model # sig
nl_2countryN <- netlm(indo_cmN2, gua_cmN2)
summary(nl_2countryN)

# Net Logit model # sig, Total Fraction Correct: 0.8600518
nlo_2countryN <- netlogit(indo_cmN2, gua_cmN2)
summary(nlo_2countryN)



