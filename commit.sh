#!/bin/bash

arr[0]="bot: 👋 Hello Github!"
arr[1]="bot: 🥳 Yeayyy!"
arr[2]="bot: 😬 Working from github."
arr[3]="bot: 👨‍💻 Work, work, work!"
arr[4]="bot: 😪 Work again!"
arr[5]="bot: 😎 I'm working for my master!"
arr[6]="bot: 🙄 Running task, again."
arr[7]="bot: 👻 Thanks master."
rand=$[$RANDOM % ${#arr[@]}]

export TZ=Asia/Jakarta
tgl=`date '+%D %R %Z'`

echo "## 🤔 LAST UPDATED: ${tgl}" > UPDATE.md

git config --local user.email "rizal82rebel@gmail.com"
git config --local user.name "rzlamrr"
git add UPDATE.md
git commit -am "${arr[$rand]} (${tgl})"
