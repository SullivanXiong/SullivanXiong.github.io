#!//bin/bash

#### Check for the existance of an argument for the sample file.
if [ $# -eq 0 ]
    then
        echo "No sample input file argument supplied. please run './genTest sample.in'."
        exit 1
fi

echo -e "~~~~~~~~~~~~~~~~~~~~~  Compiling: gcc -Wall -Werror -ansi -pedantic stackFuncs.c stackDriver.c\n"
gcc -Wall -Werror -ansi -pedantic stackFuncs.c stackDriver.c

echo -e "~~~~~~~~~~~~~~~~~~~~~  Sample File: ${1}"
./a.out < "${1}" > my.out
echo -e "~~~~~~~~~~~~~~~~~~~~~  Output File: my.out\n"
echo -e "~~~~~~~~~~~~~~~~~~~~~  Diffing: my.out & sample.out"
diff my.out sample.out > err.txt
echo -e "~~~~~~~~~~~~~~~~~~~~~  Diff Output: err.txt"

#### To convert from windows file to unix/linux.
# In other words. an noeol file to a lf file.
#sed -i -e 's/\r$//' ./genTest.sh"