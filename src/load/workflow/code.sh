#!/bin/bash

set -e
IFS=' '

session_id1=`uuidgen`
session_id2=`uuidgen`
session_id3=`uuidgen`

par_endpoint1="$par_jobserver/jobs?context=luciusapi&appName=luciusapi&classPath=com.dataintuitive.luciusapi.binnedZhang&session_id=session_id_1"
par_endpoint2="$par_jobserver/jobs?context=luciusapi&appName=luciusapi&classPath=com.dataintuitive.luciusapi.topTable&session_id=session_id_1"
par_endpoint3="$par_jobserver/jobs?context=luciusapi&appName=luciusapi&classPath=com.dataintuitive.luciusapi.topTable&session_id=session_id_1"

### Queries
# binnedZhang
arg1=( "--body --ignore-stdin" POST "\"$par_endpoint1\"" query=\""$par_query"\" )
id1=$( eval http "${arg1[@]}" | jq -cr '.jobId' )
# # topTable
arg2=( "--body --ignore-stdin" POST "\"$par_endpoint2\"" query=\""$par_query"\" head=10 )
id2=$( eval http "${arg2[@]}" | jq -cr '.jobId' )
# bottomTable
arg3=( "--body --ignore-stdin" POST "\"$par_endpoint3\"" query=\""$par_query"\" tail=10 )
id3=$( eval http "${arg3[@]}" | jq -cr '.jobId' )

sleep 1

### Initial status polling
status1=$( http --body GET "$par_jobserver/jobs/$id1?session_id=session_id_1" | jq -cr '.status' )
status2=$( http --body GET "$par_jobserver/jobs/$id2?session_id=session_id_2" | jq -cr '.status' )
status3=$( http --body GET "$par_jobserver/jobs/$id3?session_id=session_id_3" | jq -cr '.status' )

### Poll until completion
while [ "$status1 $status2 $status3" != "FINISHED FINISHED FINISHED" ]; do
  sleep 1
  status1=$( http --body GET "$par_jobserver/jobs/$id1?session_id=session_id_1" | jq -cr '.status' )
  status2=$( http --body GET "$par_jobserver/jobs/$id2?session_id=session_id_2" | jq -cr '.status' )
  status3=$( http --body GET "$par_jobserver/jobs/$id3?session_id=session_id_3" | jq -cr '.status' )
done

### Store final results
echo -n "[" > "$par_output"
http --body GET "$par_jobserver/jobs/$id1?session_id=session_id_1" | jq 'del(.result)' >> "$par_output"
echo -n "," >> "$par_output"
http --body GET "$par_jobserver/jobs/$id2?session_id=session_id_2" | jq 'del(.result)' >> "$par_output"
echo -n "," >> "$par_output"
http --body GET "$par_jobserver/jobs/$id3?session_id=session_id_3" | jq 'del(.result)' >> "$par_output"
echo -n "]" >> "$par_output"

