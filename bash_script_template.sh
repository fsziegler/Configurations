#!/bin/bash
# Adapted from http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html
# 1. Always start Bash shell scripts  with "#!/bin/bash" on the first line
# 2. Comments start with "#"
# 3. Run `chmod +x bash_script_template.sh` to make this script runnable
# 4. Run ./bash_script_template.sh to execute this script

echo Variables
STR="Hello World!"
echo $STR

echo 
echo Local variables
HELLO=Hello 
function hello {
    local HELLO=World
    echo $HELLO
}
echo $HELLO
hello
echo $HELLO

echo 
echo Basic if .. then .. else
T1="foo"
T2="bar"
if [ "$T1" = "$T2" ]; then
    echo expression evaluated as true
else
    echo expression evaluated as false
fi

echo 
echo For loop #1, bash-style
# Iterates over a series of "words" in a string
for i in $( ls ); do
  echo item: $i
done

echo 
echo For loop #2, C-style
for i in `seq 1 10`;
do
  echo $i
done  

echo 
echo While loop
COUNTER=0
while [  $COUNTER -lt 10 ]; do
   echo The counter is $COUNTER
   let COUNTER=COUNTER+1 
done
      
echo          
echo Until loop     
COUNTER=20
until [  $COUNTER -lt 10 ]; do
   echo COUNTER $COUNTER
   let COUNTER-=1
done

echo 
echo Functions
function quit {
  echo "(exit)"
#  exit
}
function hello {
  echo Hello!
}
hello
quit
echo foo 

function quit {
  echo "(exit)"
#  exit
}
function e {
    echo $1 
}  
e Hello
e World
quit
echo foo

echo 
echo Simple menus
OPTIONS="Hello Quit"
select opt in $OPTIONS; do
#read -p "Enter menu command:"
if [ "$opt" = "Quit" ]; then
  echo "(exit)"
#  exit
   break
elif [ "$opt" = "Hello" ]; then
   echo Hello World
else
   clear
   echo bad option
fi
done

echo 
echo Using the command line
if [ -z "$1" ]; then 
  echo usage: $0 directory
#  exit
fi
SRCD=$1
TGTD="/var/backups/"
OF=home-$(date +%Y%m%d).tgz
echo Result: "tar -cZf $TGTD$OF $SRCD"

echo 
echo Reading user input with read
echo Please, enter your name
read NAME
echo "Hi $NAME!"
        
echo Please, enter your firstname and lastname
read FN LN 
echo "Hi! $LN, $FN !"
        
echo 
echo Arithmetic evaluation
echo "echo 1 + 1:     " 1 + 1
echo "echo \$((1+1)):  " $((1+1))
echo "echo \$[1+1]:    " $[1+1]
echo "echo \$[3/4]:    " $[3/4] 
echo "echo 3/4|bc -l: [next line]" 
echo 3/4 | bc -l
