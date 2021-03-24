  #Download libraries
  ###################
  
  # This program you don't have to run each time.
  # If there is a new version of R it's worth checking if there is also an update of the package
  # Packages (zip files) are downloaded to a temporary folder C:\Users\srzten\AppData\Local\Temp\RtmpAXt6XV\downloaded_packages
  # Packages are automaticaly unpacked in C:\Program Files\R\R-3.5.1\library: .libPaths()
  
install.packages("DescTools", dependencies = TRUE)
library("DescTools")
install.packages("devtools", dependencies = TRUE) 
library("devtools") 
install.packages("Epi", dependencies = TRUE)  
library("Epi")
install.packages("foreign", dependencies = TRUE) 
library("foreign")  
install.packages("formattable", dependencies = TRUE) 
library("formattable")  
install.packages("gmodels", dependencies = TRUE)
library("gmodels")
install.packages("lubridate", dependencies = TRUE)
library("lubridate")
install.packages("popEpi", dependencies = TRUE)
library("popEpi")
install.packages("reshape", dependencies = TRUE)
library("reshape")
install.packages("RODBC", dependencies = TRUE)
library("RODBC")
install.packages("rpivotTable", dependencies = TRUE)
library("rpivotTable")
install.packages("sas7bdat", dependencies = TRUE)
library("sas7bdat")
install.packages("summarytools", dependencies = TRUE)
library("summarytools")
install.packages("tidyverse", dependencies = TRUE) #dplyr package
library("tidyverse") #The dplyr package is part of this package.
install.packages("XLConnect", dependencies = TRUE) #import Excel files
library("XLConnect") #import Excel files
install.packages("dplyr") #used for summarising data
library("dplyr")
install.packages("frequency")
library("frequency")
#install_github("ramnathv/htmlwidgets") 
#install_github("smartinsightsfromdata/rpivotTable")
#install.packages("tidyr")
#install.packages("cmprsk", dependencies = TRUE)
#library("cmprsk")