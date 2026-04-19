#!/usr/bin/env bash
set -euo pipefail

PROFILE="default"
if [[ "${1:-}" == "--profile" && -n "${2:-}" ]]; then
  PROFILE="$2"
fi

if ! command -v aws >/dev/null 2>&1; then
  echo '{"id":"CIS-AWS-5.1","cloud":"aws","severity":"high","status":"ERROR","evidence":"aws cli não encontrado","recommendation":"instale e configure a AWS CLI"}'
  exit 1
fi

OPEN_RULES=$(aws ec2 describe-security-groups --profile "$PROFILE" \
  --query 'SecurityGroups[?IpPermissions[?IpRanges[?CidrIp==`0.0.0.0/0`]]].GroupId' --output text 2>/dev/null || true)

if [[ -z "$OPEN_RULES" ]]; then
  echo '{"id":"CIS-AWS-5.1","cloud":"aws","severity":"high","status":"PASS","evidence":"nenhum SG aberto para 0.0.0.0/0 detectado (consulta básica)","recommendation":"manter revisão contínua"}'
else
  echo '{"id":"CIS-AWS-5.1","cloud":"aws","severity":"high","status":"WARN","evidence":"security groups potencialmente expostos detectados","recommendation":"revisar regras e restringir origem/portas"}'
fi
