### Test the Release Candidate
 
Follow the VM announcement instructions on how to download and run your virtual machine or run vagrant can be found in the release candidate announcement.
 
### Suggested Test Process
 
1. Download and build your VM
 
You might need to have the latest updates for your version of Virtualbox and Vagrant. 
 
How to tell which version is installed from a command line:
vagrant version
vitualbox –version
 
2. Test your component.  Instructions on how to test a release can be found here: https://github.com/Islandora/islandora/wiki/Release-Team-Roles#tester and here: https://github.com/Islandora/islandora/wiki/How-To-Audit,-Document,-or-Test-an-Islandora-Release#testing

3. Report issues for your component in JIRA.

Open Bugs in JIRA (Ordered by oldest updated ones)
For instance, if you are testing the 7.x-1.11 release candidate, when opening new Bug JIRA tickets during Testing please put: Fix version 7.x-1.11 and affects 7.x-1.10. 7.x-1.11 is not released so can’t affect 7.x-1.11.

Found a Blocker? Make a ticket!! Make sure to mention the release team during this stage to speed things up. Any detail helps!

4. Test JIRA tickets that affect your component and that affect/have been fixed for 7.x-1.11. This may include confirming that open bugs still exist (marked 'Unresolved' under Resolution) and confirming that resolved/closed tickets have fixed the reported issue (marked 'Ready for Test' under Resolution).
 
Here is a sample search for tickets related to the Collection Solution Pack for 7.x-1.11: 
https://jira.duraspace.org/issues/?filter=-5&jql=fixVersion%20%3D%207.x-1.11%20AND%20component%20%3D%20"Collection%20Solution%20Pack"%20order%20by%20priority%20DESC%2Cupdated%20DESC
 
Affects version
https://jira.duraspace.org/issues/?filter=-5&jql=affectedVersion%20%3D%207.x-1.11%20AND%20component%20%3D%20"Collection%20Solution%20Pack"%20order%20by%20priority%20DESC%2Cupdated%20DESC

 
5. Attend Committers meetings to discuss your reported tickets (every other Thursday at 2pm EST https://islandora.ca/developers/committers_call) 
 
6. Check your tests against existing documentation in your components' Github repository and in the Duraspace Wiki. Check to see that information in the documentation is still accurate and up to date, and improve documentation where necessary. 
 
Example link to Collection solution pack github: https://github.com/Islandora/islandora_solution_pack_collection
 
Example link to collection solution pack Duraspace documentation: https://wiki.duraspace.org/display/ISLANDORA/Collection+Solution+Pack as well as relevant collection documentation under Usage
 
7. When you're finished testing, contribute your tests back. This will be helpful for future testers who can reuse and build upon these tests: https://docs.google.com/spreadsheets/d/1QoMGcDE6T0Im9Pbs1OHC9_rkcjyren71yjAlHdfO-O0/edit?usp=drivesdk
 
### How to report an issue in JIRA
 
1. Select the affected component
2. Create issue, fill out form details (include Fix version: 7.x-1.11, Affects version: 7.x-1.10)
3. Fill out the description of the issue. Here is a suggested template to follow:
 
Description
Steps to Reproduce
Expected Behaviour
Actual Behaviour
Notes
 
Attach screenshots and sample test files when you can. 

### Tester Templates Bank
 
Islandora Release Tester Template Bank -https://docs.google.com/spreadsheets/d/1QoMGcDE6T0Im9Pbs1OHC9_rkcjyren71yjAlHdfO-O0/edit?usp=drivesdk 
 
The tester templates bank is a supporting document for testers. As a tester you are given the freedom and flexibility to test your components in any way you choose, which can sometimes be a little intimidating. This document is designed to streamline and the test process by encouraging standard best practices and hopefully make testing easier for others in the future (especially new for new testers!). 
 
You are encouraged to use it to manage your test process and to also contribute back your tests. 