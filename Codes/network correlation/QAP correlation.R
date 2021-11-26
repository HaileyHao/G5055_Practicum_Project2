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

# Indonesia coefficient matrix


# install.packages("sna")
library(sna)
nl <- netlm(cm, tm)



# QAP regression between coefficient and text networks
# How much does being connected in the text network predict being connected in the advice network?