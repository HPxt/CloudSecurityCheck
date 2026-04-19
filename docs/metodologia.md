# Metodologia de Curadoria (didática)

Este documento ensina **como escrever um controle** de forma consistente.

## Template padrão de controle CIS

```md
# [CIS-ID] Título do controle

## Objetivo (por que existe)
Explique em linguagem simples a ameaça que o controle reduz.

## Risco se não aplicar
Descreva um cenário realista de incidente.

## Como validar manualmente
Passos curtos para um humano verificar no console.

## Como validar automaticamente
Comando/script e o que ele deve retornar.

## Remediação
Ações para corrigir.

## Terraform AWS (quando aplicável)
Qual módulo/arquivo IaC implementa a correção.

## Evidência esperada
Exemplo de saída JSON/Markdown para auditoria.

## Exceções aceitas
Quando e como documentar um risco aceito.
```

## Regras de qualidade

1. **Explique o “porquê” antes do “como”**: novatos entendem melhor e aderem mais.
2. **Use linguagem clara**: evitar jargão sem explicação.
3. **Padronize severidade**: `critical`, `high`, `medium`, `low`.
4. **Mapeie para evidência**: toda validação precisa deixar rastro.
5. **Se tiver remediação AWS, prefira Terraform** ao passo manual.

## Fluxo recomendado por controle

1. Defina o controle CIS.
2. Escreva descrição e risco.
3. Crie check automatizado simples.
4. Produza evidência de exemplo (`output/examples`).
5. Vincule remediação em Terraform (AWS).
6. Adicione linha na matriz `docs/matriz-cis.md`.

