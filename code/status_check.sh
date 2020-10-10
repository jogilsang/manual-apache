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

url="슬랙채널의 웹훅도메인, SlackChannel webhook domain"
websites_list="상태체크할 도메인 주소"
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
            curl -H "Content-Type: application/json" -X POST -d "$(generate_post_data $domain $color $status_code $msg)"  $url
        else
            echo "${website} is running!"
        fi
done
