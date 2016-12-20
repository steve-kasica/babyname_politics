read_state <- function(abbr, year) {
  state_data <- read.csv(paste("data/states/", abbr, ".TXT", sep=""),
    header = FALSE,
    colClasses = c("character", "character","numeric","character","numeric")
  )
  colnames(state_data) <- c("ABBR", "GENDER", "YEAR", "NAME", "VALUE")

  state_data <- subset(state_data, state_data$YEAR == year)

  # calculate ranks
  rank_names <- function(gender) {
    group <- subset(state_data, state_data$GENDER == gender)
    # they should be presorted, but can't be too careful
    group <- group[order(-group$VALUE, group$NAME),]
    group$RANK <- 1
    for (i in 2:NROW(group)) {
      if (group[i,]$VALUE < group[i-1,]$VALUE) {
        group[i,]$RANK <- i
      } else {
        group[i,]$RANK <- group[i-1,]$RANK
      }
    }
    return(group)
  }
  
  return(rbind(rank_names("F"), rank_names("M")))
}

read_national <- function(year) {
  national_data <- read.csv(paste("data/national/yob", year, ".txt", sep=""),
    header = FALSE,
    colClasses = c("character", "character","numeric")
  )
  colnames(national_data) <- c("NAME", "GENDER", "VALUE")
  
  # calculate ranks
  rank_names <- function(gender) {
    group <- subset(national_data, national_data$GENDER == gender)
    # they should be presorted, but can't be too careful
    group <- group[order(-group$VALUE, group$NAME),]
    group$RANK <- 1
    for (i in 2:NROW(group)) {
      if (group[i,]$VALUE < group[i-1,]$VALUE) {
        group[i,]$RANK <- i
      } else {
        group[i,]$RANK <- group[i-1,]$RANK
      }
    }
    return(group)
  }
  
  return(rbind(rank_names("F"), rank_names("M")))
}