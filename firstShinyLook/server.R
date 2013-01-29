## server.R

## Erich S. Huang
## erich@post.harvard.edu

require(shiny)
require(synapseClient)
require(datasets)

# ## Load 3 anonymized patient samples
# patEnt <- loadEntity('syn1661926')
# patientA <- patEnt$objects$patientList$patientA
# patientB <- patEnt$objects$patientList$patientB
# patientC <- patEnt$objects$patientList$patientC

## Server logic
shinyServer(function(input, output){
  
  ## Patient selection logic
  datasetInput <- reactive(function(){
    switch(input$dataset,
           'Patient_A' = rock,
           'Patient_B' = pressure,
           'Patient_C' = cars)
    })
  
  ## Model prediction
  output$summary <- reactivePrint(function(){
    dataset <- datasetInput()
    summary(dataset)
})
  
})