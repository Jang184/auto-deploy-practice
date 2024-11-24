#!/bin/bash

echo "Starting deployment at $(date)"

# 애플리케이션 디렉토리로 이동
cd /home/ec2-user/app

# 이전 배포 백업
if [ -f deploy.zip ]; then
    mv deploy.zip deploy.zip.backup
fi

# S3에서 새로운 배포 파일 다운로드
aws s3 cp s3://undefineddev-for-deploy/deploy.zip .

# 기존 node_modules 백업
if [ -d node_modules ]; then
    mv node_modules node_modules_backup
fi

# 새 버전 압축 해제
unzip -o deploy.zip

# node_modules 복구 및 새 패키지 설치
if [ -d node_modules_backup ]; then
    mv node_modules_backup node_modules
fi
npm install

# PM2로 애플리케이션 재시작
if pm2 list | grep -q "app"; then
    pm2 reload app
else
    pm2 start src/index.js --name app
fi

# 배포 결과 확인
echo "Deployment completed at $(date)"
pm2 status

# 오래된 백업 파일 정리
find . -name "*.backup" -mtime +7 -exec rm {} \;