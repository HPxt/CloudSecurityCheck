# AWS - Guia Avançado

Este guia é para ambientes com alta exigência de segurança, escala multi-conta e governança forte.

## 1) Arquitetura de segurança organizacional

### Meta
Ter um modelo de segurança por design, não por correções tardias.

### Dicas avançadas
1. **Organização multi-conta com guardrails**: separar contas por função (prod, sec, log archive, shared services).
2. **SCPs estratégicas**: bloquear ações de alto risco no nível organizacional.
3. **Centralização de telemetria**: trilhas e logs críticos em contas dedicadas com proteção contra alteração.

### Por que isso importa
Evita dependência de comportamento perfeito em cada conta individual.

---

## 2) IAM avançado e identidade federada

### Meta
Reduzir credenciais de longa duração e elevar rastreabilidade de identidade.

### Dicas avançadas
1. Priorize federação (SSO/IdP) e minimize usuários IAM locais.
2. Use papéis de curta duração para acesso privilegiado.
3. Aplique controles de sessão e trilha de auditoria de acesso administrativo.

### Por que isso importa
Ataques modernos exploram credenciais esquecidas e privilégios persistentes.

---

## 3) Detecção e resposta orientadas a risco

### Meta
Transformar sinais em resposta coordenada.

### Dicas avançadas
1. Correlacione eventos de IAM + rede + dados para reduzir falso positivo.
2. Crie playbooks automatizados para incidentes recorrentes.
3. Defina métricas de detecção e resposta (MTTD/MTTR) por tipo de ameaça.

### Por que isso importa
Maturidade real aparece quando o time responde rápido e com consistência.

---

## 4) Terraform + policy as code

### Meta
Garantir que mudanças inseguras sejam barradas antes de produção.

### Dicas avançadas
1. Faça enforce de políticas de segurança no pipeline (policy as code).
2. Bloqueie merge quando controles críticos falharem.
3. Versione módulos de segurança como produtos internos com SLA de atualização.

### Por que isso importa
Em ambientes grandes, prevenção no pipeline é mais barata que remediação pós-deploy.

