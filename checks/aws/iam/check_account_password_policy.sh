#!/usr/bin/env bash
set -euo pipefail

PROFILE="default"
if [[ "${1:-}" == "--profile" && -n "${2:-}" ]]; then
  PROFILE="$2"
fi

if ! command -v aws >/dev/null 2>&1; then
  echo '{"id":"CIS-AWS-1.5","cloud":"aws","severity":"high","status":"ERROR","evidence":"aws cli não encontrado","recommendation":"instale e configure a AWS CLI"}'
  exit 1
fi

if aws iam get-account-password-policy --profile "$PROFILE" >/dev/null 2>&1; then
  echo '{"id":"CIS-AWS-1.5","cloud":"aws","severity":"high","status":"PASS","evidence":"política de senha configurada","recommendation":"revisar complexidade periodicamente"}'
else
  echo '{"id":"CIS-AWS-1.5","cloud":"aws","severity":"high","status":"FAIL","evidence":"sem política de senha da conta","recommendation":"definir política de senha IAM"}'
fi
