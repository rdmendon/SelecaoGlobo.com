				Infraestrutura para executar API com o máximo de passos automatizados
Infraestrutura criada para o teste técnico da Globo.com

				Pré-Requisitos:
Todos os arquivos foram disponibilizados no diretório do git

				Passo a Passo da instalação:

•	Acessar o endereço do Git https://github.com/SelecaoGlobocom/richard-mendonca ou https://github.com/rdmendon/SelecaoGlobo.com e clonar/baixar os arquivos.

•	Neste endereço já tem todos os arquivos necessários.

•	IMPORTANTE: os arquivos config e credentials devem ser copiados para o seu diretório $HOME/.aws (exemplo - C:\Users\Richard\.aws)

•	A versão utilizada neste teste técnico é o Terraform v0.11.14 já contida nos arquivos.

•	Para executar o script, acessar o cmd e ir ao caminho onde baixou os arquivos.

•	Executar a sequência terraform init, terraform plan e terraform apply --auto-aprove

•	Executar o comando terraform show e procurar a tag "public_ip = xx.xx.xx.xx" este será o ip da instancia criada na aws

•	Agora, acesse a instancia criada com putty ou outro aplicativo de sua preferência passando como usuário e ip o seguinte: ec2-user@ip-público. 

•	Junto aos arquivos existe a chave de confiança chamada desafio-aws2.ppk

•	Com estas informações você acessará a aplicação.

•	Neste ponto, poderá executar um docker ps e verá que o container com a aplicação estará rodando na porta indicada.
Utilização
•	Para testar, basta usar os comandos fornecidos no próprio teste técnico
END POINT: http://172.17.198.133:5000/add_contact

# matéria 1
curl -sv localhost:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"alice@example.com","comment":"first post!","content_id":1}'

curl -sv localhost:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"alice@example.com","comment":"ok, now I am gonna say something more useful","content_id":1}'

curl -sv localhost:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"bob@example.com","comment":"I agree","content_id":1}'


# matéria 2
curl -sv localhost:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"bob@example.com","comment":"I guess this is a …


				Histórico e desafios encontrados:
Iniciando em 22/05 as 18:30
* Criei um diretório em minha maquina (Windows) e iniciei o cmder, criando o diretório C:\Users\Richard\Desktop\DEVOPS\Terraform\SelecaoGlobo.com, iniciei um repositório com git init.
* Após a criação, li os requerimentos, o readme e o exercício, verifiquei meus arquivos de Terraform e encontrei uma estrutura já usada contendo a criação da infra.
* Copiei os arquivos para o diretório novo e alterei algumas variáveis existentes. Iniciei o Terraform e o terraform já criou uma máquina na AWS com a infraestrutura básica.
* Após a criação do servidor (teste) abri uma sessão do putty e acessei a máquina. Verifiquei a necessidade de instalar os requerimentos para a aplicação.
* Verifiquei que alguns módulos já eram atualizados, mas decidi por colocar o comando de install dos módulos para garantir a funcionalidade.
* Pausa para dormir as 23:30

Iniciando em 23/05 as 09hrs
* Com a infraestrutura já criada (ainda faltando alguns ajustes) fiz o login no servidor e tentei executar a aplicação
* Ao executar a aplicação, reparei que ela "travava o terminal", como um container que roda sem detach.
* Devido a este cenário, coloquei no script de subida da infra o comando de start da aplicação em nohup.
* Esta solução funcionou e consegui executar os testes enviados com o curl
* Como esta solução é "feia", resolvi partir para o docker.
* Alterei o main para baixar o docker e puxar os arquivos necessários do git para o diretório de trabalho.
* Criei um dockerfile com o necessário e para minha surpresa, ao subir a aplicação, tive o mesmo resultado.
* Encontrei 2 formas de subir, com nohup e com o comando CMD ["gunicorn --log-level debug api:app"]
* A imagem foi criada com sucesso, agora ao rodar o container ele não esta executando, estou pesquisando agora.
* Pausa para o almoço as 12hrs

