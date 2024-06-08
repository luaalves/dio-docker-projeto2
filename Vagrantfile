# -*- mode: ruby -*-
# vi: set ft=ruby  :

# Definição das VMs a serem criadas no VirtualBox
machines = {
  "chefe"       => {"memory" => "1024", "cpu" => "1", "ip" => "100", "image" => "bento/ubuntu-24.04"},
  "guerreiro01" => {"memory" => "1024", "cpu" => "1", "ip" => "101", "image" => "bento/ubuntu-24.04"},
  "guerreiro02" => {"memory" => "1024", "cpu" => "1", "ip" => "102", "image" => "bento/ubuntu-24.04"}
}

# Loop de criação das máquinas
Vagrant.configure("2") do |config|
  # Para cada item no JSON/Dicionário:
  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|

      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}"
      machine.vm.network "private_network", ip: "10.10.10.#{conf["ip"]}", netmask: "255.255.255.0"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
      end

      machine.vm.provision "shell", path: "docker.sh" # Instalação do Docker
      
      if "#{name}" == "chefe"
        machine.vm.provision "shell", path: "manager.sh" # Script para criar o cluster e gerar o executável para se juntar ao cluster
        machine.vm.provision "shell", path: "service.sh" # Script para o deploy da aplicação no cluster
      else
        machine.vm.provision "shell", path: "worker.sh" # Script para se juntar ao cluster
      end
    end
  end
end