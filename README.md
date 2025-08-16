# Deploy a python app with Docker and Kubernetes

## Build and Deploy Docker container
docker build -t python-api .
docker run -d -p 3000:3000 python-api

## Deploy to Kubernetes
kubectl apply -f k8s-deployment.yml

## Check status and view port
kubectl get svc 

# Access the app in the extenal IP
http://EXTERNAL-IP:PORT/





