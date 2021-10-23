docker build -t mkulaa1/hello-ticket:latest -t mkulaa1/hello-ticket:$SHA -f ./CreateTicket.application_1.0.0/Dockerfile ./CreateTicket.application_1.0.0
docker build -t mkulaa1/hello-ticket-mock:latest -t mkulaa1/hello-ticket-mock:$SHA -f ./CreateTicketTest.application_1.0.0/Dockerfile ./CreateTicketTest.application_1.0.0

docker push mkulaa1/hello-ticket:latest
docker push mkulaa1/hello-ticket-mock:latest

docker push mkulaa1/hello-ticket:$SHA
docker push mkulaa1/hello-ticket-mock:$SHA

kubectl apply -f k8s
kubectl set image deployments/createticket-deployment createticket=mkulaa1/hello-ticket:$SHA
kubectl set image deployments/createticketmock-deployment createticketmock=mkulaa1/hello-ticket-mock:$SHA