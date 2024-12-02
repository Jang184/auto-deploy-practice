### 방법 1 S3를 활용한 EC2 배포 자동화
1. AWS 리소스 생성
	1. VPC 환경 구축
	2. VPC 내 EC2 생성 및 S3버킷 생성
	3. IAM 역할/사용자 생성(ec2, github actions용)
2. EC2 초기 설정
	1.  EC2에 SSH 접속 (pem 키 권한 설정 필요: chmod 400)
	2. nodejs, npm 설치
	3. pm2 설치 (서버 실행용)
	4. AWS CLI 설치 (SSM agent 상태 확인)
3. 배포 스크립트 생성
	1. 작성 후 s3에 업로드
4. github actions workflow 설정 (./github/workflow/deploy-using-s3.yaml)

### 방법 2 컨테이너 기반 배포 자동화
1. Docker 이미지 준비
	1. Dockerfile 작성
	2. 로컬에서 도커 이미지 빌드 및 테스트
2. AWS ECR 준비
	1. AWS ECR 로그인
3. EC2 환경 설정
	1. CodeDeploy agent 설치
	2. 도커 설치
	3. AWS CLI 설치
4. CodeDeploy 설정
	1. 애플리케이션, 배포 그룹 생성
	2. appspec.yml 파일 작성 (배포 스크립트 포함)
		- ApplicationStop - 기존 컨테이너 중지
		- ApplicationStart - 새 컨테이너 시작
5. github actions workflow 설정
	1. 환경변수 파일 관리