Iniciado em 24/05 as 08hrs
* Iniciando o dia eu tinha 2 missões: Executar a infra completa via terraform e rodar a imagem do docker criada
* O terraform cria a infra a instala todas as dependências no servidor através de um script (incluindo a imagem do docker)
* Após algumas pesquisas, tentei por ./ no inicio do script (sempre difícil encontrar exemplos de terraform com o erro que eu tenho)
* Feito isso, me deparei com um cenário bem estranho, hora o terraform plan executava tudo, inclusive o script de criação, hora ele pulava o script de criação.
* Quando funcionava tudo, fui ajustando os comandos do script para automatizar a subida da maquina.
* Por volta de 12hrs o terraform init não rodava mais o script de criação, ele simplesmente pulava, criando uma maquina em que eu tinha que atualizar tudo.
* Nesta hora em diante, resolvi atualizar o servidor manualmente e focar na imagem do docker, após muitas mudanças no dockerfile e testes, por volta de 18h consegui fazer ele executar
* Por volta das 18:30 encerrei.
* Foco agora é arrumar o terraform para rodar o script de criação, e começar a fazer o CI/CD, escolhi o github. Também já fiz uma refatoração nos arquivos, retirando os que não precisava mais.

Iniciando dia 25/05 as 13:00

* Teste efetuado as 13:40, criou a infraestrutura toda, com as dependências, criou a imagem mas o container não executou.
* Realizando o troubleshooting, vi que era um erro que obtive ontem, o script que executa a aplicação estava com caractere invalido, impedindo o container de executar.
* Efetuada a correção e ajustes, subi os arquivos novos no git e vou testar novamente.
* O teste efetuado não teve efeito, o script não executou a criação das dependências (intermitência).
* Após remover alguns arquivos, de testes (tfstate, .terraform) precisei baixar os plugins novamente (terraform init) e após a execução do apply, a infraestrutura funcionou como esperado.
Segue resultado do teste as 14:01

https://aws.amazon.com/amazon-linux-ami/2018.03-release-notes/
[ec2-user@ip-10-0-52-118 ~]$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
548066b8b1d3        richard:1.0         "/bin/sh -c ./run_ap…"   11 seconds ago      Up 11 seconds       0.0.0.0:8000->8000/tcp   flamboyant_robinson
[ec2-user@ip-10-0-52-118 ~]$


[ec2-user@ip-10-0-52-118 ~]$ curl -sv localhost:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"alice@example.com","comment":"first post!","content_id":1}'
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 8000 (#0)
> POST /api/comment/new HTTP/1.1
> Host: localhost:8000
> User-Agent: curl/7.61.1
> Accept: */*
> Content-Type: application/json
> Content-Length: 68
>
* upload completely sent off: 68 out of 68 bytes
* Recv failure: Connection reset by peer
* Closing connection 0
[ec2-user@ip-10-0-52-118 ~]$

* As 14:02 inicio a parte de CI/CD do ambiente


Iniciando 26/05 as 10:00

* Iniciei estudando um pouco CI/CD com github + terraform, confesso que é a parte que menos sei.
* Identifiquei os passos necessários para a criação do ci/cd com github + terraform
* Criei a estrutura no terraform cloud, criei a secret no github
* Ao executar o código, obtive erros de versionamento (estou usando terraform 0.11)
* Tentei adaptar o código, não consegui.
* Resolvi retornar ao código original, testei e funcionou.
* Criei um outro diretório na minha maquina para testar os códigos com o terraform 0.12
* Parando para descansar as 13:00..

Iniciando dia 27/05 as 09:30

* Ontem fiquei um bom tempo tentando usar o hooks do Github para automatizar o deploy, mas não consegui e não encontrei nada que me ajudasse.
* Ao pesquisar, vi que geralmente usam o Ansible para fazer o deploy, e eu estou fazendo de uma forma não convencional.
* Pelo que apurei, a forma que fiz a infra e a versão do terraform, o que fiz é bem próximo da automação pedida, faltando apenas o deploy automático ao realizar commit.
* O que iniciarei agora é deixar o código mais amigável e colocar as instruções de execução no readme.
* Também vou iniciar uma versão com o terraform 0.12 ao qual copiei, mas caso esta não funcione ou não de tempo, será entregue a versão atual.
