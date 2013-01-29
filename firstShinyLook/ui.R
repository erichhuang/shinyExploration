## ui.R

## Erich S. Huang
## erich@post.harvard.edu

require(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel('Patient Array Queue'),
  
  sidebarPanel(
    selectInput('variable', 'Patient in Queue:',
                list('No Patient Selected' = NULL,
                     'Patient A' = 1,
                     'Patient B' = 2,
                     'Patient C' = 3))
  ),
  
  mainPanel()
  
))