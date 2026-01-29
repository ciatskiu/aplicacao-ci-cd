#!/bin/bash # Define que o script será executado utilizando o interpretador Bash

URL="http://localhost:3000" # Define a variável URL com o endereço da aplicação que será testada

echo "Testando aplicação em $URL..." # Exibe uma mensagem informando qual aplicação está sendo testada

STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)
# Executa uma requisição HTTP para a URL informada:
# -s              → modo silencioso (não mostra logs)
# -o /dev/null    → descarta o corpo da resposta
# -w "%{http_code}" → retorna apenas o código HTTP
# O código HTTP retornado é armazenado na variável STATUS

if [ "$STATUS" -eq 200 ]; then # Verifica se o código HTTP retornado é 200 (OK)
  echo "Teste passou! Aplicação respondendo." # Exibe mensagem indicando que a aplicação respondeu corretamente
  exit 0 # Encerra o script com código 0 (sucesso), indicando que o teste passou
else # Executa este bloco caso o código HTTP não seja 200
  echo "Teste falhou! Código HTTP: $STATUS" # Exibe mensagem de erro informando o código HTTP retornado
  exit 1 # Encerra o script com código diferente de zero (erro), fazendo o pipeline de CI falhar
fi # Finaliza a estrutura condicional if

