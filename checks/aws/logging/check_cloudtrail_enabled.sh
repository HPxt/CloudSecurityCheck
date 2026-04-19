#!/usr/bin/env bash
set -euo pipefail

PROFILE="default"
if [[ "${1:-}" == "--profile" && -n "${2:-}" ]]; then
  PROFILE="$2"
fi

if ! command -v aws >/dev/null 2>&1; then
  echo '{"id":"CIS-AWS-3.1","cloud":"aws","severity":"critical","status":"ERROR","evidence":"aws cli não encontrado","recommendation":"instale e configure a AWS CLI"}'
  exit 1
fi

COUNT=$(aws cloudtrail describe-trails --profile "$PROFILE" --query 'trailList | length(@)' --output text 2>/dev/null || echo "0")

if [[ "$COUNT" -ge 1 ]]; then
  echo '{"id":"CIS-AWS-3.1","cloud":"aws","severity":"critical","status":"PASS","evidence":"CloudTrail encontrado","recommendation":"manter e monitorar"}'
else
  echo '{"id":"CIS-AWS-3.1","cloud":"aws","severity":"critical","status":"FAIL","evidence":"nenhum CloudTrail encontrado","recommendation":"habilitar CloudTrail multi-region"}'
fi
