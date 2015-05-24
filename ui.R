library(shiny)


shinyUI( 
      
     # Use a fluid Bootstrap layout 
     fluidPage(     
          
         # Give the page a title 
         titlePanel("Song Chart And Position Explorer"), 
          
         # Generate a row with a sidebar 
         sidebarLayout(       
              
             # Define the sidebar with one input 
             sidebarPanel( 
                 selectInput("explore", "Choose a question to explore:",  
                     choices = list("How many number one songs occurred during each decade?" = "dec",
                                       "How many number one songs did each artist achieve?" = "art",
                                       "Which songs reached the number one position more than once?" = "song"),
                             selected = "song"), 
             
                 
                 hr(), 
                 helpText("Data from Billboard Magazine Hot 100.") 
               ), 
              
             # Create a spot for the plot 
             mainPanel(
               #textOutput("text1")
               
               tableOutput("printItOut")
                )               
           ) 
       ) 
)



