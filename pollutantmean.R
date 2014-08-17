
pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## Create a null data frame
        data <- data.frame(Date= factor(), sulfate= integer(), nitrate = integer(), ID = integer())

        for (i in id){
                filepath<- paste(directory,sprintf('%03d',i),".csv",sep="")
                ##print(filepath)
                tempdata<- read.csv(filepath, header=T, sep=",")
                ##print(paste(i,nrow(tempdata)))
                data<-rbind(data,tempdata)
        }

        ##print(paste("total loaded data",nrow(data)))
        if (pollutant=="sulfate"){
                pollutantmean = mean(data$sulfate,na.rm = TRUE)
        } else if (pollutant=="nitrate"){
                pollutantmean = mean(data$nitrate,na.rm = TRUE)
        }
        ##print (pollutantmean)
         pollutantmean
}

## Sample Execution
## specdata <- "C:/Users/virendhars/Desktop/L&D/Coursera/02_R_Programming/Project_Assignment/specdata/"
## pollutantmean(specdata, "sulfate", 1:10)

