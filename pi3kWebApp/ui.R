library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title.
  headerPanel("Web Application for PI3K Pathway Activity Prediction in Breast Cancer"),
  
  # Sidebar panel
  # Selector for a queued patient sample with a button to submit it for 
  # analysis. Help text
  sidebarPanel(
    selectInput("dataset", "Choose a patient:", 
                choices = c("Patient A", "Patient B", "Patient C")),
    
    helpText("Note: select the patient sample from the queue",
             "then click 'Update View'",
             "to obtain a prediction of their PI3K Pathway Activity",
             "and where the patient's prediction plots",
             "in the 'landscape' of TCGA breast cancer patients.",
             "Each patient prediction is calculated and plotted",
             "in real time."),
    
    submitButton("Update View")
  ),
  

  # Main panel
  # Show a the prediction and show where the patient plots against the TCGA 
  # breast cancer cohort
  mainPanel(
    h4('PI3K Activity Score'),
    verbatimTextOutput('prediction'),
    
    h4("PI3K Graphical Landscape (Selected Patient on far right)"),
    plotOutput("view")
  )
))