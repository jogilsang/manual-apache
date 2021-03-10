#!/bin/bash

# v1 : 단일 웹사이트 장애감지

generate_post_data() 
{
    cat << EOF 
{
        "attachments": [{
            "fallback": "서버장애가 감지됬습니다. 시스템 확인요청드립니다.",
            "pretext": "서버장애가 감지됬습니다. 시스템 확인요청드립니다.>",
            "color": "$1",
            "fields": [{
                "title": "$2 error",
                "value": "$3",
                "short": false
            }]
        }]
}
    EOF
}    
        
color="#D00000"
status_code=""

# TODO : 사이트 기재하기
url="슬랙 Webhook 주소"
website="감지할 사이트"

# 해당 웹사이트의 status 값을 가져오기
status_code=$(curl --write-out %{http_code} --silent --output /dev/null -L ${website})

# status가 200이 아니라면, 장애로 인지
if [[ "$status_code" -ne 200 ]] ; then
    curl -H "Content-Type: application/json" -X POST -d "$(generate_post_data $color $status_code $website)"  $url
else
    # 정상
    echo "${website} is running!"
    echo
fi
