library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title.
  headerPanel("Web Application for PI3K Pathway Activity Prediction in Breast Cancer"),
  
  # Sidebar panel
  sidebarPanel(
    selectInput("dataset", "Choose a patient:", 
                choices = c("Patient A", "Patient B", "Patient C")),
    
    helpText("Note: select the patient sample from the queue",
             "then click 'Update View'",
             "to obtain a prediction of their PI3K Pathway Activity",
             "and where the patient's prediction plots",
             "in the 'landscape' of TCGA breast cancer patients"),
    
    submitButton("Update View")
  ),
  
  # Additional sidebar
  sidebarPanel(
    helpText("The model for PI3K Pathway Activity is run in real",
             "time once the queued patient's data is submitted")
    ),
  
  # Show a the prediction and show where the patient plots against the TCGA 
  # breast cancer cohort
  mainPanel(
    h4('PI3K Activity Score'),
    verbatimTextOutput('prediction'),
    
    h4("PI3K Graphical Landscape (Selected Patient on far right)"),
    plotOutput("view")
  )
))