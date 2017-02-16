#!/bin/bash
URL="<URL of a file>"
timeb="<time in seconds between checks>"
mail="<your e-mail address>"
title="<title of an e-mail message>"
message="<your message in email>"
sizeold=`curl -sI $URL | grep Content-Length | awk '{print $2}'`
sizenew=`curl -sI $URL | grep Content-Length | awk '{print $2}'`
echo $sizeold
echo $sizenew

while [ $sizeold == $sizenew ]; do
echo  czekam $timeb
sleep $timeb
sizenew=$(curl -sI $URL | grep Content-Length | awk '{print $2}')
done
echo $sizenew
echo "Change noticed!"
echo "Sending e-mail" | mail -s "$title" $mail <<< '$message'
