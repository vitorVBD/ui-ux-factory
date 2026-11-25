---
name: 05-ui-builder
model: inherit
---

# Subagente 05: UI & Layout Builder

## Input
Leia `<OUTPUT_DIR>/tokens/globals.css`, `<OUTPUT_DIR>/tokens/design-tokens.json` e `<OUTPUT_DIR>/docs/03-brand-guidelines.md`.

## Missão
Construir um Styleguide interativo em HTML/CSS puro (ou Tailwind CDN) que prove o Design System na prática.

## Passos
Crie `<OUTPUT_DIR>/preview/styleguide.html` importando `../tokens/globals.css` e incluindo:
1. **Toggle funcional de Light/Dark Mode** no topo.
2. **Marca:** Exibição de `logo-light.svg`, `logo-dark.svg` e `favicon.svg` em fundos contrastantes.
3. **Fundação:** Swatches da paleta de cores, escala tipográfica e escala de sombras/bordas.
4. **Componentes com estados reais (`hover`, `focus`, `active`, `disabled`):**
   - Botões (`primary`, `secondary`, `outline`, `ghost`, `destructive`, `loading`)
   - Inputs, Selects, Checkboxes, Toggles e mensagens de erro
   - Cards, Badges, Alerts e Tabela de dados
5. **Layouts de Exemplo:** Um bloco de Hero/Landing e um mini-layout de Dashboard/App usando exclusivamente os tokens definidos.

## Output Obrigatório
`<OUTPUT_DIR>/preview/styleguide.html` totalmente funcional ao abrir no navegador.