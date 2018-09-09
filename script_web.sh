#!/bin/bash
URL="<URL of a web page>"
timeb="<time in seconds between checks>"
mail="<your e-mail address>"
old=`curl -so /dev/null $URL -w '%{size_download}'`
new=`curl -so /dev/null $URL -w '%{size_download}'`
echo $old
echo $new

while [ $old == $new ]; do
echo  waiting $timeb seconds
sleep $timeb
new=$(curl -so /dev/null $URL -w '%{size_download}')
done
echo $old vs
echo $new
echo "Change noticed!"
echo "Sending e-mail" 
echo "Hey, there's something new" | ssmtp wiktorusxxd@gmail.com
