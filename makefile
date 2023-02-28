IMAGE_NAME='deepl-bot-image'
REGION="ap-northeast-1"
ACCOUNT_ID="232611003204"
REPOSITORY_on_ECR="deepl-for-slack"

build:
	docker build -t $(IMAGE_NAME):latest .

# Log in to ECR
login_ECR:
	aws ecr get-login-password --region $(REGION) | docker login --username AWS --password-stdin $(ACCOUNT_ID).dkr.ecr.$(REGION).amazonaws.com

# Tag the version
tag:
	docker tag $(IMAGE_NAME):latest $(ACCOUNT_ID).dkr.ecr.$(REGION).amazonaws.com/$(REPOSITORY_on_ECR):latest

# Push the image to ECR
push:
	docker push $(ACCOUNT_ID).dkr.ecr.$(REGION).amazonaws.com/$(REPOSITORY_on_ECR):latest

# Run the container locally
run:
	docker run -it $(IMAGE_NAME):latest
