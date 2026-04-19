# Playbook: Bucket Público Indevido (AWS S3 / GCS)

## Quando acionar

- Detecção de bucket com acesso público não autorizado.
- Alerta de ferramenta de posture management.
- Report interno/externo sobre exposição de dados.

## Severidade inicial

`high` ou `critical` (se houver dados sensíveis/regulados).

## Objetivo

Interromper exposição de dados, medir impacto e restaurar postura segura.

---

## Fase 1 — Contenção imediata

1. Remover política ACL/bucket policy pública.
2. Habilitar bloqueios de acesso público no nível adequado.
3. Confirmar que objetos críticos não estão mais acessíveis anonimamente.

### Por que essa ordem?

A prioridade é parar a exfiltração potencial antes de qualquer análise aprofundada.

---

## Fase 2 — Escopo e impacto

1. Identificar quais objetos estiveram públicos.
2. Medir janela de exposição.
3. Classificar sensibilidade dos dados expostos.
4. Avaliar necessidade de comunicação formal (clientes, jurídico, regulador).

---

## Fase 3 — Correção estrutural

1. Implementar controle preventivo em IaC (Terraform) para bloquear configuração pública por padrão.
2. Adicionar check automatizado recorrente no pipeline e em runtime.
3. Criar exceção formal com prazo para casos legítimos de conteúdo público.

---

## Pós-incidente

1. Documentar causa raiz (erro manual, módulo inseguro, bypass de processo).
2. Ajustar processo de revisão de PR e políticas de merge.
3. Revisar buckets similares para evitar incidente irmão.

