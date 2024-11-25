#!/bin/bash

echo "Starting deployment at $(date)"

# 애플리케이션 디렉토리로 이동
cd /home/ec2-user/app

# S3에서 새로운 배포 파일 다운로드
aws s3 cp s3://undefineddev-for-deploy/deploy.zip .


# 새 버전 압축 해제
unzip -o deploy.zip

# 패키지 설치
npm install

# PM2로 애플리케이션 재시작
if pm2 list | grep -q "app"; then
    pm2 reload app
else
    pm2 start index.js --name app
fi

# 배포 결과 확인
echo "Deployment completed at $(date)"
pm2 status
