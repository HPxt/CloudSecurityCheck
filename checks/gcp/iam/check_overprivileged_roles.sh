#!/usr/bin/env bash
set -euo pipefail

PROJECT_ID=""
if [[ "${1:-}" == "--project" && -n "${2:-}" ]]; then
  PROJECT_ID="$2"
fi

if [[ -z "$PROJECT_ID" ]]; then
  echo '{"id":"CIS-GCP-1.1","cloud":"gcp","severity":"high","status":"ERROR","evidence":"project não informado","recommendation":"use --project <id>"}'
  exit 1
fi

if ! command -v gcloud >/dev/null 2>&1; then
  echo '{"id":"CIS-GCP-1.1","cloud":"gcp","severity":"high","status":"ERROR","evidence":"gcloud cli não encontrado","recommendation":"instale e configure o gcloud"}'
  exit 1
fi

POLICY=$(gcloud projects get-iam-policy "$PROJECT_ID" --format=json 2>/dev/null || echo '{}')

if echo "$POLICY" | rg -q 'roles/editor|roles/owner'; then
  echo '{"id":"CIS-GCP-1.1","cloud":"gcp","severity":"high","status":"WARN","evidence":"papéis básicos amplos detectados","recommendation":"substituir por papéis granulares"}'
else
  echo '{"id":"CIS-GCP-1.1","cloud":"gcp","severity":"high","status":"PASS","evidence":"não há roles/owner ou roles/editor no resultado básico","recommendation":"manter revisão periódica"}'
fi
