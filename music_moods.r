setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(caret)
library(reticulate)
library(readxl)
library(dplyr)
library(data.table)
library(corrgram)

#dataFile <- "britney-dziela_zebrane.txt"
dataFile_15_8k <- "music_data_2021-02-04.txt"

# loading music data
  dataRaw <- read.table(dataFile_15_8k, header = FALSE, sep = "\n")
  dataRaw[,] <- gsub('\\[',"",dataRaw[,])
  dataRaw[,] <- gsub('\\]',"",dataRaw[,])

  dataMusicRaw <- as.data.frame(dataRaw)
  dataMusic <- fread(text = unlist(dataMusicRaw))

  colnames(dataMusic) <- c("name","album","artist","id","release_date","popularity",
                           "length","danceability","acousticness","energy",
                           "instrumentalness","liveness","valence","loudness",
                           "speechiness","tempo","key","time_signature", "mode")
  
# data of interest
  doi <- dataMusic[,c("danceability","acousticness","energy","loudness","valence",
                      "tempo","key","time_signature","mode")]
  doi <- data.frame(lapply(doi, as.numeric))

  doi$diagnosis <- rep(0, dim(doi)[1])
  doi$diagnosis <-as.factor(doi$diagnosis)
  levels(doi$diagnosis) <-c("Happy", "Energetic", "Sad", "Calm")

  head(doi)
  summary(doi$Diagnosis)

# visual analysis
  
  par(mfrow=c(3,3))
  for(i in 1:9){hist(doi[[i]], data = doi, main=names(doi)[i])}
  
  describe(doi)
  
# groups  
  
  indexTrain <- createDataPartition(doi$danceability, p=0.7, list=FALSE)
  
  training <- doi[indexTrain,]
  testing <- doi[-indexTrain,]
  
# training model
  
  
  
  
  
  
  
  
  
  
  
  #for(i in 1:9){boxplot(doi[[i]] ~ diagnosis, data = doi, main=names(doi)[i])}; rm(i)
  #par(mfrow=c(1,1))
  #corrgram::corrgram(doi[,1:9], order=TRUE, lower.panel=corrgram::panel.ellipse, upper.panel=corrgram::panel.shade, text.panel=corrgram::panel.txt)






# dobry typo:
#   https://github.com/cristobalvch/Spotify-Machine-Learning/blob/master/clustering.R
  
# filmik jak zaczac w caret
#   https://www.youtube.com/watch?v=aBo6rngw1tU&list=WL&index=10&ab_channel=DataCamp

# spotipy documentation:
#   https://spotipy.readthedocs.io/en/2.16.1/

# python in R:
#   https://cran.r-project.org/web/packages/reticulate/vignettes/calling_python.html
#   https://rstudio.github.io/reticulate/

