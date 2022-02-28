## Git notes  
git the version of git
`git --version`
`git clone` "copy ssh from github"
cd into the repo
list all files and hidden files on BASH
`ls -la`  
shows what is commited and what is not
`git status`

stage the commit, period means all files otherwise, put the file name we want to commit.
`git add .`

then commit with a commit message, also could add andother -m for a description
`git commit -m"added index.html"`  
then push to remote repo, origin stands for the location of the git repo
`git push origin master`  

to create repo on github from local folder use this
`git init`  
Then stage files
`git add .`  
Then commit.  
`git commit -m"message"`  
Before we push to Github, we have to create one in github. Then copy the ssh link at the top.  
this command adds a referecne to local repo
`git remote add origin git@github.com:alexmaccalman/demo.git`

to show any remote repositories that are connect to this repo
`git remote -v`  
now we can push to the repo 
`git push origin master`  
to use git push by itself we could set the default with  
`git push -u origin master`  

## Git Branching  
to get all the branches, shows a * indicating which branch.  
`get branch`  
create a new branch, use -b to get a new branch, add name
`git checkout -b feature-readme_instructions`

to compare code, use the git diff command  
`git diff feature-readme_instructions`  
we can merge changes into master with (while on master)   
`git merge feature-readme_instructions`
more common work flow is to push changes uo to repo and create a pull request.  
`get push`  
you will get a fatal becauwse it doesn't know where to push to. use this:  
`git push --set-upstream origin feature-readme_instructions`  
then create a pull request. a request to have your code pulled into another branch  

Go to the github website and create a pull request. Then merge when ready.  
After merging, we can delete the branch.  
`git branch -d feature-readme_instructions` 
# managing merge conflicts 
`git checkout -b quick-test`  

to add a cmmit us the -am to add and put a commit message. only workd with modified files. If we do this with a new file we have to add or dtage it top let Git know about it.   
`git commit -am "added world"`
do a diff with the master
`git diff master` or main  
we will want to pull down lastest updates in master and merge locally. 
then merge  
`git merge main`  


## converting MD to pdf
in terminal is cat command to aggregate .md files

cat 1-engagement-overview.md  2-customer-readiness.md  3-stakeholder-map.md  4-success-criteria.md  5-problem-statement.md 6-definition-of-done.md 7-constraints.md 8-proposed-architecture.md 9-machine-learning.md 10-leveraging-prior-work.md 11-engineering-fundamentals.md  12-customer-handoff.md  13-risks-and-issues.md  14-sharing-plan.md 15-proposed-delivery-schedule.md 16-team-members-and-roles.md 17-ready-to-start-checklist.md > ./gameplan.md  

Steps to create a pdf
-Pip install grip  

-grip game-plan.md  

-Web site loads up.    

-Load web site in browser  

Print to .pdf   













