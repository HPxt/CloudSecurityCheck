# Contribuindo com o CloudSecurityCheck

Obrigado por querer contribuir.

## Princípios do projeto

1. Clareza para iniciantes.
2. Verificações simples e auditáveis.
3. Correções reproduzíveis com Terraform (AWS).

## Como propor um novo controle

1. Adicione documentação no domínio correto em `docs/`.
2. Crie script em `checks/<cloud>/<dominio>/`.
3. Atualize a linha correspondente em `docs/matriz-cis.md`.
4. Se for AWS, vincule uma estratégia Terraform em `terraform/aws/modules/`.
5. Inclua exemplo de evidência em `output/examples/`.

## Padrões de script

- Deve retornar JSON simples.
- Use `PASS`, `FAIL`, `WARN` ou `ERROR`.
- Mensagens objetivas e sem jargão excessivo.

