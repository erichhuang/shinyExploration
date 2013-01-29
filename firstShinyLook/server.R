## server.R

## Erich S. Huang
## erich@post.harvard.edu

require(shiny)
require(synapseClient)

patEnt <- loadEntity('syn1661926')
patientA <- patEnt$objects$patientList$patientA
patientB <- patEnt$objects$patientList$patientB
patientC <- patEnt$objects$patientList$patientC

shinyServer(function(input, output){
  chooseSample <- reactive(function(){
    patientSample <- patEnt$objects$patientList$patientA
  })
})