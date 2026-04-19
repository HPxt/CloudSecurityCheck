# Matriz CIS (rastreamento)

Use esta matriz para saber o que já está coberto e o que falta.

| CIS ID | Cloud | Domínio | Script | Terraform | Severidade | Status |
|---|---|---|---|---|---|---|
| CIS-AWS-1.5 | AWS | IAM | `checks/aws/iam/check_account_password_policy.sh` | `terraform/aws/modules/aws-iam-password-policy` | high | draft |
| CIS-AWS-3.1 | AWS | Logging | `checks/aws/logging/check_cloudtrail_enabled.sh` | `terraform/aws/modules/aws-cloudtrail-baseline` | critical | draft |
| CIS-AWS-5.1 | AWS | Networking | `checks/aws/networking/check_security_groups_open_ports.sh` | `terraform/aws/modules/aws-networking-baseline` | high | draft |
| CIS-GCP-2.1 | GCP | Logging | `checks/gcp/logging/check_audit_logging_enabled.sh` | n/a | critical | draft |
| CIS-GCP-1.1 | GCP | IAM | `checks/gcp/iam/check_overprivileged_roles.sh` | n/a | high | draft |
| CIS-GCP-3.1 | GCP | Networking | `checks/gcp/networking/check_firewall_allow_all.sh` | n/a | high | draft |

## Legenda de status

- `draft`: ideia inicial, precisa revisão.
- `validated`: check já testado em ambiente real.
- `automated`: check e evidência automatizados.
- `remediated`: remediação IaC disponível e validada.

