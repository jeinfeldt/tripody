# Tripody

Tripody is a small prototype project which has been developed in the context of the module Web Application Architecture in the wintersemester of 2016 at Stuttgart Media University. The module was offered by the graduate program Computer Science and Media. 

The goal of the module was to provide an insight to common approaches and best practices for developing web applications with focus on the technology and architecture. Students had to evaluate advantages and disadvantages regarding certain architectures and present them in presentations and a written assignment. 

The project group Tripody decided to create a web application, which provides the user with a small tool to create a notepad for a trip and enables him to list certain locations he wants to visit in a city of his choice.

The data is taken from the Yelp API, as a storage technology Redis has been chosen. The business logic is written with the slick Ruby Web Framework Sinatra.

In order to run the application you need to:  
1. Clone the repository  
2. Install rack  
3. Install redis  
4. Start redis on port 6767  
5. Rename default_credentials.rb to credentials.rb   
6. Provide Yelp API access information in credentials.rb  

The project has been created in order to demonstrate the idea and discuss certain architectural decisions and problems. 
Concept and the implementation have been prepared by 	Yael Bar-Zeev, Thomas Derleth, Jörg Einfeldt, Merle Hiort and Calieston Varatharajah.
