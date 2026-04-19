# GCP - Guia Avançado

Este guia é para operações em escala, com foco em governança, observabilidade e resposta.

## 1) Governança por organização

### Meta
Padronizar controles no nível organizacional para minimizar variação entre projetos.

### Dicas avançadas
1. Use políticas organizacionais para restringir configurações de alto risco.
2. Defina estrutura de pastas/projetos por domínio de negócio e criticidade.
3. Centralize logs e monitoramento com controles de acesso fortes.

### Por que isso importa
Reduz risco estrutural e acelera auditorias.

---

## 2) IAM avançado e contas de serviço

### Meta
Controlar identidades não humanas com o mesmo rigor de usuários privilegiados.

### Dicas avançadas
1. Minimize criação de chaves estáticas.
2. Segmente contas de serviço por workload e ambiente.
3. Automatize rotação e revisão de bindings críticos.

### Por que isso importa
Grande parte do risco avançado está em service accounts superpoderosas.

---

## 3) Segurança de rede e dados sensíveis

### Meta
Isolar tráfego e proteger dados críticos fim a fim.

### Dicas avançadas
1. Restrinja ao máximo acesso administrativo público.
2. Aplique criptografia com gestão de chaves apropriada ao risco.
3. Monitore exfiltração potencial com regras e alertas dedicados.

### Por que isso importa
Quanto maior o ambiente, maior a necessidade de controles sistêmicos.

