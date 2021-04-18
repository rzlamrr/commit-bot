#!/bin/bash

export TZ=Asia/Jakarta

arr[0]="bot: 👋 Hello Github!"
arr[1]="bot: 🥳 Yeayyy!"
arr[2]="bot: 😬 Working from github."
arr[3]="bot: 👨‍💻 Work, work, work!"
arr[4]="bot: 😪 Work again!"
arr[5]="bot: 😎 I'm working for my master!"
arr[6]="bot: 🙄 Running task, again."
arr[7]="bot: 👻 Thanks master."

api[0]="https://api.quotable.io/random"
api[1]="https://goquotes-api.herokuapp.com/api/v1/random?count=1"

rand=$[$RANDOM % ${#arr[@]}]
rapi=$[$RANDOM % ${#api[@]}]

clean() {
    rm -rf data.json README.md
}

quotes() {
    if curl -s ${api[$rapi]} > data.json; then
        quote=$(jq -r '.content' data.json)
        if [[ "$quote" == "null" ]]; then
            quote=$(jq -r '.quotes[] .text' data.json)
            author=$(jq -r '.quotes[] .author' data.json)
        else
            quote=$(jq -r '.content' data.json)
            author=$(jq -r '.author' data.json)
        fi
    fi
}

tgl=$(date '+%D %R %Z')

clean
quotes
rm -f data.json

echo "<h2 align=\"center\">Quote of The Day</h2>
<h3 align=\"center\"><i>\"${quote}\"</i></h3>
<h2 align=\"center\">- ${author}</h2>


<h5 align=\"center\"><i>updated:  ${tgl}</i></h5>" > README.md

git config --local user.email "rzlamrr.dvst@protonmail.com"
git config --local user.name "rzlamrr"
git commit -asm "${arr[$rand]} (${tgl})"
