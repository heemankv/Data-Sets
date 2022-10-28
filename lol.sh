#!/bin/bash
artist=$1
album=$2
creds="ZGRiZTI3MWE3ZmQxNDMxNGFlYjY0YzNkYjFkMzA2OWM6MzEzZjAwZjYyZjNkNGZiZjg2MDA5NDBjYWQxM2I1YTE="
access_token=$(curl -s -X "POST" -H "Authorization: Basic $creds" -d grant_type=client_credentials https://accounts.spotify.com/api/token | awk -F"\"" 
'{print $4}')
result=$(curl -s -H "Authorization: Bearer $access_token" "https://api.spotify.com/v1/search?q=artist:$artist+album:$album&type=album&limit=1" | grep 
"spotify:album" | awk -F"\"" '{print $4 }')
