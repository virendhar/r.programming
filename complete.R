
# directory <- "C:/Users/virendhars/Desktop/L&D/Coursera/02_R_Programming/Project_Assignment/specdatatest/"
# id <- 1:3

complete <- function(directory,id = 1:332)   {

        data <- data.frame(Date= factor(), sulfate= integer(), nitrate = integer(), ID = integer())

        for (i in id){
                filepath<- paste(directory,sprintf('%03d',i),".csv",sep="")
                ##        print(paste("FilePath: ",filepath))
                tempdata<- read.csv(filepath, header=T, sep=",")
                ##        print(paste(i,nrow(tempdata)))
                data<-rbind(data,tempdata)
                tempdata<-NULL
        }

        ##print(paste("total loaded data",nrow(data)))
        OPdata <- data.frame(ID= integer(), DataCount = integer())
        CompleteCases  <- 0
        for ( j in 1){
                CurrID<-data$ID[1]
                PrevID<-data$ID[1]
                return
        }

        print (nrow(data))

        for ( j in 1:nrow(data)){
                CurrID<-data$ID[j]
                ##      print(paste("########Begin:      PrevID:",PrevID,", CurrID:",CurrID,",Counter:",CompleteCases))
                if(CurrID!= PrevID){
                        OPdata<- rbind(OPdata,data.frame(ID<-PrevID,DataCount<-CompleteCases))
                        CompleteCases<-0
                        PrevID<-CurrID
                }

                if ( !is.na(data$sulfate[j]) && !is.na(data$nitrate[j]) ){
                        CompleteCases<- CompleteCases+1
                }
                ##    print(paste("&&&&&&&&End:      PrevID:",PrevID,", CurrID:",CurrID,",Counter:",CompleteCases))
                PrevID<-CurrID
        }

        OPdata<- rbind(OPdata,data.frame(ID<-PrevID,DataCount<-CompleteCases))
        OPdata
}

## Sample Execution
##      directory <- "C:/Users/virendhars/Desktop/L&D/Coursera/02_R_Programming/Project_Assignment/specdata/"
##      complete(directory,c(2, 4, 8, 10, 12))