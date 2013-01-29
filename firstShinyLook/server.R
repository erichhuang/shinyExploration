## server.R

## Erich S. Huang
## erich@post.harvard.edu

require(shiny)
require(synapseClient)

# Load 3 anonymized patient samples
patEnt <- loadEntity('syn1661926')

shinyServer(function(input, output){
  chooseSample <- reactive(function(){
    whichPatient <- input$variable
    patientSample <- patEnt$objects$patientList[[whichPatient]]
  })
})