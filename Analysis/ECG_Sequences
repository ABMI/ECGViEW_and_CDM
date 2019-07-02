# Import relevant packages
install.packages('tidyverse')
install.packages('dplyr')
install.packages('arulesSequences')
library(dplyr)
library(tidyverse)
library(arulesSequences)

head(transactions)
class(transactions$ECGDATE)
head(trans_sequence)
table(trans_sequence$SIZE)

# Import standard transaction data
transactions <- ecg_severe
  
# Start time of data to be considered
start_month <- "1994-03-13"

# Create list of Azure services by customer ID and CleanMonth (formatted dates)
       trans_sequence <- transactions %>%
        group_by(PERSON_ID, ECGDATE) %>%
        summarize(
        SIZE = n(),
       ECG_FU_1 = paste(as.character(ECG_FU_1), collapse = ';')
       )
    
# not na + only f/u 
  install.packages('lubridate')
  library(lubridate)
  as.Date(transactions$ECGDATE[1:10])
  
  trans_sequence <- transactions %>%
    mutate(ECGDATE=as.Date(transactions$ECGDATE)) %>%
    group_by(PERSON_ID, ECGDATE) %>%
    summarize(
      SIZE = n(),
      ECG_FU_1 = paste(as.character(ECG_FU_1), collapse = ';')
    )
    
  data2<-trans_sequence[!grepl("NA.*", trans_sequence$ECG_FU_1),]
  personList<-as.data.frame(table(data2$PERSON_ID))
  personList$Var1<-as.character(personList$Var1)
  data3<-data2[data2$PERSON_ID %in% as.numeric(personList$Var1[personList$Freq>1]),]
  
  trans_sequence<-data3
  
# Make event and sequence IDs into factors
  elapsed_months <- function(end_date, start_date) {
    ed <- as.POSIXlt(end_date)
    sd <- as.POSIXlt(start_date)
    12 * (ed$year - sd$year) + (ed$mon - sd$mon) 
  }
  trans_sequence$eventID <- elapsed_months(trans_sequence$ECGDATE, start_month)
  trans_sequence = trans_sequence[,c(1,5,3,4)]
  names(trans_sequence) = c("sequenceID", "eventID", "SIZE", "items")
  trans_sequence <- data.frame(lapply(trans_sequence, as.factor))
  trans_sequence <- trans_sequence[order(trans_sequence$sequenceID, trans_sequence$eventID),]
  
# Convert to transaction matrix data type
  write.table(trans_sequence, "mytxtout.txt", sep=";", row.names = FALSE, col.names = FALSE, quote = FALSE)
  trans_matrix <- read_baskets("mytxtout.txt", sep = ";", info = c("sequenceID","eventID","SIZE"))
  
  s1 <- cspade(trans_matrix, parameter = list(support = 0.001, maxsize = 20, maxlen = 150), control = list(verbose = TRUE))
  s1.df <- as(s1, "data.frame")
  summary(s1)
  r1 <- as(ruleInduction(s1, confidence = 0.5, control = list(verbose = TRUE)), "data.frame")
  
  as(s1, "data.frame")
    
# Separate LHS and RHS rules
  r1$rulecount <- as.character(r1$rule)
  max_col <- max(sapply(strsplit(r1$rulecount,' => '),length))
  r_sep <- separate(data = r1, col = rule, into = paste0("Time",1:max_col), sep = " => ")
  r_sep$Time2 <- substring(r_sep$Time2,3,nchar(r_sep$Time2)-2)
  
# Strip LHS baskets
  max_time1 <- max(sapply(strsplit(r_sep$Time1,'},'),length))
  r_sep$TimeClean <- substring(r_sep$Time1,3,nchar(r_sep$Time1)-2)
  r_sep$TimeClean <- gsub("\\},\\{", "zzz", r_sep$TimeClean)
  r_sep_items <- separate(data = r_sep, col = TimeClean, into = paste0("Previous_Items",1:max_time1), sep = "zzz")
  
# Get cleaned temporal rules: time reads sequentially from left to right
  r_shift_na <- r_sep_items
  for (i in seq(1, nrow(r_shift_na))){
  for (col in seq(8, (6+max_time1))){
      if (is.na(r_shift_na[i,col])==TRUE){
        r_shift_na[i,col] <- r_shift_na[i,col-1]
        r_shift_na[i,col-1] <- NA  
      }
    }
  }
  names(r_shift_na)[2] <- "Predicted_Items"
  
  cols <- c(7:(6+max_time1), 2:5)
  temporal_rules <- r_shift_na[,cols]
  temporal_rules <- temporal_rules[order(-temporal_rules$lift, -temporal_rules$confidence, 
                                         -temporal_rules$support, temporal_rules$Predicted_Items),]
  
  write.csv(as.data.frame(temporal_rules), file = "TemporalRules.csv", row.names = FALSE, na="")
  
# Get unique frequent itemsets existing in rules (subset of those in s1.df)
  baskets_only <- temporal_rules[,1:(ncol(temporal_rules)-3)]
  basket_mat <- as.vector(as.matrix(baskets_only))
  freq_itemsets_in_rules <- unique(basket_mat[!is.na(basket_mat)])
  write.csv(as.data.frame(freq_itemsets_in_rules), file = "FreqItemsetsInRules.csv", row.names = FALSE)  
  
# APRIORI GRAPH
  ecg_severe_2<-querySql(conn,"SELECT Person_id, ecgdate, ECG_FU_1 FROM CDM_ECG_FU_A")
  head(ecg_severe_2)
  install.packages("arulesViz") 
  library(arulesViz)
  plot(ecg_severe_2)
  install.packages("arules")
  library(arules)
  help(Epub)
  read.transactions("dataset.csv")
  ecg_fu<-read.csv('TemporalRules.csv')
  Epub_rule_2 <- apriori(data = ecg_fu, 
                parameter = list(support = 0.001,  confidence = 0.20, minlen = 2))
  inspect(sort(Epub_rule_2, by = "lift")[1:20])
  rule_interest_lhs <- subset(Epub_rule_2, lhs %in% c("Previous_Items1"))
  inspect(rule_interest_lhs)
  plot(Epub_rule_2[50:100], method = "graph", 
            control = list(type="items"), 
             vertex.label.cex = 0.3,
             edge.arrow.size = 0.2,
             edge.arrow.width = 1)
    
  ecg_fu_2<-read.csv('output_1.csv')
  Epub_rule_3 <- apriori(data = ecg_fu_2, 
                         parameter = list(support = 0.001,  confidence = 0.20, minlen = 2))
  
  inspect(sort(Epub_rule_3, by = "lift")[1:20])
  rule_interest_lhs <- subset(Epub_rule_3, lhs %in% c("Previous_Items1"))
  inspect(rule_interest_lhs)
  plot(Epub_rule_3[50:100], method = "graph", 
       control = list(type="items"), 
       vertex.label.cex = 0.3,
       edge.arrow.size = 0.2,
       edge.arrow.width = 1)
