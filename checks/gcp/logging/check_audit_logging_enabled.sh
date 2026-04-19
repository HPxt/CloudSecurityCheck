#!/usr/bin/env bash
set -euo pipefail

PROJECT_ID=""
if [[ "${1:-}" == "--project" && -n "${2:-}" ]]; then
  PROJECT_ID="$2"
fi

if [[ -z "$PROJECT_ID" ]]; then
  echo '{"id":"CIS-GCP-2.1","cloud":"gcp","severity":"critical","status":"ERROR","evidence":"project não informado","recommendation":"use --project <id>"}'
  exit 1
fi

if ! command -v gcloud >/dev/null 2>&1; then
  echo '{"id":"CIS-GCP-2.1","cloud":"gcp","severity":"critical","status":"ERROR","evidence":"gcloud cli não encontrado","recommendation":"instale e configure o gcloud"}'
  exit 1
fi

if gcloud logging sinks list --project "$PROJECT_ID" >/dev/null 2>&1; then
  echo '{"id":"CIS-GCP-2.1","cloud":"gcp","severity":"critical","status":"PASS","evidence":"consulta de logging executada","recommendation":"validar escopo e retenção"}'
else
  echo '{"id":"CIS-GCP-2.1","cloud":"gcp","severity":"critical","status":"WARN","evidence":"não foi possível validar sinks","recommendation":"revisar permissões/projeto e configurar auditoria"}'
fi
