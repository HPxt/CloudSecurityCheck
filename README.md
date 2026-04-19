# CloudSecurityCheck

Repositório de **checklists de segurança cloud (AWS + GCP)** baseados no CIS Benchmark, com foco em:

1. **Curadoria didática** (explicar o porquê de cada controle).
2. **Verificação automatizada simples** (scripts fáceis de entender e manter).
3. **Remediação com Terraform na AWS** (infraestrutura como código para aplicar boas práticas).

> Objetivo: ser útil para iniciantes e também para times de plataforma/segurança que precisam de um ponto de partida confiável.

---

## 1) Como pensar esse projeto (visão para iniciantes)

Segurança em cloud não é só “rodar ferramenta”. É um ciclo:

- **Definir o que é seguro** (ex.: CIS Benchmark).
- **Verificar o estado atual** (scripts/checks).
- **Corrigir de forma repetível** (Terraform, especialmente na AWS).
- **Registrar evidências** (saídas JSON/Markdown para auditoria).

Sem esse ciclo, você depende de verificações manuais e memória humana, o que não escala.

---

## 2) Estrutura do repositório

```text
cloud-security-checklists/
├─ README.md
├─ docs/
│  ├─ metodologia.md
│  ├─ matriz-cis.md
│  ├─ aws/
│  │  ├─ iam.md
│  │  ├─ logging.md
│  │  └─ networking.md
│  └─ gcp/
│     ├─ iam.md
│     ├─ logging.md
│     └─ networking.md
├─ checks/
│  ├─ aws/
│  │  ├─ iam/
│  │  ├─ logging/
│  │  └─ networking/
│  └─ gcp/
│     ├─ iam/
│     ├─ logging/
│     └─ networking/
├─ terraform/
│  ├─ aws/
│  │  ├─ modules/
│  │  └─ examples/
│  └─ policies/
├─ output/
│  └─ examples/
└─ .github/workflows/
```

Por que isso ajuda?

- `docs/`: aprendizado e decisões.
- `checks/`: execução prática e objetiva.
- `terraform/`: padronização da correção na AWS.
- `output/`: evidência para compliance e auditoria.

---

## 3) Padrão de um controle (o coração do projeto)

Todo controle CIS deve seguir um mesmo formato. Isso facilita leitura, manutenção e revisão.

Use o template em `docs/metodologia.md`, com os campos:

- **ID CIS**
- **Objetivo de segurança (por que existe)**
- **Risco se ignorar**
- **Validação manual**
- **Validação automática (script)**
- **Remediação**
- **Terraform AWS relacionado**
- **Evidência esperada**
- **Exceções aceitas**

---

## 4) Como executar os checks (primeiros passos)

### Requisitos mínimos

- AWS CLI configurada (para checks AWS).
- gcloud CLI configurado (para checks GCP).
- Bash (scripts atuais são shell simples).

### Exemplos

```bash
# AWS - CloudTrail habilitado
./checks/aws/logging/check_cloudtrail_enabled.sh --profile default

# AWS - política de senha da conta
./checks/aws/iam/check_account_password_policy.sh --profile default

# GCP - audit logging habilitado
./checks/gcp/logging/check_audit_logging_enabled.sh --project meu-projeto
```

Os scripts retornam JSON simples com:

- `id`
- `cloud`
- `severity`
- `status` (`PASS`, `FAIL`, `WARN`, `ERROR`)
- `evidence`
- `recommendation`

---

## 5) Prioridade recomendada (primeiro sprint)

Se você está começando agora, implemente primeiro controles de maior impacto:

### AWS (com Terraform)

1. Root account com MFA
2. CloudTrail multi-region
3. AWS Config habilitado
4. S3 com bloqueio público
5. Security Groups sem portas críticas abertas para internet

### GCP

1. Cloud Audit Logs habilitado
2. IAM sem papéis básicos amplos (`roles/editor`, etc.)
3. Buckets públicos indevidos
4. Regras de firewall permissivas demais

---

## 6) Terraform na AWS: por que é essencial

Remediar manualmente funciona uma vez. Terraform garante:

- repetibilidade;
- versionamento de mudanças;
- revisão por pull request;
- redução de drift (desvio da configuração desejada).

Veja `terraform/aws/modules/README.md` para o plano de módulos de baseline.

---

## 7) CI/CD para gerar confiança

O workflow em `.github/workflows/security-checks.yml` mostra um pipeline inicial para:

- executar checks;
- guardar artefatos de evidência;
- criar disciplina de execução contínua.

No começo, ele pode rodar em modo de demonstração; depois você conecta credenciais seguras e escopo real.

---

## 8) Roadmap sugerido

- **Fase 1:** estrutura, metodologia e 10 checks de alto impacto.
- **Fase 2:** módulos Terraform AWS para remediação baseline.
- **Fase 3:** expandir controles GCP e matriz CIS.
- **Fase 4:** score por conta/projeto e dashboard de evolução.

---

## 9) Importante: não é consultoria legal

Este repositório é educacional/técnico e não substitui avaliação especializada para ambientes regulados.

