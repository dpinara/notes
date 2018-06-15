
#1) Read user data, IFS is special tokenizer, here no token to be done so blank
# read -r avoides the carriage return to be come in .
#!/usr/bin/env bash
COUNT=1

while IFS='' read -r LINE
do
  echo "LINE $COUNT: $LINE"
  ((COUNT++))
done < "$1"

exit 0


#2) see $@ stores all values in array. also check that passing parameters to method is like
# passing parameters in script file

#!/usr/bin/env bash
function GetFiles() {
  FILES=`ls -1 | sort | head -10`
}

function ShowFiles(){
  local COUNT=1
  for FILE in $@
  do
    echo "FILE #$COUNT = $FILE"
    ((COUNT++))
  done
}

GetFiles
ShowFiles $FILES
exit 0

#3) stores data in array and iterate it
#!/usr/bin/env bash

FILES=`ls -1 | sort -r | head -3`
COUNT=1

for FILE in $FILES
do
  echo "File #$COUNT = $FILE"
  ((COUNT++))
done

exit 0

#4) Environment variable. Check the -z it means if value is blank
#!/usr/bin/env bash

echo "The PATH is: $PATH"
echo "The terminal is: $TERM"
echo "The editor is: $EDITOR"

if [ -z $EDITOR ]
then
  echo "The EDITOR variable is not set"
fi


#5) see how date executed and consoled out
#!/usr/bin/env bash

USER_NAME=$1
echo Hello $USER_NAME
echo $(date)
echo $(pwd)

exit 100

#6) check multiple values , see [[]]
#!/usr/bin/env bash

VALID=0

while [ $VALID -eq 0 ]
do
  read -p "Please enter your name and age: " NAME AGE
  if [[ ( -z $NAME ) || ( -z $AGE ) ]]
  then
    echo "Not enough parameters passed"
    continue
  elif [[ ! $NAME =~ ^[A-Za-z]+$ ]]
  then
    echo "Non alpha characters detected [$NAME]"
    continue
  elif [[ ! $AGE =~ ^[0-9]+$ ]]
  then
    echo "Non digit characters detected [$AGE]"
    continue
  fi
  VALID=1
done
echo "Name = $NAME and Age = $AGE"
exit 0


#7) Check the process id. See /dev/null

#!/usr/bin/env bash

STATUS=0

if [ -z $1 ]
then
  echo "Please supply a PID"
  exit 1
fi

echo "Watching PID = $1"

while [ $STATUS -eq 0 ]
do
  ps $1 > /dev/null
  STATUS=$?
done

echo "Process $1 has terminated"
exit 0


#8) Read from file and consoel out
#!/usr/bin/env bash
COUNT=1

while IFS='' read -r LINE
do
  echo "LINE $COUNT: $LINE"
  ((COUNT++))
done < "$1"

exit 0

#9) by pass the lines older then assigned second parameters

#!/usr/bin/env bash
COUNT=1
BREAKPOINT=false
BREAKPOINT_VAL=$2
while IFS='' read -r LINE
do

  if [[ "$LINE" = "Maria"  ]]
      then
      echo "$LINE"
      BREAKPOINT=true
  fi


    if [[ $BREAKPOINT = "true" ]]
        then
        echo "$LINE"
        echo "$LINE" >> $1_".log"
    fi

done < "$1"

exit 0

