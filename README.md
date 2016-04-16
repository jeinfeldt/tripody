# Tripody

Tripody is a small prototype project which has been developed in the context of the module Web Application Architecture in the wintersemester of 2016 at Stuttgart Media University. The module was offered by the graduate program Computer Science and Media. Here is the demo page http://tripody.mi.hdm-stuttgart.de/

The goal of the module was to provide an insight to common approaches and best practices for developing web applications with focus on the technology and architecture. Students had to evaluate advantages and disadvantages regarding certain architectures and present them in presentations and a written assignment. 

The project group Tripody decided to create a web application, which provides the user with a small tool to create a notepad for a trip and enables him to list certain locations he wants to visit in a city of his choice.

## Technology
- Data: Yelp API
- Data storage: Redis 
- Business logic: Ruby Web Framework Sinatra.
## Installation
In order to run the application you need to:  
1. Clone the repository  
2. Rename default_credentials.rb to credentials.rb   
3. Provide Yelp API access information in credentials.rb  
4. Install redis. Open a command shell, navigate into redis root directory and execute "redis-server.exe redis.windows.conf"
5. Open a command shell, navigate into project root directory and execute following commands
- ``` bundle install (install specified gems from Gemfile) ```
- ``` bundle update (update all gems to the latest versions available) ```
- ``` rackup (start HTTP server WEBrick) ```
6. Open *localhost:9292* in a browser

## Team
The project has been created in order to demonstrate the idea and discuss certain architectural decisions and problems. 
The concept and implementation have been prepared by 	
- [Yael Bar-Zeev](https://github.com/yaelbz)
- [Thomas Derleth](https://github.com/tderleth)
- [Jörg Einfeldt](https://github.com/jeinfeldt)
- [Merle Hiort](https://github.com/mhiort)
- [Calieston Varatharajah](https://github.com/Calieston)
