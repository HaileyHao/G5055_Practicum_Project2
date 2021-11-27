# We need to admit: caveats of statistical inference with networks:----
# In networks: Non-independence of observations
# The inference problem: The non-independence of observations affects the standard errors, not the coefficients. 
# To relieve this problem, we adjust standard errors by permuting rows and columns in the matrix, while maintaining the underlying relationship. -- QAP
# QAP – the Quadratic Assignment Procedure - https://www.stata.com/meeting/1nasug/simpson.pdf


# QAP correlation between coefficient network and text network
# How strongly are the text network and coefficient network correlated?

# # load the 2 networks for Indonesia----
# ## 1. coefficient network
# load("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/coefficient_network/indo_coefficient_net.RData")
# 
# ## 2. text network
# load("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/Text_Model_Data/text_net.RData")


# 1. coefficient matrix
# Indonesia coefficient matrix
load("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/PCA_results/indo_coefficient_matrix.RData")
indo_cm <- x
# Guatemala coefficient matrix
load("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/PCA_results/gua_coefficient_matrix.RData")
gua_cm <- x

# 2. text similarity matrix
load("/Users/hailey/Documents/GitHub/G5055_Practicum_Project2/Data/Text_Model_Data/text_matrix.RData")
tm <- m



# rownames(indo_cm) ==  colnames(indo_cm)
rownames(indo_cm)
rownames(gua_cm)
length(rownames(indo_cm))
length(rownames(gua_cm))
length(rownames(tm))
rownames(tm) # the whole list 
indo_tm <- tm[rownames(indo_cm), rownames(indo_cm)]
gua_tm <- tm[rownames(gua_cm), rownames(gua_cm)]


# install.packages("sna")
library(sna)
indo_nl <- netlm(indo_cm, indo_tm)
summary(indo_nl)


gua_nl <- netlm(gua_cm, gua_tm)
summary(gua_nl)

# QAP regression between coefficient and text networks
# How much does being connected in the text network predict being connected in the advice network?




# QAP regression between

diff1 <- setdiff(rownames(indo_cm), rownames(gua_cm))
common_for_qap <- setdiff(rownames(indo_cm), diff1)
# diff2 <- setdiff(rownames(gua_cm), rownames(indo_cm))
# common_for_qap <- setdiff(rownames(gua_cm), diff2) # same result 87 common indicators

indo_cm2 <- indo_cm[common_for_qap, common_for_qap]
gua_cm2 <- gua_cm[common_for_qap, common_for_qap]


summary(netlm(indo_cm2, gua_cm2))





