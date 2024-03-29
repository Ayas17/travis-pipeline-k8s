docker pull mkulaa1/hello-image:latest
docker build -t mkulaa1/hello-ticket:latest -t mkulaa1/hello-ticket:$SHA -f ./CreateTicket/Dockerfile ./CreateTicket
docker build -t mkulaa1/hello-ticket-mock:latest -t mkulaa1/hello-ticket-mock:$SHA -f ./CreateTicketMock/Dockerfile ./CreateTicketMock

docker push mkulaa1/hello-ticket:latest
docker push mkulaa1/hello-ticket-mock:latest

docker push mkulaa1/hello-ticket:$SHA
docker push mkulaa1/hello-ticket-mock:$SHA

kubectl apply -f k8s

kubectl set image deployments/createticket-deployment createticket=mkulaa1/hello-ticket:$SHA
kubectl set image deployments/createticketmock-deployment createticketmock=mkulaa1/hello-ticket-mock:$SHA