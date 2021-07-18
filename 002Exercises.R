  #R training
  #100Exercises.R
  #############################################
  
  #1. Import the CSV file Insurance_Data.csv --> it's stored in the data folder
  
  path <- "C:/Users/Marco/Desktop/Github/R_Exercises" 
  data_path <- paste0(path,"/data") 
  
  csv.file <- file.path(paste0(data_path,"/Insurance_Data.csv"))
  dfCSV <- read.csv(csv.file, sep = ";") 
  
  #############################################################################################################################

  #2. Make sure that the dates are in a date format --> see 003_dates.R row 37. Just shuffle a bit the 3 letters
  #These functions are from the lubridate package. See: https://cran.r-project.org/web/packages/lubridate/lubridate.pdf
  #To see what type the variables are click on the blue circle next to the dataset name in the console
  
  dfCSV$dob <- dmy(dfCSV$dob)
  dfCSV$doissue <- dmy(dfCSV$doissue)
  dfCSV$Reporting.date <- dmy(dfCSV$Reporting.date)
  dfCSV$dom <- dmy(dfCSV$dom)

  
  #############################################################################################################################

  #3. Rename the variable Reporting.date to reportD
  #You'll see %>%, this strange "operator" allows to combine more functions from the dplyr package as you will see later again.
  
  dfCSV <- dfCSV %>% rename(reportD=Reporting.date) 
  
  #############################################################################################################################

  #4. Create frequency tables for: gender, product, smoker and mov
  #Try also the pivot table in R
  #How many smokers are females?
  #How many death claims do you see?
  
  freqTab <- freq(dfCSV$gender, order = "freq")
  freqTab <- freq(dfCSV$product, order = "freq")
  freqTab <- freq(dfCSV$mov, order = "freq")
  
  CrossTable(dfCSV$product,dfCSV$gender) #console output, like SAS
  
  rpivotTable(dfCSV, rows="gender", col="smoker", aggregatorName="Sum", vals="mov", rendererName="Table", subtotals = "TRUE") #pivot table, easy to switch between count and percentage
  
  #############################################################################################################################

  #5. Create a new dataset dfClaims with only the claims
  dfClaims <- filter(dfCSV, mov == "Death")

  
  #############################################################################################################################
  
  #6. What is the total claim amount (sum sa in the claim data frame) and what is the maximum claim amount?
  
  max(dfClaims$sa)
  sum(dfClaims$sa)
  
  #############################################################################################################################

  #7. Are there any insid that appear more then once?
  #Check for duplicates and create a dataset with all these duplicates

  dfCSV$nn <- 1
  dups <- dfCSV %>% group_by(insid) %>% summarise(nsum = sum(nn, na.rm = TRUE)) #duplicates by variables how often record appears.
  dups <- dups %>% filter(nsum > 1)
  
  dups1 <- inner_join(dfCSV,dups,by="insid")
  
  
  
  #############################################################################################################################

  #8. Keep only one record per insid.
  #Work with by groups and make sure you understand each part of the code.
  
  dfCSV1 <- dfCSV %>% group_by(insid) %>% arrange(insid) %>% filter(row_number()==1) 
  
  #############################################################################################################################

  #9. Create a new variable failure. If mov = Death then failure = 1, if mov = Expiry then failure = 3 and 
  #if mov = Lapse then failure = 4, else failure = 0
  #You will see that there is no "if then" in R for data frames and the if then else looks more like in Excel.
  
 
  dfCSV$failure <- ifelse(dfCSV$mov == "Death",dfCSV$failure <- 1, ifelse(dfCSV$mov == "Expiry",dfCSV$failure <- 3, ifelse(dfCSV$mov == "Lapse",dfCSV$failure <- 4, dfCSV$failure <- 0))) #if product name = CQP011 then n = 1 else n = 2
  
  freqTab <- freq(dfCSV$failure)
  
  freqTab
  
  #############################################################################################################################

  #10. Calculate the age nearest at issue and save the value in a new variable ageAtIssue.
  #you need to combine round, time_length and interval --> check R help
  
  dfCSV$int <- interval(ymd(dfCSV$dob), ymd(dfCSV$doissue))
  dfCSV$ageAtIssue <- round(time_length(dfCSV$int, unit="year"),digits = 0)

  print(dfCSV)
  
