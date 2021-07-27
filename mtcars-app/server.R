library(shiny)

shinyServer(function(input, output) {
    
    mtcars$carb <- factor(mtcars$carb)
    mtcars$cyl <- factor(mtcars$cyl)
    mtcars$vs <- factor(mtcars$vs)
    mtcars$am <- factor(mtcars$am)
    mtcars$gear <- factor(mtcars$gear)
    
    
    
    observeEvent(input$button, {
        selected_model <- "mpg~"
        num_params = 0
        if(input$gear) {
            selected_model<-paste0(selected_model,"gear+")
            num_params = num_params+1
        }
        
        if(input$carb){
            selected_model<-paste0(selected_model,"carb+")
            num_params = num_params+1
        }
        
        if(input$cyl){
            selected_model<-paste0(selected_model,"cyl+")
            num_params = num_params+1
        }
        
        if(input$disp){
            selected_model<-paste0(selected_model,"disp+")
            num_params = num_params+1
        }
        
        if(input$hp){
            selected_model<-paste0(selected_model,"hp+")
            num_params = num_params+1
        }
        
        if(input$drat){
            selected_model<-paste0(selected_model,"drat+")
            num_params = num_params+1
        }
        
        if(input$wt){
            selected_model<-paste0(selected_model,"wt+")
            num_params = num_params+1
        }
                    
        if(input$qsec){
            selected_model<-paste0(selected_model,"qsec+")
            num_params = num_params+1
        }
        
        if(input$vs){
            selected_model<-paste0(selected_model,"vs+")
            num_params = num_params+1
        }
        
        if(input$am){
            selected_model<-paste0(selected_model,"am+")
            num_params = num_params+1
        }
        if(num_params==0){
        }
        else{
            selected_model<-substr(selected_model, 1, nchar(selected_model)-1)
            train_model = lm(formula=as.formula(selected_model), data = mtcars)
            model_summary = summary(train_model)
            output$model_summary <- renderPrint({model_summary})
        }
    })
})
