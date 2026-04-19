# GCP - Guia Intermediário

Este guia assume que você já cobre o básico e quer aumentar confiabilidade e controle.

## 1) IAM orientado a função real

### O que evoluir do básico
- Sair de papéis básicos amplos para papéis granulares e grupos por função.

### Dicas práticas
1. Reduza uso de `roles/editor` e `roles/owner` a casos excepcionais.
2. Centralize concessão via grupos.
3. Revise contas de serviço com escopo excessivo.

### Por que isso importa
No nível intermediário, o ganho vem de previsibilidade e menor erro operacional.

---

## 2) Logging e trilha de auditoria

### O que evoluir do básico
- Garantir que logs tenham retenção e sejam consultáveis para incident response.

### Dicas práticas
1. Defina sinks por ambiente e criticidade.
2. Padronize consultas para cenários de incidente comuns.
3. Monitore falha de exportação/ingestão de logs.

### Por que isso importa
A organização cresce e o tempo de investigação precisa cair, não subir.

---

## 3) Rede com foco em exposição

### O que evoluir do básico
- Sair de revisão pontual e adotar regra de menor exposição por padrão.

### Dicas práticas
1. Revise regras ingress amplas com cadência semanal.
2. Restrinja portas administrativas por CIDR corporativo ou acesso controlado.
3. Documente exceções com justificativa e expiração.

### Por que isso importa
Controle contínuo evita regressões silenciosas.

