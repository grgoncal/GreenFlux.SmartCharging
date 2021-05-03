In total I have spent:

 - 4 (16%~) hours setting up the environment (I did not have mysql, libraries and sonar installed)
 - 2 (8%~) hours reading requirements
 - 4 (16%~) hours creating DDD and base classes
 - 6 (25%~) hours creating the solution (business classes)
 - 4 (16%~) hours creating tests
 - 2 (8%~) hours creating/designing database
 - 2 (8%~) hours setting up and having a look arround sonarqube

Total: 24 hours

Sonar Lint wasn't really necessary but I decided that this could be an opportunity to use it. (sorry, but I kinda had a lot of fund making this)

If I had more time I would spend more time designing more integrated tests and would have created another project within the solution for unit testing. 
I also did not implement any of the docker features itself, I'm missing the dockerfile and kubernetes.{env}. 
This project would be easily transformed into a lambda aswell by doing some simple changes (but since its an api, provisioned concurrency would be a must have)