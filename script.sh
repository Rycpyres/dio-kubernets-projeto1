!#/bin/bash

echo "Criando as imagens..."

docker build -t rycpyres/projeto-backend:1.0 backend/.
docker build -t rycpyres/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push rycpyres/projeto-backend:1.0
docker push rycpyres/projeto/database:1.0

echo "Criando serviços no cluster kubernets..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl applu -f ./deployment.yml