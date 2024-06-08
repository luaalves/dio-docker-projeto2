#/bin/bash

# Impedindo que os container sejam criados no Nó Gerenciador
docker node update --availability drain chefe

# Criar o serviço
docker stack deploy --compose-file /vagrant/compose.yml app