#!/bin/bash
URL="<URL of a web page>"
timeb="<time in seconds between checks>"
mail="<your e-mail address>"
title="<title of an e-mail message>"
message="<your message in email>"
wynikold=`curl -so /dev/null $URL -w '%{size_download}'`
wyniknew=`curl -so /dev/null $URL -w '%{size_download}'`
echo $wynikold
echo $wyniknew

while [ $wynikold == $wyniknew ]; do
echo  czekam $timeb
sleep $timeb
wyniknew=$(curl -so /dev/null $URL -w '%{size_download}')
done
echo $wyniknew
echo "Change noticed!"
echo "Sending e-mail" | mail -s "$title" wiktorusxxd@gmail.com <<< "$message"
