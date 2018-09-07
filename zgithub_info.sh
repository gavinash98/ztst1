#!/bin/bash
             # get github user info
            if [ $# -lt 1 ]; then
               echo "Usage: $0 <github_userid>"
               exit 1
            fi
GITHUB_URL="https://api.github.com/users/"$1
GITHUB_URL2="https://api.github.com/users/"$1"/followers"

#  get the github api info for userid
             echo $GITHUB_URL
             curl -s $GITHUB_URL | \
           awk -F'"'  '
               /\"name\":/ {
                 print "User name: " $4
               } 
               /\"created_at\":/{
                    print "Account created on "$4
               }
            ' 
# print the followers
             echo
             echo $GITHUB_URL2
             echo "Followers user-ids are:"
             echo
             curl -s $GITHUB_URL2 | grep -i login | \
           awk -F'"' ' {print "\t" $4} ' 
#           awk -F'"' '  /\"login\":/ { print " $4 } ' 
exit 0