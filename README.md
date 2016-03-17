# Tripody

Tripody is a small prototype project which has been developed in the context of the module Web Application Architecture in the wintersemester of 2016 at Stuttgart Media University. The module was offered by the graduate program Computer Science and Media. Here is the demo page http://tripody.mi.hdm-stuttgart.de/

The goal of the module was to provide an insight to common approaches and best practices for developing web applications with focus on the technology and architecture. Students had to evaluate advantages and disadvantages regarding certain architectures and present them in presentations and a written assignment. 

The project group Tripody decided to create a web application, which provides the user with a small tool to create a notepad for a trip and enables him to list certain locations he wants to visit in a city of his choice.

The data is taken from the Yelp API, as a storage technology Redis has been chosen. The business logic is written with the slick Ruby Web Framework Sinatra.

In order to run the application you need to:  
1. Clone the repository  
2. Rename default_credentials.rb to credentials.rb   
3. Provide Yelp API access information in credentials.rb  
4. Install redis. Open a command shell, navigate into redis root directory and execute "redis-server.exe redis.windows.conf"
5. Open a command shell, navigate into project root directory and execute following commands
- *bundle install* to install specified gems from Gemfile
- *bundle update* to update all gems to the latest versions available
- *rackup* to start HTTP server WEBrick
6. Open *localhost:9292* in a browser

The project has been created in order to demonstrate the idea and discuss certain architectural decisions and problems. 
The concept and implementation have been prepared by 	Yael Bar-Zeev, Thomas Derleth, Jörg Einfeldt, Merle Hiort and Calieston Varatharajah.
