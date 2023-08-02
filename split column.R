data <- data.frame(x = c("a-1", "b-2", "c-3"))
data

#   x
# 1 a-1
# 2 b-2
# 3 c-3


data.frame(do.call("rbind", strsplit(as.character(data$x), "-", fixed = TRUE)))

#     X1 X2
#  1  a  1
#  2  b  2
#  3  c  3