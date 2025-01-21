
# Calculadora de IMC em Flutter

Este é um aplicativo simples de **Calculadora de IMC (Índice de Massa Corporal)**, desenvolvido usando **Flutter**. O aplicativo permite ao usuário inserir seu peso e altura, calcular o IMC e ver a classificação do IMC com base nos resultados.

## Funcionalidades

- **Entrada de Peso e Altura**: O usuário pode inserir seu peso (em kg) e altura (em metros).
- **Cálculo do IMC**: O aplicativo calcula automaticamente o IMC utilizando a fórmula: 
  \[
  IMC = rac{peso}{altura^2}
  \]
- **Classificação do IMC**: Após o cálculo, o aplicativo exibe a classificação do IMC, que pode ser:
  - Abaixo do peso
  - Peso normal
  - Sobrepeso
  - Obesidade Grau I
  - Obesidade Grau II
  - Obesidade Grau III
- **Cor de Resultados Dinâmica**: A cor da borda e do texto do resultado muda de acordo com a classificação do IMC (verde, azul, amarelo, laranja, vermelho e roxo).

## Tecnologias Utilizadas

- **Flutter**: Framework para o desenvolvimento de interfaces móveis nativas.
- **Dart**: Linguagem de programação usada no Flutter.

## Como Usar

### Pré-requisitos

Certifique-se de ter o **Flutter** instalado em sua máquina. Se não tiver o Flutter instalado, siga as instruções no site oficial para configurar o ambiente de desenvolvimento:

[Instalação do Flutter](https://flutter.dev/docs/get-started/install)

### Instalar o Projeto

1. Clone o repositório para a sua máquina local:

   ```bash
   git clone https://github.com/DaviRibeiro06/calculadora-imc-flutter.git
   ```

2. Navegue até o diretório do projeto:

   ```bash
   cd calculadora-imc-flutter
   ```

3. Instale as dependências do projeto:

   ```bash
   flutter pub get
   ```

### Executar o Projeto

Para rodar o aplicativo em um dispositivo conectado ou emulador, execute:

```bash
flutter run
```

## Como Funciona

1. O usuário insere o peso e a altura nos campos de texto.
2. Após clicar no botão "Calcular", o IMC é calculado.
3. A classificação do IMC e a cor da borda da caixa de resultado são atualizadas de acordo com o valor do IMC.
4. Caso haja erro na conversão dos valores (por exemplo, valores vazios ou não numéricos), os campos são limpos e o IMC é reiniciado.

## Estrutura do Código

- **main.dart**: Contém o código principal do aplicativo. Aqui está a definição da interface do usuário, as entradas de dados, o cálculo do IMC e a exibição dos resultados.
- **Funções de Classificação e Cor**: A lógica que calcula o IMC e determina sua classificação e a cor da borda com base no valor do IMC.

## Contribuindo

Se você quiser contribuir para o projeto, fique à vontade para abrir uma **issue** ou enviar um **pull request**.

1. Faça um fork do repositório.
2. Crie uma nova branch para suas alterações:
   ```bash
   git checkout -b minha-nova-alteracao
   ```
3. Faça suas alterações e commit:
   ```bash
   git commit -am 'Descrição das alterações'
   ```
4. Envie para o seu fork:
   ```bash
   git push origin minha-nova-alteracao
   ```
5. Abra um pull request para o repositório original.

## Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## Contato

- **Autor**: Davi Ribeiro
- **E-mail**: daviribeiro954@gmail.com
- **GitHub**: https://github.com/DaviRibeiro06
- **Linkedin**: https://www.linkedin.com/in/davi-ri/
