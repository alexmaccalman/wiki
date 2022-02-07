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










