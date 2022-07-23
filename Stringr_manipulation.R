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

#########################################################################

#web scrapping : 

library(rvest)

#choosing a topic from reddit : 

df<-read_html("https://www.reddit.com/r/worldnews/comments/w55y29/were_losing_but_moscow_will_never_admit_it/")

# returning the title tag : 
df %>% html_node("h1._eYtD2XCVieq6emjKBH3m") %>% html_text()

#returning all comments : 
comments<-df %>% html_nodes("div._3cjCphgls6DH-irkVaA0GM ")%>% html_text()

#returning time of the tweets : 
time_comments<-df %>% html_nodes("a._3yx4Dn0W3Yunucf5sVJeFU")%>% html_text()

#returning the names of those who wrote the tweets: 
user_reddit<-df %>% html_nodes("div._3cjCphgls6DH-irkVaA0GM") %>% html_text()