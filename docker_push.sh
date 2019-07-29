# making sure correct region is set
aws configure set default.region us-west-2

# Push image to ECR
###################

# I'm speculating it obtains temporary access token
# it expects aws access key and secret set
# in environmental vars
$(aws ecr get-login --no-include-email)

# update latest version
docker tag noneedrelax/docker-react:latest ${REGISTRY_ID}/frontend:latest
docker push ${REGISTRY_ID}/frontend:latest

