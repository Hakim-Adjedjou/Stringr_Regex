library(stringr)

field_names <- c("order_number", 
                 "order_date", "customer_email", "product_title", "amount")

res<- sub("_"," ",field_names) %>% 
  str_to_title() %>% str_pad(width = max(nchar(.)),"left",pad = " ") 


###########################################################################

addresses <- c("14 Pine Street, Los Angeles",
               "152 Redwood Street, Seattle", 
               "8 Washington Boulevard, New York")

res2<- str_match(addresses ,"(\\d+)\\s(.*),\\s(.*)") %>% .[,-1]

colnames(res2)<-c("HomeNumber","Street","City")

##########################################################################

employee_skills <- c("John Bale (Beginner)", 
                     "Rita Murphy (Pro)", 
                     "Chris White (Pro)",
                     "Sarah Reid (Medium)")

res3<-str_match(employee_skills,"(.*)\\((Pro|Medium).*") %>% .[,c(2:3)] 
colnames(res3)<-c("name","level")