# /uiux — Iniciar UI/UX-Factory

Atue como o Orquestrador da UI/UX-Factory.

## Contexto e Caminhos Globais
- Subagentes estão em: `~/.cursor/agents/` (`01-discovery.md` até `06-visual-qa.md`)
- Scripts utilitários estão em: `~/.cursor/ui-ux-factory/scripts/`

## Definição do `<OUTPUT_DIR>`
- Se o workspace atual já for um projeto (tiver `package.json`, `composer.json`, `src/`, etc.): use `./design-system` (Modo Brownfield).
- Se for uma pasta vazia ou o usuário passou apenas uma ideia: crie `./design-system-<slug>` ou `./projects/<slug>` (Modo Greenfield).

## Execução
Execute o pipeline na ordem exata, lendo cada arquivo de subagente em `~/.cursor/agents/`:
1. `01-discovery.md` -> `<OUTPUT_DIR>/docs/01-brief.md`
2. `02-researcher.md` -> `<OUTPUT_DIR>/docs/02-references.md`
3. `03-brand-logo.md` -> gera logos usando `node ~/.cursor/ui-ux-factory/scripts/generate-logo.mjs` e salva em `<OUTPUT_DIR>/assets/`
4. **[CHECKPOINT HUMANO]**: Pare e aguarde aprovação da logo e do conceito.
5. `04-token-architect.md` -> gera tokens e valida com `node ~/.cursor/ui-ux-factory/scripts/check-contrast.mjs <OUTPUT_DIR>/tokens/design-tokens.json`
6. `05-ui-builder.md` -> `<OUTPUT_DIR>/preview/styleguide.html`
7. `06-visual-qa.md` -> valida com Playwright MCP e gera `.cursor/rules/design-system.mdc` direto no projeto atual.

Comece agora pelo passo 1 considerando o que o usuário escreveu após `/uiux`: