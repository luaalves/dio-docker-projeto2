# dio-docker-projeto2

## Descrição do Desafio

O objetivo deste projeto é criar um cluster Swarm local utilizando máquinas virtuais criadas com o Vagrant, atendendo aos seguintes requisitos:

- Deve haver no mínimo um nó manager e um nó worker.
- Cada máquina virtual deve ter um IP fixo.
- Todas as VMs devem possuir o Docker instalado.

## Escopo da Solução Proposta

O cluster será composto pelos seguintes nós:

- **chefe**: Nó manager
- **guerreiro1**: Nó worker 1
- **guerreiro2**: Nó worker 2

Além disso, serão definidos os seguintes detalhes:

- Rede privada na faixa 10.10.10.0/24.
- O cluster hospedará uma aplicação web (Apache/PHP) distribuída entre os nós.
- O conteúdo do site está na pasta `website`, que será replicada através do diretório `/vagrant` utilizando um Bind Volume.
- O nó manager não executará nenhum container da aplicação.

### Pré-requisitos

- Ter o [Vagrant](https://www.vagrantup.com/downloads) instalado.
- Ter o [VirtualBox](https://www.virtualbox.org/wiki/Downloads) instalado.

## Execução

1. Clonar o repositório:
    ```sh
    git clone <URL-do-repositório>
    cd dio-docker-projeto2
    ```
2. Iniciar o ambiente:
    ```sh
    vagrant up
    ```
3. Acessar a aplicação web no navegador em [http://10.10.10.100](http://10.10.10.100).

## Estrutura do Projeto

- **Vagrantfile**: Configurações das máquinas virtuais.
- **docker.sh**: Instalação do Docker.
- **manager.sh**: Criação do cluster Swarm e exportação do comando para adicionar VMs ao cluster.
- **worker.sh**: Comando para se juntar ao cluster.
- **compose.yml**: Definição do container da aplicação web.
- **service.sh**: Deploy da aplicação no cluster.
- **website/**: Diretório contendo os arquivos da aplicação web.