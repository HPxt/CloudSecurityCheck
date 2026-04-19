#!/usr/bin/env bash
set -euo pipefail

PROJECT_ID=""
if [[ "${1:-}" == "--project" && -n "${2:-}" ]]; then
  PROJECT_ID="$2"
fi

if [[ -z "$PROJECT_ID" ]]; then
  echo '{"id":"CIS-GCP-3.1","cloud":"gcp","severity":"high","status":"ERROR","evidence":"project não informado","recommendation":"use --project <id>"}'
  exit 1
fi

if ! command -v gcloud >/dev/null 2>&1; then
  echo '{"id":"CIS-GCP-3.1","cloud":"gcp","severity":"high","status":"ERROR","evidence":"gcloud cli não encontrado","recommendation":"instale e configure o gcloud"}'
  exit 1
fi

RULES=$(gcloud compute firewall-rules list --project "$PROJECT_ID" --format=json 2>/dev/null || echo '[]')

if echo "$RULES" | rg -q '0.0.0.0/0'; then
  echo '{"id":"CIS-GCP-3.1","cloud":"gcp","severity":"high","status":"WARN","evidence":"regras com 0.0.0.0/0 detectadas","recommendation":"restringir origem e portas"}'
else
  echo '{"id":"CIS-GCP-3.1","cloud":"gcp","severity":"high","status":"PASS","evidence":"nenhuma regra allow-all encontrada na verificação básica","recommendation":"manter monitoramento"}'
fi
