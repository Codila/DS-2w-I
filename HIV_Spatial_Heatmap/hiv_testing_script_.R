library(readxl)
kn<- read_excel("C:/Users/Varun-PC/Desktop/HIV_Hack/Kenya/Kenya_PR_RT_IN_Patients - Varun.xlsx",sheet="RT")
View(kn)

str(kn)
kn<- data.frame(kn,stringsAsFactors = T)
kn
str(kn)
head(kn
	 kn$Common<- NULL

	 str(kn)

	 attributes(kn)
	 kn<- data.frame(kn,stringsAsFactors = T)
	 kn$Common<- NULL
	 grouping<-kn[c(7:8)]
	split_kn<-split(kn,grouping)
	split_kn
	str(split_kn)
str(kn)
ii <- grouping(x <- c(1, 1, 3:1, 1:4, 3), y <- c(9, 9:1), z <- c(2, 1:9))
## 6  5  2  1  7  4 10  8  3  9
rbind(x, y, z)[, ii]
