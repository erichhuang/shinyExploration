## ui.R

## Erich S. Huang
## erich@post.harvard.edu

require(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel('Patient Array Queue'),
  
  sidebarPanel(
    selectInput('dataset', 'Choose a Queued Patient Sample:',
                choices = c('Patient_A', 'Patient_B', 'Patient_C')),
    helpText('Helpful text'),
    submitButton('Update View')
    ),
    
    # Display output
    mainPanel(
      h3('Test Output'),
      verbatimTextOutput('summary'),
      h4('More Test Output'),
      tableOutput('summary')
    )
  ))