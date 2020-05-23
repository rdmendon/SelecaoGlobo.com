Iniciando em 22/05 as 18:30
* Criei um diretório em minha maquina (Windows) e iniciei o cmder, criando o diretorio C:\Users\Richard\Desktop\DEVOPS\Terraform\SelecaoGlobo.com, iniciei um repositorio com git init.
* Após a criação, li os requerimentos, o readme e o exercicio, verifiquei meus arquivos de Terraform e encontrei uma estrutura ja usada contendo a criação da infra.
* Copiei os arquivos para o diretório novo e alterei algumas variaveis existentes. Iniciei o Terraform e o terraform ja criou uma maquina na AWS com a infraestrutura básica.
* Após a criação do servidor (teste) abri uma sessão do putty e acessei a maquina. Verifiquei a necessidade de instalar os requerimentos para a aplicação.
* Verifiquei que alguns modulos ja eram atualizados, mas decidi por colocar o comando de install dos modulos para garantir a funcionalidade.
* Pausa para dormir as 23:30

Iniciando em 23/05 as 09hrs
* Com a infraestrutura ja criada (ainda faltando alguns ajustes) fiz o login no servidor e tentei executar a aplicação
* Ao executar a aplicação, reparei que ela "travava o terminal", como um container que roda sem detach.
* Devido a este cenario, coloquei no script de subida da infra o comando de start da aplicação em nohup.
* Esta solução funcionou e consegui executar os testes enviados com o curl
* Como esta solução é "feia", resolvi partir para o docker.
* Alterei o main para baixar o docker e puxar os arquivos necessarios do git para o diretorio de trabalho.
* Criei um dockerfile com o necessário e para minha surpresa, ao subir a aplicação, tive o mesmo resultado.
* Encontrei 2 formas de subir, com nohup e com o comando CMD ["gunicorn --log-level debug api:app"]
* A imagem foi criada com sucesso, agora ao rodar o container ele não esta executando, estou pesquisando agora.
* Pausa para o almoço as 12hrs