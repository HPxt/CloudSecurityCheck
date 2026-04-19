# Playbook: Credencial Comprometida (AWS/GCP)

## Quando acionar

- Uso suspeito de usuário privilegiado.
- Login de local/inconsistência incomum.
- Chave/token vazado em repositório, ticket ou chat.

## Severidade inicial

`high` (subir para `critical` se houver acesso a dados sensíveis ou ações destrutivas).

## Objetivo

Conter rapidamente o acesso indevido e preservar evidências para investigação.

---

## Fase 1 — Contenção (0 a 15 min)

1. Revogar sessão ativa e desabilitar credencial afetada.
2. Rotacionar segredos associados.
3. Bloquear caminhos de uso suspeitos (IP, role, service account, etc.).
4. Notificar on-call de segurança e dono do sistema.

### Por que essa ordem?

Primeiro reduzimos risco ativo; depois estabilizamos comunicação para não perder tempo com desalinhamento.

---

## Fase 2 — Investigação rápida (15 a 60 min)

1. Levantar timeline com logs de autenticação e ações administrativas.
2. Identificar recursos acessados/modificados.
3. Classificar impacto (dados, disponibilidade, integridade).
4. Decidir se precisa acionar resposta ampliada/jurídico/compliance.

### Evidências mínimas

- Janela de tempo afetada.
- Identidade comprometida.
- Lista de ações executadas.
- Sistemas impactados.

---

## Fase 3 — Erradicação e recuperação (1h+)

1. Aplicar credenciais novas e seguras.
2. Corrigir causa raiz (MFA ausente, role excessiva, chave estática sem rotação).
3. Restaurar configurações alteradas indevidamente.
4. Monitorar sinais de recorrência por 24–72h.

---

## Pós-incidente (lições aprendidas)

1. Registrar RCA (root cause analysis).
2. Atualizar controles preventivos (ex.: política de acesso, expiração de credenciais, alertas).
3. Atualizar este playbook com gaps encontrados.

