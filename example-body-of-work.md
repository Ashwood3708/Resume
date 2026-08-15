# Kapil Gangwal - Profile and Body of Work

## Table of Contents

- [Kapil Gangwal - Profile and Body of Work](#kapil-gangwal---profile-and-body-of-work)
    - [Introduction](#introduction)
    - [Responsibilities](#responsibilities)
    - [Major projects in Target](#major-projects-in-target)
        -  [Move Platform Common Pack&Ship Solution](#move-platform-common-packship-solution)
        -  [Flexible fulfillment](#flexible-fulfillment)
    - [Product Performance and Stability](#product-performance-and-stability)
    - [Collab at Target](#collab-at-target)
        - [Pull Requests](#pull-requests)
        - [Innovative Ideas](#innovative-ideas)
            - [App Feedback](#app-feedback)
            - [Find My Container](#find-my-container)
    - [Development Work Examples](#development-work-examples)
    - [Shadow managing](#shadow-managing)
    - [Recommendations and Recognitions](#recommendations-and-recognitions)
    - [Technical Skill Set](#technical-skill-set)
    - [References](#references)


## Introduction
I have over 21 years of experience in the software industry, covering all phases of the SDLC and leading multiple functional teams. For the past 10+ years, I've been working at Target.
My journey with Target began in January 2013 when I started leading both onshore and offshore teams to develop a POC for the Ship from Store (SFS) capability using the Manhattan package. After a successful POC, we rolled out the SFS functionality from a single store to over 1,400 stores.
In 2017, I led a team to build a custom application for pack and ship functionalities, successfully replacing the Manhattan package across those 1,400+ stores. By 2018, the Manhattan package was fully decommissioned. I also spearheaded the development of several applications to support SFS outbound functionalities, including Prep, Pack, Sort, Ship, SPACE, Store Hold Space Manager, and mySupplies.
In recent years, I have led technical teams and multiple product enablement initiatives, such as Pack & Ship, Ship to Store, SPACE, Stores mySupplies, Grocery Capacity, and Store Hold Space Manager. Starting in 2022, as part of the MOVE platform initiative, I began leading a new team to develop a custom solution for Target’s Fulfillment Centers, eliminating dependency on third-party packages. In a short period, we built a sustainable solution that went live at the Midlothian FC in July 2022.


## Responsibilities
- Extensively Involved in POCs, [Design](https://confluence.target.com/display/tPack/tPack+Integration+Architecture), [Discussions](https://confluence.target.com/pages/viewpage.action?pageId=348350227), Monitoring, [Coding](https://git.target.com/stores-item-prep/prepv2datafeed/pull/1), [Support Plan](https://confluence.target.com/display/tPack/Support+Playbook), [Reviews](https://git.target.com/Stores-local-injection/sort-update-service/pull/64#pullrequestreview-1565187), [Requirement Gathering](https://confluence.target.com/display/EPACK/Sort+to+Target+Sortation+Center+Discussion), Deployments Plans etc.
- Accountable to work closely with POs to priorities the quarterly work and define the stories. [Work Prioritization Doc](https://confluence.target.com/display/tPack/Work+Priorities).
- Establish connections between different teams to [deliver](https://git.target.com/z002dx0/body-of-work/blob/master/resources/Day-1.png) the work. An e.g. closely working with multiple partners like UI(re-mix), Site DTOs, TTOPS, gPack, FC process managers, Business, Mobility etc. to enable the custom pack&ship in FC as part of MOVE.
- [Drive the team](https://git.target.com/z002dx0/body-of-work/blob/master/resources/UpdatesOnProgress.png) to achieve the goals within a reasonable time frame. An e.g. is Drive tPack team to a successful POC and go-live.
- [Involve team](https://confluence.target.com/display/EPACK/Store+Hold+Space+Manager) in key design and discussions so that inclusively we design what is right for our team and Target.
- Establish [engineering practice](https://confluence.target.com/display/EPACK/Peak+Planning+2021). For e.g. driving peak planning and [performance testing](https://confluence.target.com/display/EPACK/2021+gPack+perf+test).
- Continuously think and work towards operational excellence and innovation. An e.g. innovative idea to improve opearation [App Feedback](#app-feedback).
- Continuous Monitoring and Observability. Always learn from Production issues and create alerting and work towards root case and fix. An example of it is [Find My Container](#find-my-container) innovation work which helped reducing one of the highest incident driver.
- Hire new talent, train them to build a right talent pool in Target.
- [Represent and Showcase team’s hard work](https://git.target.com/z002dx0/body-of-work/blob/master/resources/PeakStats%20.png) during peak and demo days to leaders. During peak pull stats which helps business and leaders to understand and measure the impacts of the changes has been done to support peak. These stats were very much appreciated by business during peak.
- Production support and present the issue analysis and resolution to leaders. Lead the team during [critical situations](https://git.target.com/z002dx0/body-of-work/blob/master/resources/log4j.png). An e.g. of this was during log4j finding, soon after finding the vulnerability in couple of hours we successfully addressed the vulnerability across more than 50 services.




## Major projects in Target

## Move Platform Common PackShip Solution
### Summary
As part of Move platform ask was to have a common solution for Pack and Ship across stores and supply chain. Currently FC’s are using Manhattan package and Stores have custom applications for Pack and Ship functionalities. Compare to stores FC’s operations are very complex and heavily depend on Manhattan for almost all the fulfillment functionalities. So it was extremely challenging to takeout functionalities from Manhattan and build such a way so it can be used across SC and stores. Also this was the first project to enable the Maestro UI for fulfillment.

I played key role in driving the team inclusively to a common solution for SSC right from a POC to go-live in Mildo FC. When we started the project in Jan 2022 none of our partner teams were ready to support the work. I played key role in connecting multiple teams and inclusively come up with a common sustainable solution without disturbing the existing operations across Stores and SC. Across different teams and within team I conducted multiple rounds of discussions, brainstorming and knowledge sharing sessions to set the path for success. Design the solutions such a way that there will be no or very less throwaway work from initial POC to future go-lives once partner team are ready. We successfully delivered the POC at Woodbury in April which set the team high on confidence and set the path for future. Right from the biggening of POC I built the partnership with multiple teams like GOM, SFM, ePick, DS, SLAM, DMO, Maestro, MyDay, WOPR, Mobility, Network, Manhattan etc. to ensure the common solution works e2e without any issue.


### Major Deliveries and Milestones in 2022:
- 3rd Jan: Started leading tPack team.
- 11th Feb: First FC shipping labels generated using stores label services and Logan TTOPs endpoint.
- 31st March: Successfully enabled the stores pack&ship app to pack orders in FC.
- 14th April: Successful POC at Woodbury using stores pack and ship application and Logan TTOPs endpoint to pack singles order.
- 14th July: Successful singles orders testing at Woodbury using Maestro UI and Midlothian TTOPs endpoint.
- 25th July: Go-Live at Midlothian FC with Singles order.
- 19th Oct: Go-Live at Midlothian FC with Multis order

### Few Challenges:
- How can it be possible to add custom solution for some of the functionalities without disturbing the existing Manhattan ecosystem in FC?
  Came up with a Strangler Façade design thru which we started strangling around one functionality in Manhattan at a time and move that to our common custom solution and update back in Manhattan to keep all the operation happy.
- As Maestro was not ready how to test in FC?
  Convert the store myDevice app so that it can be used in FC until maestro team is not ready.
- With different process and different UI/UX (Maestro in FC and MyDay in Stores) how to build common solution?
  Design a orchestration layer over a common backend services and infra which can fulfill process across FC and Stores.
- As TTOPS not ready to generate the shipping label, how to perform POC and MHE integration without ShipVIA.
  Come up with a solution where while processing the orders from Woodbury, using the 9117 as the source shipping node to generate the shipping label for POC. For MHE integration suggested to map the 9117 ShipVia to Woodbury ShipVia so that packages could load thru MHE without failure.


### Architecture:
https://confluence.target.com/display/tPack/tPack+Integration+Architecture

<img width="1028" alt="tPack" src="resources/tPack.png">


### Some of my PRs for this project:
- https://git.target.com/Stores-Outbound-Custom/gpack-label-service/pull/245
- https://git.target.com/Stores-Outbound-Custom/gpack-label-service/pull/261
- https://git.target.com/Stores-Outbound-Custom/gpack-ui/pull/409
- https://git.target.com/Stores-Outbound-Custom/gpack-display-service/pull/94



## Flexible fulfillment
Purpose of project is to fulfill online orders from existing Target Stores. I am part of this program since started back in 2013. There are two phases of this program, first when we started this program implemented Manhattan WMS package and later in 2017 we developed custom pack and ship application(gPack) and completely removed the dependency from the package from 1400+ stores.

### Store Pack and ship - wms
It was a huge challenge to implement and maintain such a huge WMS package for 1400+ stores. While POC we built lot of integrations with upstream and downstream systems. During and after building the system there were lot of challenges like Continuous development, Maintenance, Support, Stability etc. of this third part package and keep the coordination between the offshore and on-site team. This project was very challenging as had multiple different teams within and outside the target. I played key role in building the WMS system, automations, integrations, lead during critical issues, coordinate between onshore and offshore teams and also with external vendors. After bad performance of Manhattan during 2015 peak, we took over the performance testing of Manhattan package from Manhattan and built inhouse perf test suite using Gatling, jmeter and various other automated tools. It was first time someone performed a package inhouse perf test. As a result we were able to build a highly performant system which successfully supported next three peak without any failures.


### Store Pack and ship - gPack
To remove the dependency from the package for pack and ship process in store we started building custom application for stores outbound functionalities. Biggest challenge was how to build such huge functionalities and replace the package from more than 1400 stores. I played key role in setting up the process and utilize the learning from Manhattan package to build in-house custom solution. I started leading the gPack team to develop the custom outbound applications like Prep, Pack, Priority, Cartonization, Sort, Ship to fulfill the pack and ship functionalities. We successfully developed custom applications and in 2018 decommissioned the Manhattan package from all the 1400+ stores.
### Architecture
To keep it short I am just adding a conceptual and links to architecture diagram for apps like prep, pack, sort, ship etc
<img width="1127" alt="StorePack Ship" src="resources/StorePack&Ship.png">

**Pack:**
<img width="1158" alt="gPack Arch" src="resources/gPack Arch.png">

**Prep:** https://confluence.target.com/display/EPACK/Prep+Flow+and+Integration

**Sort:** https://confluence.target.com/display/EPACK/USPS+SORT+-+gpack+integration

**Store Hold Space Manager** https://confluence.target.com/display/EPACK/Store+Hold+Space+Manager




## Product Performance and Stability
- Since beginning I am leading the peak planning and perf testing. As part of peak planning I work with all the POs to figure out the expected peak volume. Then calculate how this volume will be distributed to individual endpoints so that actual perf test can be performed. Here is the confluence page link for last peak planning i did for all the products: https://confluence.target.com/display/EPACK/Peak+Planning+2021
- Not only planning I play major role in performing the actual perf test and help team in consolidating the perf results. Here is an e.g. of perf test i ran and consolidated the results and also suggested few major changes which helped in improving the application performance even at 3 times of the expected max volume:
  https://confluence.target.com/display/EPACK/2021+gPack+perf+test




## Collab at Target
Collaboration is very important in budling a strong team. Behind every design and changes or PRs there are lots of brainstorming sessions. It’s very hard to present all those efforts but trying my best to list few examples below to demonstrate how important is the collaboration and how it helps in your personal and team growth.


### Pull Requests
I am actively involved in PR reviews and revived hundreds of PRs across multiple products not possible to list all of them so listing some of them.
**Note**: Review comment s are resolved in PRs, so you may needs to hit show resolved to see all the review comments.

- [Catching potential performance problem and suggested better solution to improve the performance](https://git.target.com/Stores-local-injection/sort-update-service/pull/64#pullrequestreview-1565187)
- [Catching that the provided solution will not work.](https://git.target.com/Stores-Outbound-Custom/gpack-cartonization-client/pull/197)
- [Catching potential performance challange and suggested better way to improve the performance.](https://git.target.com/Stores-Outbound-Custom/gpack-acknowledgement-service/pull/55)
- [Help in finding that the DB calls which will not work.](https://git.target.com/Stores-Outbound-Custom/gpack-packing-service/pull/160)




### Innovative Ideas
Time to time I come up with many innovative idea which were much appreciated by business and TMs and added significant value in product improvement. Some of these ideas were adopted by other teams also. Here are some of the innovations:

#### App Feedback
Many time we find valuable feedback about our app on external unofficial sites. So I come up with an inapp feedback idea and presented this to business and implemented this into store Pack&Ship app. App Feedback option is available under the three dot menu of the pack&ship landing page. TM submit the feedback by submitting following options:
- **Select app**: This option is to select the app about which TM wants to submit the feedback.
- **Hide your identity?**: If TM don’t wants to reveal his identity on the feedback he can select Yes.
- **Feedback**: In this section TM write the feedback.

On submitting the feedback backend service saves this feedback in DB and another service keep checking every hour if there is a new feedback submitted. If it finds any new feedback it triggers an alert with web URL to see the feedback.

**Impact**: After I added this feature we received tons of valuable feedbacks from TMs and many of them were adopted which helped us improving the application experience which increased the productivity in P&S. Many time TM used this to submit the feedback about other apps also and asked us to implement the same for other applications also. Presented this to many other teams and myDay also adding this feature.

Here is the app feedback form TM get when they select the App Feedback from the app menu:

<img width="290" alt="AF2" src="resources/AF2.png"><img width="290" alt="AF3" src="resources/AF3.png"><img width="290" alt="AF4" src="resources/AF4.png">

Here is the link to web page i developed to present the feedbacks by app:
https://appfeedback.prod.target.com/

Here are the PRs and services I created to implement this:
- UI work: https://git.target.com/Stores-Outbound-Custom/gpack-ui/pull/318
- Backend service: https://git.target.com/Stores-Outbound-Custom/appfeedback/pull/1


#### Find My Container
Collate/Shipping label Re-print is the highest incidents driver in fulfillment for CSC. CSC receives more than 3700 calls every year. Rootcause of this problem is if due to any reason, post pack complete if TM loose the shipping label ID TM don’t have a way to find that within Pack&Ship app which is required to re-print the shipping label. To solve this problem i comeup with an innovative idea to provide an option within Pack&Ship app **Find My Container** where TM can find all the containers he worked on in last N hours with item details. This way TM able to self-serve the information required to find and re-print the shipping label directly from the app. More details can be find here: https://confluence.target.com/display/EPACK/Find+My+Container

**Impact**: This innovative idea alone helped in reducing the incident calls volume which was a huge win and also it was a goal for leadership. Now many other fetures got added to find my container which is helping pack and ship to a be flawless app.


Here are the CSC calls count due to this problem:

<img width="601" alt="incidents" src="resources/incidents.png">

Here are the PRs and services I created to implement this:
- UI work: https://git.target.com/Stores-Outbound-Custom/gpack-ui/pull/388
- Backend service: https://git.target.com/Stores-Outbound-Custom/gpack-display-service/pull/82




## Development Work Examples

I am extensilvey involved in development work and have delivered many new services and applications across multiple products. Here i am listing some of my development work which demonstrate my technical skills across different technologies.

- [New acknowledgement service for Ship to Store app - Java springboot](https://git.target.com/ship-to-store/stsacknowledgmentservice/pull/1/files)
- [New update service for stores my supplies app - Kotlin Micronaut](https://git.target.com/Stores-mySupplies/mysuppliesupdateservice/pull/1/files)
- [Created a template for quick UI project using Angular-cli, cordova and ionic.](https://git.target.com/Stores-Outbound-Custom/ui-template)
- [Backend service for App Feedback Innovation](https://git.target.com/Stores-Outbound-Custom/appfeedback/pull/1)
- [Backend service for STS in app messaging innovation](https://git.target.com/ship-to-store/stsinappmessaging/pull/1/files)
- [New prep data feed service for Prep application](https://git.target.com/stores-item-prep/prepv2datafeed/pull/1)
- [Ingestion service for prep app](https://git.target.com/stores-item-prep/prepv2ingestion/pull/1)
- [Service for Store Hold Space Manager app](https://git.target.com/Store-Hold-Space-Manager/holdspacelabelservice/pull/4)
- [On leadership ask a quick solution provided during peak to support target sortation centers](https://git.target.com/Stores-local-injection/sort-update-service/pull/90)
- [Solution in cartonization client to suppport high velocity stores](https://git.target.com/Stores-Outbound-Custom/gpack-cartonization-client/pull/50)
- Prep enhancements which reduced the prep work by 43%: [No Prep Needed](https://git.target.com/stores-item-prep/prepv2client/pull/8) and [Multi Items Prep](https://git.target.com/stores-item-prep/prepv2client/pull/11)
- Innovative [Sort during Pack work](https://git.target.com/Stores-Outbound-Custom/gpack-ui/pull/310)


## Shadow managing
Have been shadow managing the team from last few years.

- Having biweekly 1:1s with engineers and TLPs.
- Recruited and Mentored engineers. Every individual in Pipeline now have in-depth understanding of the engineering practices and product.
- With the continuous resource changes, I am on boarding and mentoring the new team members and bringing them upto speed with the rest of the team.
- Plays major role in new technology discussions.
- Work with POs for new developments and make sure we are able to follow the best engineering practice without impacting the business timelines.
- Present the issue analysis and resolution and learnings to leaders and represent the application during TOC calls.
- Define the scope of the functional stories and guide/mentor the team for development/implementation of the functional user stories.
- I play major role in identifying the tech debt and partnered with PO to get them prioritized.
- Many times helped POs to resolved the conflicts between multiple teams and set the expectations from the partner teams per the best practices.
- Highly encourage innovation and motivate team to come up with innovative ideas.
- Playing security ninja role in team for last few years and encourage security first mindset in team.
- Worked on the engineers' growth aspect and discussed with leadership and shared feedback on many engineers which helped leadership to take the decision on their promotion.
- Lead the team on any priority issues and always try to minimize the critical impact first.




## Recommendations and Recognitions

>***I would like to recognize Kapil Gangwal who has been instrumental in the go live of Pack&Ship at our Midlothian FC. Kapil has provided significant technical leadership in the design, development, and business adoption of the new solution. This foundation has already enabled the team to build new features (multi-unit orders) quickly and with few changes to the overall solution. In addition to Kapil’s tPack work, he completed an innovation project this year, that his old team has productionized, and only with Kapil’s innovation work would that have been possible. It’s called ‘Find My Container’, and the solution has the potential to reduce a significant number of store team members from calling the CSC and creating procedural incidents. It is in production and will be measured during Peak 2022. Kapil’s thought leadership and problem solving also are outstanding and frequently he works across teams to help others.***

- Matthew.Anderson | Sr. Engineering Manager, Target Corp


More reccomondations can be found on [my LinkedIn Profile](https://www.linkedin.com/in/kapil-gangwal-7865359/).




## Technical Skill Set
- **Programming and Frameworks**: JAVA, Kotlin, Groovy, C++, OOPs, C, Data Structure, Shell Script, Hibernate, Spring, Spring Boot.
- **UI Development**: Android hybrid development using JavaScript, JSON, AngularJS and NodeJS.
- **Platform**: Linux, Windows, DOS.
- **Database**: Oracle, Postgres
- **CICD** using GIT, Kubernetes, Docker, Drone.
- **Integration**: KAFKA, IBM WebSphere MQ, HTTP, HTTPS, SSH, SFTP.
- **Other Tools**: JIRA, Service Now, Confluence, MS Excel, Control-m, CronJobs, IBM MQ.
- **WMS Packages**: Manhattan WMOS, MIF





## References

Sharing few contacts here with whom I worked closely. Feel free to connect with them to know more about my experience.
- Kristofer.Hjelmeland (Director Tech)
- Matthew.Anderson (SEM)
- Mark.Siebenaller (Director Product)
- Jeremiah.Constant (PO)
- Ali.Strand (PO)
- Jessica.Bottensek (PO)
- Yuriko.Vaughan (PO)
- Heather.Moe (Scrum Master)
- Mike.Kernan (Scrum Master)