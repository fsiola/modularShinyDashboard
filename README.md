# modularShinyDashboard
A modular shinyDashboard based mostly on naming conventions

# Usage
Create a folder inside "modules" folder containg the following files:
 - ui.R: this file holds the UI structure of your module and the link to be added to the sidebar.
 - server.R: this file holds the server strcuture of your module.
 - OnLoad.R: this file holds all run-once code of your module.

For reference, please check the HelloWorld module.
 
## ui.R
You should create your UI just like any other Shiny page. There are two things you should do here:
 - The UI must be assigned to a tabItem variable with naming matching the "\*TabPage\*" pattern.
 - You must provide a menuItem variable with naming matching the "\*LinkPage\*" pattern.
 
## server.R
Place here all your server functions that uses the $output Shiny variable.

## OnLoad.R
Place here all functions from your module that should run only once the Shiny application is loaded.

