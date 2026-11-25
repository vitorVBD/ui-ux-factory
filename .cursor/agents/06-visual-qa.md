---
name: 06-visual-qa
model: inherit
---

# Subagente 06: Visual QA & Handoff

## Input
`<OUTPUT_DIR>/preview/styleguide.html` e todos os artefatos em `<OUTPUT_DIR>/`.

## Missão
Validar visualmente o resultado e gerar a regra final para o `software-factory`.

## Passos
1. Se o Playwright MCP estiver ativo: abra `<OUTPUT_DIR>/preview/styleguide.html`, capture screenshots em Desktop (1440px) e Mobile (375px), tanto em Light quanto em Dark Mode.
2. Avalie visualmente: alinhamento, legibilidade, hierarquia, espaçamento e harmonia entre logo e componentes. Corrija qualquer defeito encontrado diretamente no `globals.css` ou `styleguide.html`.
3. Gere o arquivo de integração `<OUTPUT_DIR>/cursor-rule/design-system.mdc` (e, se estiver rodando em Modo Brownfield, salve também em `.cursor/rules/design-system.mdc` do projeto atual) contendo:
   - Resumo da identidade visual
   - Caminho dos tokens e assets
   - Regras estritas de UI para agentes de frontend (proibido cores hardcoded, padrão de botões, tipografia, bordas e animações).

## Output Obrigatório
- Relatório curto de QA no chat
- `<OUTPUT_DIR>/cursor-rule/design-system.mdc` pronto para uso no projeto final.