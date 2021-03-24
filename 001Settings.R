
  
  companyName <- "Clal"
  ageDef <- "ageNearest"
  
  obsstart <- as.Date("2012/01/01")
  obsend <- as.Date("2018/01/01")
  
  #Set path and working folder
  path <- "C:/Users/Marco/Desktop/Github/R_Exercises"
  datasets <- paste0(path,"/datasets") 
  data_path <- paste0(path,"/data") 
  setwd(datasets) #set working directory
  #getwd()
 
  #load R Libraries
  library("DescTools")
  library("devtools") 
  library("Epi")  
  library("foreign")  
  library("formattable")  
  library("gmodels")
  library("lubridate")
  library("plyr")
  library("popEpi")
  library("reshape")
  library("RODBC")
  library("rpivotTable")
  library("sas7bdat")
  library("summarytools")
  library("tidyverse") #The dplyr package is part of this package.
  library("XLConnect") #import Excel files
  library("dplyr")
  #update.packages()

  