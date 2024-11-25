### 방법 1 S3를 활용한 EC2 배포 자동화
1. AWS 리소스 생성
	1. VPC 환경 구축
	2. VPC 내 EC2 생성 및 S3버킷 생성
	3. IAM 역할/사용자 생성(ec2, github actions용)
2. EC2 초기 설정
	1.  EC2에 SSH 접속 (pem 키 권한 설정 필요: chmod 400)
	2. nodejs, npm 설치
	3. pm2 설치 (서버 실행용)
	4. AWS CLI 설치
3. 배포 스크립트 생성
	1. 작성 후 s3에 업로드
4. github actions workflow 설정