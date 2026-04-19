# Módulos Terraform AWS (baseline de segurança)

Este diretório existe para transformar recomendações em configurações reproduzíveis.

## Módulos planejados

- `aws-cloudtrail-baseline`: habilitar trilhas e boas práticas de logging.
- `aws-iam-password-policy`: política mínima de senha para IAM.
- `aws-networking-baseline`: regras de rede mais restritivas e seguras.

## Por que em módulos?

- Reuso entre contas/ambientes.
- Menos configuração manual repetida.
- Revisão por PR (mudanças auditáveis).

