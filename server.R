library(shiny)
library(UsingR)
library(stringr)
require(graphics)
library(reshape2)
library(ggplot2)

shinyServer(
  function(input, output) {
    
    bigone <- read.csv("bigone.txt")
    bigone$DATE_ON<-as.Date(bigone$DATE_ON)
    bigone$DATE_OFF<-as.Date(bigone$DATE_OFF)
    bigone$weeks<-(bigone$DATE_OFF+1-bigone$DATE_ON)/7
    bigone$decade<-paste0(str_pad(as.character(floor(as.numeric(substr(format(bigone$DATE_ON,format="%Y"),3,4))/10)*10),2,pad="0"),"'s")
 

      
 #     output$text1 <- renderText({ 
 #       paste("You have selected", input$explore)
 #     })
      
   output$printItOut <- renderTable({  
     if(input$explore == "art") {
       #How many number one songs did each artist achieve?    
        artistnumones<-data.frame(table(bigone$ARTIST))
        artistnumones<-artistnumones[order(artistnumones$Freq),]
        names(artistnumones)<-c("name","numnumones")   
        artistnumones
     }
  else if(input$explore == "song") {
     #Which songs reached the number one position more than once?
     songnumones<-data.frame(table(bigone$TITLE))
     songnumones<-songnumones[order(songnumones$Freq),]
     multihitwonders<-subset(songnumones,songnumones$Freq>1)
     names(multihitwonders)<-c("name","numnumones") 
     multihitwonders
     }  
  else if(input$explore == "dec") {
      #How many number one songs occurred during each decade?
      dec_table<-data.frame(table(bigone$decade))
      dec_table
      }
    })
 })
