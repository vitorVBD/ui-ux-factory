# /uiux-layout — Layouts completos a partir do Design System

Atue como Orquestrador da UI Layout Factory. Este comando complementa `/uiux`; não recria logo, identidade, tokens nem substitui o Styleguide existente.

## Objetivo

Transformar a identidade visual aprovada e o contexto real do produto em arquitetura de telas, especificações de layout, protótipos navegáveis de alta fidelidade, validação visual e handoff para a Software Factory.

Solicitação do usuário:

$ARGUMENTS

## 1. Resolver contexto e caminhos

Antes de delegar:

1. Identifique o workspace. Inspecione `AGENTS.md`, `README.md`, `package.json`, `composer.json`, lockfiles, rotas, páginas, componentes, CSS, configuração de build, testes e documentação. Não presuma React nem Tailwind.
2. Resolva `<DESIGN_SYSTEM_DIR>`:
   - Use o caminho explicitamente informado pelo usuário, se houver.
   - Caso contrário, use `./design-system` quando existir.
   - Se o projeto documentar o Design System em outro caminho, use-o somente quando a localização for inequívoca.
3. Resolva `<OUTPUT_DIR>` como `<DESIGN_SYSTEM_DIR>/layouts`. Preserve os arquivos existentes. Antes de atualizar um artefato existente, compare-o e registre as alterações relevantes; não sobrescreva decisões aprovadas sem informar.
4. Leia, quando existirem:
   - `<DESIGN_SYSTEM_DIR>/docs/01-brief.md`
   - `<DESIGN_SYSTEM_DIR>/docs/02-references.md`
   - `<DESIGN_SYSTEM_DIR>/docs/03-brand-guidelines.md`
   - `<DESIGN_SYSTEM_DIR>/tokens/design-tokens.json`
   - `<DESIGN_SYSTEM_DIR>/tokens/globals.css`
   - `<DESIGN_SYSTEM_DIR>/cursor-rule/design-system.mdc`
   - `.cursor/rules/design-system.mdc`
   - `docs/ai/design-system.md`, `docs/ai/project-profile.md` e `docs/ai/architecture.md`, se disponíveis.
5. Leia os contratos compartilhados instalados em `~/.cursor/ui-ux-factory/references/`:
   - `visual-quality-framework.md`
   - `library-catalog.md`
   - `layout-output-contract.md`
6. Se os contratos compartilhados não estiverem instalados, informe a ausência e use as regras deste comando e dos agentes como fallback. Nunca alegue ter lido um arquivo inexistente.
7. Verifique se as Skills `design-taste-frontend` (Taste Skill) e `transitions` (Transitions.dev) já estão disponíveis na sessão. Se estiverem, leia/invoque suas instruções pertinentes, preservando este comando, a marca aprovada e os requisitos do produto como limites. Se não estiverem, use o catálogo e as regras locais; não instale Skills nem execute CLIs sem autorização explícita.

### Pré-condições visuais

- Tokens, guidelines ou um Design System real do produto precisam existir. Se não houver identidade utilizável, não invente paleta, tipografia ou personalidade: pare e recomende executar `/uiux` primeiro.
- Se houver UI existente, ela é evidência. Registre o que foi confirmado no código, documentado, inferido ou desconhecido; destaque divergências sem “corrigi-las” por conta própria.
- A arquitetura funcional existente e os requisitos explícitos são a fonte de verdade. Não invente módulos, permissões, regras, métricas, entidades ou ações.
- Se o projeto não for React, não force React Bits, shadcn/ui ou Motion. Preserve a stack identificada.
- Não instale dependências, não altere `package.json`, lockfiles, rotas, código de produção, migrations, infraestrutura ou dados.

## 2. Pipeline obrigatório

Execute os agentes na ordem e use os artefatos em disco como memória compartilhada:

1. `07-screen-architect.md`
   - Input: repositório, briefing, Design System e pedido do usuário.
   - Output: `<OUTPUT_DIR>/docs/04-screen-architecture.md`.
2. `08-layout-architect.md`
   - Input: arquitetura de telas, referências e tokens.
   - Outputs: `<OUTPUT_DIR>/docs/05-layout-specification.md` e `<OUTPUT_DIR>/docs/06-component-decisions.md`.
3. **Checkpoint de escopo:** apresente mapa de telas, fluxos e direção de composição. Se houver requisito contraditório, decisão de produto não confirmada ou grande ambiguidade, peça somente a decisão bloqueadora. Se o escopo estiver claro, continue sem checkpoint artificial.
4. `09-interface-builder.md`
   - Input: todos os artefatos anteriores e stack confirmada.
   - Output: protótipos isolados em `<OUTPUT_DIR>/preview/`.
5. `10-layout-visual-qa.md`
   - Input: especificações, protótipos, tokens e screenshots, quando disponíveis.
   - Outputs: `<OUTPUT_DIR>/qa/layout-audit.md` e `<OUTPUT_DIR>/cursor-rule/ui-layout.mdc`.
   - Em modo brownfield, também disponibilize a regra em `.cursor/rules/ui-layout.mdc`. Se já existir, compare, faça backup antes de substituir e preserve instruções locais não relacionadas.

Leia integralmente cada agente antes de delegar. Passe a cada um contexto relevante e caminhos exatos. Não declare execução de agente, teste, screenshot ou validação que não ocorreu.

## 3. Regras de construção

- O Design System aprovado é a fonte de verdade visual. Não redefina marca, cores, tipografia, raios ou escalas por conveniência.
- A arquitetura do domínio e o código existente são a fonte de verdade funcional.
- Cada tela precisa de propósito, usuário, tarefa principal, hierarquia, estados e comportamento responsivo documentados.
- Não use dashboard de cards como template automático para todas as páginas. Escolha padrões de composição segundo a tarefa: tabelas, calendários, timelines, workspaces, formulários, detalhes, kanban, analytics, editores ou combinações justificadas.
- Dê preferência aos componentes locais existentes. Reutilize primitivas acessíveis e componha componentes específicos do domínio.
- Taste Skill, React Bits e Transitions.dev devem ser considerados durante pesquisa e decisão de layout. Taste Skill orienta inventário, direção e crítica; React Bits oferece componentes React específicos; Transitions.dev oferece snippets de motion. Consulte `library-catalog.md`, inspecione componentes adequados ao contexto e registre a decisão (inclusive quando nenhuma opção for usada). São fontes de padrões, não obrigações de implementação. Valide compatibilidade, licença, dependências e custo antes de recomendar snippets.
- Não importe bibliotecas inteiras, não copie demos sem adaptação e não adicione dependências automaticamente.
- Animações precisam comunicar estado, feedback, continuidade ou hierarquia. Respeite `prefers-reduced-motion`; evite movimento ornamental em todos os elementos.
- Use dados sintéticos para demonstração e identifique-os como fictícios. Mantenha nomes, campos e relações coerentes com o domínio.
- Protótipos não são código de produção. Não faça commits, deploys nem alterações funcionais no produto.

## 4. Conclusão no chat

Apresente:
- Resumo das telas e fluxos produzidos.
- Caminhos dos protótipos e documentos.
- Decisões de componentes e bibliotecas, inclusive o que foi rejeitado e por quê.
- Viewports e interações realmente testados.
- Resultado QA: `PASS`, `FAIL`, `BLOCKED` ou `NOT RUN`.
- Limitações e pendências.
- Como a Software Factory deve consumir `ui-layout.mdc` e os documentos da pasta `layouts/`.

`BLOCKED` e `NOT RUN` nunca contam como aprovação.
