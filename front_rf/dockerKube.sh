#!/bin/bash

# if [ -z "$(ls -A ~/.ssh/perso)" ]; then
#     mv ~/.ssh/id_rsa* ~/.ssh/epitech
#     mv ~/.ssh/perso/* ~/.ssh/
#     echo "Conf Perso loaded"
# fi

docker build -t 162.19.66.30:7000/randomfun-frontend:kube-v0.4 .

docker push 162.19.66.30:7000/randomfun-frontend:kube-v0.4
