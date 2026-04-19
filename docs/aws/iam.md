# AWS IAM - fundamentos para iniciantes

## Por que IAM é prioridade?

IAM controla **quem pode fazer o quê**. Se permissões estiverem amplas demais, um erro humano ou credencial comprometida causa incidentes graves.

## Controles iniciais recomendados

1. MFA para conta root.
2. Política de senha forte para usuários IAM.
3. Evitar políticas com `"Action": "*"` e `"Resource": "*"`.

## Estratégia prática

- Primeiro: detectar permissões excessivas.
- Segundo: reduzir privilégios com princípio de menor privilégio.
- Terceiro: automatizar com policy-as-code e revisão por PR.

