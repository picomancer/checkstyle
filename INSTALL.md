
Installation
============

There are two build systems in Java, Maven and Ant.  The checkstyle project has traditionally used Maven,
however rudimentary (and somewhat experimental) Ant support is also included.

Linux Debian/Ubuntu/Mint systems with Ant
-----------------------------------------

A shell script is included.  You want to create a subdirectory called dep/ and place copies or symlinks
of all dependent libraries in there.  Then run the ant "compile" and "jar" tasks.  The build.sh script
will take care of the details for you, except for installing the dependencies (which requires root
privileges).  Try these commands:

    #sudo apt-get install default-jdk       # this should be unnecessary for most users, if you're the kind of person who uses checkstyle
                                            #    then you probably have a jdk installed already ^_^
    sudo apt-get install ant antlr libjsr305-java libgoogle-collections-java libcommons-logging-java libcommons-cli-java libcommons-beanutils-java
    bin/build.sh

Note:  The Ant target currently creates class files compatible with Java 5 and up.  If you want to build for an earlier Java version,
you will have to change the "target" option of the "javac" tag in build.xml.

Linux Debian/Ubuntu/Mint systems with Maven
-------------------------------------------

TODO

Other Linux/UNIX
----------------

TODO

Windows with Ant
----------------

TODO

Windows with Maven
------------------

TODO

