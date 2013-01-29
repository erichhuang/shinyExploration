library(shiny)
# library(datasets)
library(synapseClient)
library(randomForest)
library(ggplot2)

# Load anonymized patient data
patEnt <- loadEntity('syn1661926')
patientA <- patEnt$objects$patientList$patientA
patientB <- patEnt$objects$patientList$patientB
patientC <- patEnt$objects$patientList$patientC

# Load TCGA breast cancer population dataframe
dfEnt <- loadEntity('syn1662368')
patientDF <- dfEnt$objects$patientDF

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
  
  # Show a graphical respresentation of the PI3K activity landscape
  output$view <- reactivePlot(function() {
    dataset <- datasetInput()
    samplePrediction <- predict(pi3kModel, dataset, type = 'prob')
    foo <- samplePrediction[2]
    dfRow <- data.frame('newSample', 
                        foo, 
                        stringsAsFactors = FALSE)
    
    colnames(dfRow) <- colnames(patientDF)
    fullDF <- rbind(patientDF, dfRow)
    
    fullValidBoxPlot <- ggplot(fullDF, aes(factor(mutation), pi3kActivityScore)) +
      geom_boxplot() +
      geom_jitter(aes(colour = as.factor(mutation), size = 4)) +
      ggtitle('Population Predicted PI3K Activity Scores\n') +
      geom_hline(yintercept = 0.3, linetype = 'dotted', colour = 'red') +
      scale_x_discrete(limits = c('wt', 'pik3ca', 'pten', 'pik3r1', 'akt', 'mult', 'newSample')) +
      xlab('\nmutation') +
      ylab('pi3k activity score\n') +
      scale_size(guide = 'none')
    
    show(fullValidBoxPlot)
  })
})