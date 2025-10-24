Self Evaluation 2020

Go through your process of learning, projects, help received, tangible outcome and behaviors from that outcome.
Specific to your process. Your contributions as an individual.

List by outcomes
Bullet the behaviors that come from it
Goals and how your stuck up to them


Evaluation:
As a new TLP, I haven't been at Target for very long, but even so, I feel that I've made quite a few strides.

In the short time, I've been here I've:

Produce an API to learn majorly used services:
- Created a project involving: Feign Client to produce interactions between a MongoDB  and Kafka producer & consumer

Took on the task of developing a spike:
- Held team discussions to formulate the design aspect for the new functionality
- Create stories to produce the results from the  discussion
- Discovered the api needed to be updated before new functions can be implemented
- Updated the Kafka and Mongo services
- Implemented new endpoint functionality involving the new Kafka and Mongo implementations
- Updated Api-spec(swagger documentation) for new functionality
- Formulated Pull Request Template(github) to better document the changes
- After pull request was merged, created new cluster in TAP to run the updated api(darre1odr)

Created a Metric Alert for analytics
- Used Grafana to make a table showcasing the rate at which an app(darre1app) fails at posting messages
- Created shuttleIO alert to post when once every 24hr if the threshold is surpassed

Peered with Team members to better understand Target development process and technology
- Pull request formalities
- API directory format, key values/secrets, etc
- Docker Usages
- Mongo/Kafka utilities
- Grafana functionality
- Team functions/ API repo analysis

Experiences of Note:
1. When updating the API ODR with the new endpoints I ran into an issue. Although the code completed its purpose, it came with the drawback of being slow, update restrictive, and overall difficult to understand by others. As I was dissatisfied with this I contacted my team through slack for a possible solution. After pairing and discussion, they introduced me to the process of using data transfer objects(dto).  With the DTOs I was able to remove the restrictive portions of code and in turn was able to increase the speed for heavier loads to 5 seconds. 

