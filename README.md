[![Blog](https://img.shields.io/website?down_color=blue&down_message=infrati.dev&label=Blog&logo=ghost&logoColor=green&style=for-the-badge&up_color=blue&up_message=infrati.dev&url=https%3A%2F%2Finfrati.dev)](https://infrati.dev)

### Verificando custo da infraestrutura a ser modificada na abertura de um PR utilizando github action realizando autenticação via OIDC na AWS dentro do workflow assumindo uma role específica com acessos aos recursos necessários.

#### Contents 
  - [09-ec2-webserver-infracost-oidc](09-ec2-webserver-infracost-oidc/)

#### Requirements
  - Inicialmente precisamos provisionar a estrutura necessária para o backend e OpenID Connect. Para isso iremos utilizar o código pronto feito para esse projeto, localizado no repositório [08-remote-state-infracost](https://github.com/infratidev/terraform-aws/tree/main/08-remote-state-infracost)
  - Iremos utilizar a o output ```role_arn``` gerado no provisionamento do ```08-remote-state-infracost``` e realizar o cadastro no repositório de secrets do github com o nome de ```ROLEARN```
  - Gerar a API key do infracost, link da documentação para realizar a criação da key: [Infracost Docs](https://www.infracost.io/docs/)
  - Cadastrar a API key do infracost no repositório de secrets do github com o nome de ```INFRACOST_API_KEY```
  - Realizar um primeiro provisionamento da estrutura [09-ec2-webserver-infracost-oidc](09-ec2-webserver-infracost-oidc/) localizada nesse repositório, para realizarmos a alteração do tamanho da instância no PR, infracost irá exibir as informações de custos envolvidos no processo.

  
Output gerado no provisionamento da estrutura ```08-remote-state-infracost```

![08-remote-state-infracost-arn](https://drive.google.com/uc?export=view&id=1u5gr95q8mGTXdJCXp5GPjp8A7vXmpV3C)

Estrutura inicial ```09-ec2-webserver-infracost-oidc``` provisionada

![09-ec2-webserver-infracost-oidc](https://drive.google.com/uc?export=view&id=13lKv7gl9Un4VnA27LBkQoTWEWpn50BVl)

A estrutura inicial provisionada possui uma instancia ec2 ```t2.nano```. Criar uma branch nova, realizar a alteração para ```t2.micro``` e abrir um PR.

Infracost irá iniciar a análise realizando um plan da estrutura.

![infracost-pr](https://drive.google.com/uc?export=view&id=16GBfL_j1mlDHH-zHffcwvaiCk0d1ZVud)

Conforme imagem acima  é exibido no PR o valor da estrutura atual e o novo valor com a modificação.

Expandindo o ```infracost output``` temos uma visão mais detalhada do que foi analisado:

![infracost-output-pr](https://drive.google.com/uc?export=view&id=1DbYgSoMISxCOBoYCyU1JsHcOzSrFoq12)

<br>

[![Blog](https://img.shields.io/website?down_color=blue&down_message=infrati.dev&label=Blog&logo=ghost&logoColor=green&style=for-the-badge&up_color=blue&up_message=infrati.dev&url=https%3A%2F%2Finfrati.dev)](https://infrati.dev)


