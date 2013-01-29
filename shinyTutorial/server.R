library(shiny)
# library(datasets)
library(synapseClient)
library(randomForest)

# Load anonymized patient data
patEnt <- loadEntity('syn1661926')
patientA <- patEnt$objects$patientList$patientA
patientB <- patEnt$objects$patientList$patientB
patientC <- patEnt$objects$patientList$patientC

# Load PI3K model
modEnt <- loadEntity('syn1661928')
pi3kModel <- modEnt$objects$pi3kSelectModel

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
  
  # Return the requested dataset
  datasetInput <- reactive(function() {
    switch(input$dataset,
           "Patient A" = patientA,
           "Patient B" = patientB,
           "Patient C" = patientC)
  })
  
  # Generate a summary of the dataset
  output$summary <- reactivePrint(function() {
    dataset <- datasetInput()
    summary(dataset)
  })
  
  # Generate PI3K activity score
  output$prediction <- reactivePrint(function() {
    dataset <- datasetInput()
    samplePrediction <- predict(pi3kModel, dataset, type = 'prob')
    samplePrediction[2]
  })
  
  # Show the first "n" observations
  output$view <- reactivePlot(function() {
    hist(datasetInput())
  })
})