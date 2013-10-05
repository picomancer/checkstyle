#!/bin/sh

set -e
set -x

base=$(readlink -f $(dirname "$0"))/..

mkdir -p "$base/dep"

depsfailed=""

for depname in antlr jsr305 google-collections commons-logging commons-cli commons-beanutils
do
    if [ -e "$base/dep/$depname.jar" ]
    then
        continue
    fi

    if [ -e "/usr/share/java/$depname.jar" ]
    then
        ln -s "/usr/share/java/$depname.jar" "$base/dep/$depname.jar"
    else
        depsfailed="$depsfailed $depname"
    fi
done

if [ -n "$depsfailed" ]
then
    echo "Missing dependencies $depsfailed"
    echo "try this command:"
    [ -x $(which javac) ] || echo "    sudo apt-get install default-jdk"
    echo "    sudo apt-get install ant antlr libjsr305-java libgoogle-collections-java libcommons-logging-java libcommons-cli-java libcommons-beanutils-java"
    exit 1
fi

mkdir -p "$base/target/src/com/puppycrawl/tools/checkstyle/grammars"
src_g="$base/src/checkstyle/com/puppycrawl/tools/checkstyle/grammars/java.g"
(cd "$base/target/src/com/puppycrawl/tools/checkstyle/grammars" && runantlr "$src_g")

ant jar

