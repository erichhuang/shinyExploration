## server.R

## Erich S. Huang
## erich@post.harvard.edu

require(shiny)
require(synapseClient)

## Load 3 anonymized patient samples
patEnt <- loadEntity('syn1661926')

## Server logic
shinyServer(function(input, output){
  
  ## Patient selection logic
  chooseSample <- reactive(function(){
    whichPatient <- input$variable
    patientSample <- patEnt$objects$patientList[[whichPatient]]
  })
  
  ## Model prediction
  output$prediction
  
})