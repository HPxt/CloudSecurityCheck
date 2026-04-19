# AWS - Guia Intermediário

Este guia é para quando você já saiu do básico e quer elevar maturidade com práticas mais robustas.

## 1) IAM com foco em redução de risco real

### O que evoluir do básico
- Sair de revisão manual eventual para revisão contínua de permissões.
- Identificar permissões não utilizadas e remover excesso de privilégio.

### Dicas práticas
1. **Use Access Analyzer** para identificar acesso externo e caminhos de trust arriscados.
2. **Mapeie ações realmente usadas** (CloudTrail + policy refinement) antes de apertar permissões.
3. **Padronize permission boundaries** para times que criam papéis dinamicamente.

### Por que isso importa
No nível intermediário, o risco principal já não é só “porta aberta”, mas **privilégio acumulado ao longo do tempo**.

---

## 2) Logging e detecção

### O que evoluir do básico
- Não basta ter CloudTrail ligado: é preciso transformar logs em detecção acionável.

### Dicas práticas
1. Envie logs críticos para conta de segurança dedicada.
2. Crie alarmes para eventos sensíveis (ex.: alteração de trilhas, mudanças IAM administrativas).
3. Defina retenção por criticidade e custo.

### Por que isso importa
Sem alertas relevantes, logging vira “arquivo morto”.

---

## 3) Rede e segmentação

### O que evoluir do básico
- Sair de “proibir 0.0.0.0/0 em portas conhecidas” para arquitetura segmentada por domínio de confiança.

### Dicas práticas
1. Divida workloads por VPC/subnet conforme criticidade.
2. Prefira tráfego privado via VPC endpoints para serviços AWS.
3. Trate regras temporárias como exceções com prazo e responsável.

### Por que isso importa
Segmentação reduz blast radius quando uma credencial ou workload é comprometido.

---

## 4) Terraform com governança

### O que evoluir do básico
- De “usar Terraform” para “operar Terraform com controles de qualidade”.

### Dicas práticas
1. Adote módulos versionados e convenções de naming/tags.
2. Exija revisão de segurança em PRs de infraestrutura.
3. Use validações (`terraform validate`, checks de policy) no pipeline.

### Por que isso importa
IaC sem governança pode automatizar erro em escala.

