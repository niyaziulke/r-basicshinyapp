library(shiny)

shinyUI(
    fluidPage(
        titlePanel("Choose a Linear Model that Predicts MPG(Miles per Gallon) of Cars"),
        sidebarLayout(
            sidebarPanel(width=6,
                         strong("Choose Parameters"),
                         checkboxInput("cyl", "Number of cylinders(cyl)"),
                         checkboxInput("disp","Displacement(disp)"),
                         checkboxInput("hp","Gross Horsepower(hp)"),
                         checkboxInput("drat","Rear Axle Ratio(drat)"),
                         checkboxInput("wt","Weight(wt)"),
                         checkboxInput("qsec","1/4 Mile Time(qsec)"),
                         checkboxInput("vs","Engine Shape(vs)"),
                         checkboxInput("am", "Automatic/Manual(am)"),
                         checkboxInput("gear","Number of Forward Gears(gear)"),
                         checkboxInput("carb","Number of Carburetors(carb)"),
                         actionButton("button", "Build model with selected parameters")
                        ),
                             
            mainPanel(
                verbatimTextOutput("model_summary")
            )
        )
    )
)

