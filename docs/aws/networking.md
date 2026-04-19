# AWS Networking - controles de exposição

## Conceito para iniciantes

Regra de rede aberta demais = superfície de ataque ampliada.

## Controles iniciais

1. Revisar Security Groups com `0.0.0.0/0` em portas sensíveis.
2. Segmentar ambientes (dev/staging/prod).
3. Documentar exceções temporárias com prazo de expiração.

