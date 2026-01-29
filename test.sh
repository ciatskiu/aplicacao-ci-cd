#!/bin/bash

URL="http://localhost:3000"

echo "Testando aplicação em $URL..."

STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)

if [ "$STATUS" -eq 200 ]; then
  echo "Teste passou! Aplicação respondendo."
  exit 0
else
  echo "Teste falhou! Código HTTP: $STATUS"
  exit 1
fi
