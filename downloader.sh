#!/bin/bash
url="[yoururl]master.json?base64_init=1"
segment_url="[segmenturl]"
init_segment=`curl -s $url | jq -r '.video[0].init_segment'`
segments=`curl -s $url | jq -r '.video[0].segments[].url' > segments`
echo $init_segment | base64 --decode > init_segment.m4s


for x in $(cat segments)
do
curl -s "$segment_url$x" >> init_segment.m4s
done

