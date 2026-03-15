library(shiny)
library(ggplot2)
library(dplyr)
library(readr)

crime_data <- read_csv("data/crime_rate_data_raw.csv")

ui <- fluidPage(
  titlePanel("USA Crime Tracker (R Shiny)"),

  sidebarLayout(
    sidebarPanel(
      selectInput(
        "department",
        "Choose a city / department:",
        choices = sort(unique(crime_data$department_name)),
        selected = sort(unique(crime_data$department_name))[1]
      )
    ),

    mainPanel(
      plotOutput("crime_plot"),
      br(),
      tableOutput("crime_table")
    )
  )
)

server <- function(input, output, session) {

  filtered_data <- reactive({
    crime_data %>%
      filter(department_name == input$department) %>%
      arrange(year)
  })

  output$crime_plot <- renderPlot({
    ggplot(filtered_data(), aes(x = year, y = violent_crime)) +
      geom_line() +
      geom_point() +
      labs(
        title = paste("Violent Crime Over Time:", input$department),
        x = "Year",
        y = "Violent Crime"
      ) +
      theme_minimal()
  })

  output$crime_table <- renderTable({
    filtered_data() %>%
      select(
        year,
        department_name,
        total_pop,
        violent_crime,
        violent_per_100k
      )
  })
}

shinyApp(ui = ui, server = server)