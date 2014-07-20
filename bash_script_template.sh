#!/bin/bash
# Always start with "#!/bin/bash"
# Comments start with "#"
# Adapted from http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html

# Variables
STR="Hello World!"
echo $STR

# Local variables
HELLO=Hello 
function hello {
    local HELLO=World
    echo $HELLO
}
echo $HELLO
hello
echo $HELLO

# Basic if .. then .. else
T1="foo"
T2="bar"
if [ "$T1" = "$T2" ]; then
    echo expression evaluated as true
else
    echo expression evaluated as false
fi

# For loop #1, bash-style
# Iterates over a series of "words" in a string
for i in $( ls ); do
  echo item: $i
done

# For loop #2, C-style
for i in `seq 1 10`;
do
  echo $i
done  

# While loop
COUNTER=0
while [  $COUNTER -lt 10 ]; do
   echo The counter is $COUNTER
   let COUNTER=COUNTER+1 
done
         
# Until loop     
COUNTER=20
until [  $COUNTER -lt 10 ]; do
   echo COUNTER $COUNTER
   let COUNTER-=1
done

# Functions
function quit {
  exit
}
function hello {
  echo Hello!
}
hello
quit
echo foo 

function quit {
   exit
}  
function e {
    echo $1 
}  
e Hello
e World
quit
echo foo

