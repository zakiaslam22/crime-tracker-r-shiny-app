# USA Crime Tracker (R Shiny App)

## Overview
This app is a simplified R Shiny version of our group **USA Crime Tracker** dashboard.  
The goal of the app is to allow users to explore violent crime trends across different police departments over time.

Users can select a department from the dropdown menu and view:
- A plot showing violent crime trends over time
- A table displaying crime statistics for the selected department

This app demonstrates the core functionality of the group project using **R Shiny** instead of Python Shiny.

---

## Live App
The deployed version of the app can be accessed here:

**[Add your Posit Connect Cloud deployment link here]**

## Installation

To run the app locally, install the required R packages:

```r
install.packages(c("shiny", "ggplot2", "dplyr", "readr"))
```

## Run the App Locally

Clone the repository and run: R -e "shiny::runApp()"

## Data
The dataset contains crime statistics by police department and year.
