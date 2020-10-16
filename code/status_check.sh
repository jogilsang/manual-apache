#!/bin/bash

##
# Website status check script
# Author : jo_gilsang
# Date : 10/10/2020
##

##
# Discord webhook
# Change the 'your_discord_webhook_name' with your actual Discord Webhook
##


##
# List of websites to check
##

url="https://hooks.slack.com/services/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"
websites_list="https://www.naver.com https://www.google.com"
# websites_list ="your_domain1/test your_domain2 your_domain3"


generate_post_data()
{
        cat <<EOF
{
   "attachments":[
      {
         "fallback":"Alarm [U]: <$1|클릭 시 서버연결을 시도합니다.>",
         "pretext":"Alarm [U]: <$1|클릭 시 서버연결을 시도합니다.>",
         "color":"$2",
         "fields":[
            {
               "title":"$3 error",
               "value":"$4",
               "short":false
            }
         ]
      }
   ]

}
EOF
}

domain="https://www.naver.com"
color="#D00000"
status_code=""
msg="서버장애가발생했습니다."

for website in ${websites_list} ; do
        status_code=$(curl --write-out %{http_code} --silent --output /dev/null -L ${website})

        if [[ "$status_code" -ne 200 ]] ; then
            # POST request to Discord Webhook with the domain name and the HTTP status code
            # curl -H "Content-Type: application/json" -X POST -d '{"text":"'"${domain} : ${status_code}"'"}' $url
            curl -H "Content-Type: application/json" -X POST -d "$(generate_post_data ${website} $color $status_code ${website +"장애발생"})"  $url
        else
            # echo "${website} is running!"
            curl -H "Content-Type: application/json" -X POST -d "$(generate_post_data ${website} $color $status_code ${website +"장애발생"})"  $url
        fi
done
