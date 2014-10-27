tgit.bat
========

Windows batch file to allow invoking TortoiseGit naturally via commandline.

This very simple batch file allows convenient commandline access to some of the lovely TortoiseGit GUI tools, such as:

    tgit log [path]
    tgit commit
    tgit sync
    tgit diff [path]    # invoke the diff tool registered in TortoiseGit.
    tgit showcompare /revision1:HEAD /revision2:<other_branch> # diff two branches. 

Based on Ayende's work at http://www.ayende.com/blog/4749/executing-tortoisegit-from-the-command-line
and documentation at http://tortoisegit.org/docs/tortoisegit/tgit-automation.html.

And, like him, I am posting this mostly because I want to be able to look it up afterward.
