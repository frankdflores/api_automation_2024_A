#!/bin/bash

APIKEY="7dc2107b89c84801806d7167850a6399"
JOKE="18839"

# echo "#### CRUD output json ####"

#POST(Create)
curl -s -X POST https://api.humorapi.com/jokes -H "x-api-key: ${APIKEY}" -d '{"joke":"Habia una avestrus"}' | jq -r .
#GET(Read)
curl -s -X GET "https://api.humorapi.com/jokes/search?number=1&keywords=animal" -H "x-api-key: ${APIKEY}" | jq -r .
#UPDATE
curl -s -X POST "https://api.humorapi.com/jokes/${JOKE}/upvote?api-key=${APIKEY}" | jq -r .
#DELETE
curl -s -X POST "https://api.humorapi.com/jokes/${JOKE}/downvote?api-key=${APIKEY}" | jq -r .


# 405  Method not allowed
curl -i -X GET "https://api.humorapi.com/jokes/${JOKE}/downvote?api-key=${APIKEY}" -H "Accept: application/json" 
# 401 Not authorized
curl -i -X POST "https://api.humorapi.com/jokes" -H "Accept: application/json" -d '"{joke":"Habia una avestrus"}' 
# 400 bad request
curl -s -X POST https://api.humorapi.com/jokes -H "x-api-key: ${APIKEY}" -d '{}' | jq -r .
# 404 Url not found
curl -i -X GET "https://api.humorapi.com/jokes/searc" -H "x-api-key: ${APIKEY}" 






