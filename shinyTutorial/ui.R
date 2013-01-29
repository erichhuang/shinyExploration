library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title.
  headerPanel("Web Application for PI3K Pathway Activity Prediction in Breast Cancer"),
  
  # Sidebar with controls to select a dataset and specify the number
  # of observations to view. The helpText function is also used to 
  # include clarifying text. Most notably, the inclusion of a 
  # submitButton defers the rendering of output until the user 
  # explicitly clicks the button (rather than doing it immediately
  # when inputs change). This is useful if the computations required
  # to render output are inordinately time-consuming.
  sidebarPanel(
    selectInput("dataset", "Choose a patient:", 
                choices = c("Patient A", "Patient B", "Patient C")),
    
    helpText("Note: select the patient sample from the queue",
             "then click 'Update View'",
             "to obtain a summary of the patient's sample",
             "and a prediction of their PI3K Pathway Activity"),
    
    submitButton("Update View")
  ),
  
  # Show a summary of the dataset and an HTML table with the requested
  # number of observations. Note the use of the h4 function to provide
  # an additional header above each output section.
  mainPanel(
    h4("Summary"),
    verbatimTextOutput("summary"),
    
    h4('PI3K Activity Score'),
    verbatimTextOutput('prediction'),
    
    h4("PI3k Graphical Landscape (Selected Patient on far right)"),
    plotOutput("view")
  )
))