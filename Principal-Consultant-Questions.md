# Liatrio Principal Consultant Questions

1. Can you travel up to 2 weeks out of 4 for consulting engagements to either
   coast? Are there any constraints we need to know about upfront that will
   prevent this regularly. (Mon-Thursday on site home every weekend)

    Yes and no :)

2. If everything goes well, how much lead time do you need to join Liatrio and
   when is the earliest you can join. Also, post joining, do you have any PTO
   planned out already in the medium term future (6 months)

    I could be ready to join in a few weeks time. The only thing I've got
    scheduled right now is a trip to see family from 8/29-9/5 and DevOps World
    / Jenkins World on 9/18 & 9/19.

3. How much time commitment can you provide for the interview process from the
   first call to final in-person interview.

    I'm available for an hour for each of the first few calls or video chats.
    If you expect they'll go longer than that, I'm willing to work with you. If
    you decide to go forward, and want to meet onsite, that shouldn't be a
    problem either. We should both have a pretty good idea by then if it's a
    good match. 

4. Tell us how you have been involved in end to end software delivery that
   includes CI/CD, test automation, IaaC, and Cloud

    TODO

5. Quickly define your familiarity with the following tools including when was
   the last time you were actually hands on with any of them:

    * Jenkins, Maven, Gulp or Grunt, Selenium, Cucumber, Chef or Puppet or
Ansible, Vagrant or Virtualbox, Nexus or Artifactory, AWS or Google or Azure

    * Jenkins: most recently used it to set up automated deployments in my
      current role; last used a few weeks ago

    * Maven: not much experience with it; I've built and packaged batch jobs at
      Capital One (ShareBuilder) to do end-of-day brokerage processing; last
      used close to two years ago

    * Gulp: no experience; Grunt: I've built and deployed node code at work
      for a partner application ("dealer portal"); last used a few months ago

    * Selenium: no experience

    * Chef: used a lot of Capital One for deployments which never seemed like a
      good fit; I mostly remember fighting with the central server; last used
      close to two years ago; Puppet: never for pay; Ansible: I've written a
      bunch of playbooks to spin up our environments as needed, and sometimes
      also use it for inventory queries; coached some of our developers on it,
      which worked out well; last used a few weeks ago

    * Vagrant or VirtualBox: I've used both sometime this year; VirtualBox is
      currently running on my work laptop as a host environment for minikube
      (kubernetes)
    * Nexus or Artifactory: my team maintained an Artifactory instance for
      local deployments. We also used a shared (corporate) Nexus instance; last
      used close to two years ago for both (at Capital One)
    * AWS: very familiar with a dozen or so services; use it every day; Google
      Cloud Platform or Azure: never for pay

6. Please define what you believe to be DevOps and what a DevOps transformation
   at a customer would look like.

    Great question. I've started to answer it about eleven times already. My
    current answer (but there are many others) is that DevOps is about putting
    responsibility where it belongs.

    I've always felt that developers like to change things all the time, while
    operations folks like to prevent things from changing. That imbalance used
    to look to me like the people with more information and less "skin in the
    game" were happy to roll out new changes then throw them over the fence,
    along with a partial description of what it is, how it works, and how to
    deploy it into a production environment. The operation folks took on the
    risk--if something broke, they'd be on the hook to fix the issue, often
    without enough background to do their jobs effectively. (That's a concise
    description, but it lacks nuance. For the sake of this answer, I hope it's
    enough.)

    A better outcome (for some definition of better) would have the developers
    deploying to whatever environment they have access to, possibly even
    production. But that's just the tip of the spear: developers won't suddenly
    have the skills, experience or confidence--or let's face it, the
    interest!--to deploy to production. Getting there is a process, and DevOps
    works best when leading by example.

    A customer's DevOps transformation means developers now maintain their
    creations throughout the full life cycle, including deployments. At the
    same time, the operations staff need to learn to create dynamic
    environments for the developers to deploy to.

    In addition to ideation, design, implementation, pre-release testing, etc.,
    developers are now starting to take responsibility for making sure it runs
    in its target environment. They'll also respond to issues when they come
    up. The operations team took care of all that before, and the developers
    didn't have to understand it. Now they may well have to rely on the
    operations teams' expertise to get their work done. The specialists broaden
    their skill sets, and the team benefits as a result.

    The operations folks, on the other hand, have to become part-time
    developers as well. Until now, they could follow a playbook swapping in the
    specific configuration changes needed for a given release. But now they
    need to learn to write infrastructure as code, using whatever tools the
    team chooses. They may be nervous or feel lost. That's okay; they have a
    lot to learn. On some teams, the operations folks may have on-premises
    hardware, or other "pets". Over time, they'll be better served by 

    Over time, if things go well, the operations folks will move away from 

    the development teams are
    organized vertically, rather than horizontally

    Assuming you've got a willing team, you're well on your way. Most of the time that won't be the case. Instead, you have all kinds of 

    As well, many times
    operations is not consulted about how to ensure the new stuff is compatible
    with existing applications or environments, etc. And operations is almost
    never brought in when the project is still in the design phase. (It took a
    long time for QA to get a seat at the table, and longer still to recognize
    that operations belongs there too.) Repeat that cycle a few times and
    you're likely to wind up with an "us versus them" mentality.

    Looked at the a DevOps lens, though, 

    DevOps 

    To start with, DevOps is a set of practices. Maybe someday it'll be

    One way to think about what DevOps is, is to look at life without it. 

    DevOps is about appropriate application of pressure. 

    I believe DevOps is about "getting everyone rowing in the same direction".
    There's something of a hierarchy there, with people and systems on top, and
    tools and technologies below that. 

    Great question. If I represented DevOps as a Venn diagram, the common
    region in the center would be communication.

    At its core, DevOps is about communication. Everything else follows from
    there. That's almost uselessly vague so let me break it down a bit. You can
    pretty easily come up with a checklist of things you should be doing, but
    why bother? Joel Spolsky wrote on 18 years ago (!!) that's still pretty
    good today.

    https://www.joelonsoftware.com/2000/08/09/the-joel-test-12-steps-to-better-code/

    You may want to give it a refresh, but it's aged remarkably well, in my opinion.

    Okay, so you've got your list of questions. What now? Start somewhere. How about 


    If that's going back too far, there's always the 12 factor app

    https://12factor.net/

    

    empowering developers and the people they 
    
    increasing visibility, increasing
    confidence, not straying too far from the well-trod paths, and learning to
    let go. 
    
    
    It might be easier to talk about what DevOps **isn't**. It's not just setting up a build server, and pushing all to a test machine with every commit, although that's nice I guess.

    A "top-down" view of DevOps is 

    I think of "traditional" DevOps from the point of view of companies that
    are already doing it, things like continuous integration, automated unit
    testing, continuous deployment (to some 

7. Now that you have defined a DevOps transformation, how would you execute
   this at a customer?

8. Have you led a DevOps transformation and if so:

    * Please provide a specific company name/scenario AND a key accomplishment
      during that project?
    * Why do you think this accomplishment was significant for your client? How
      about your company?

