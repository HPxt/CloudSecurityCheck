# Playbook: Escalação de Privilégios IAM

## Quando acionar

- Detecção de grants inesperados para roles/policies administrativas.
- Mudança suspeita em trust policy ou bindings críticos.
- Ações de criação/anexo de política fora da janela normal.

## Severidade inicial

`critical`.

## Objetivo

Conter caminho de escalação, reverter permissões indevidas e impedir recorrência.

---

## Fase 1 — Contenção

1. Remover/neutralizar permissões recém-concedidas de alto risco.
2. Bloquear principal suspeito (usuário/role/service account) de forma controlada.
3. Preservar logs e artefatos para investigação.

---

## Fase 2 — Análise de caminho de ataque

1. Identificar qual permissão permitiu a escalação.
2. Verificar encadeamento de ações (quem alterou o quê, quando, de onde).
3. Mapear impacto potencial em recursos críticos.

### Atenção

Não trate só o sintoma (grant final); elimine também o mecanismo que permitiu escalar.

---

## Fase 3 — Remediação definitiva

1. Redesenhar papéis com menor privilégio.
2. Aplicar guardrails no nível organizacional (SCP/policies equivalentes).
3. Inserir detecções específicas para eventos de alteração de privilégios.
4. Exigir revisão de segurança para mudanças IAM sensíveis.

---

## Pós-incidente

1. Registrar indicadores de compromisso e regras de detecção atualizadas.
2. Rodar exercício de recidiva para validar que o caminho foi fechado.
3. Atualizar matriz de riscos e backlog de hardening.

