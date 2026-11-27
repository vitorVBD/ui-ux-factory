# UI Library Catalog & Selection Policy

Catálogo de referência para o `/uiux-layout`. Verifique a documentação oficial atual antes de qualquer uso; versões, preços, licenças e APIs podem mudar. Este arquivo não autoriza instalação automática.

## Método de seleção

1. Inspecione stack, package manager, dependências, componentes locais, tokens, licença do projeto e política de bundle.
2. Priorize componentes já presentes no produto.
3. Escolha uma biblioteca somente se preencher uma lacuna concreta.
4. Confirme compatibilidade de framework, versão, CSS strategy, SSR, acessibilidade, licença/termos e dependências transitivas.
5. Registre a fonte, data de consulta e decisão em `docs/06-component-decisions.md`.
6. Não instale, altere manifests ou lockfiles sem pedido/aprovação explícita. Se não puder instalar, use uma implementação simples no preview e marque a biblioteca como candidata.

## Bibliotecas principais

### Taste Skill — direção e auditoria de design

- Site/docs: https://www.tasteskill.dev/ e https://www.tasteskill.dev/docs
- Skill: `npx skills add Leonxlnx/taste-skill`
- Instala a skill `design-taste-frontend`, não uma dependência de runtime do produto.
- Bom para inventário do conteúdo específico, investigação de direções, composição de páginas, inspeção em browser e ciclos de correção.
- Requisitos documentados: Node 22+ e Chrome/Edge/Chromium para o inspector completo; partes dos scripts funcionam com Node 18. Sem ambiente, reduza a validação e reporte a limitação.
- Política: adote o método de pesquisa, composição e crítica, mas não imponha quotas de fotos ou movimento (ex.: 4 imagens/8 elementos móveis) a dashboards, formulários ou ferramentas internas. Preserve marca e tokens aprovados.

### React Bits — componentes React visuais e animados

- Site: https://reactbits.dev/ e documentação/get-started publicada no próprio site.
- Catálogo comunitário e snippets para projetos React; verifique componente, variante JS/TS, abordagem CSS/Tailwind, licença e dependências individualmente.
- Alguns efeitos podem envolver bibliotecas adicionais, canvas/WebGL ou custo significativo. Não usar só porque parecem chamativos.
- Há ofertas/recursos Pro em domínios separados que podem exigir licença/chave. Nunca assuma acesso Pro; não copie assets ou blocos pagos sem licença.
- Use somente quando stack React for confirmada e o ganho justificar a dependência.

### Transitions.dev — motion snippets e skill

- Site: https://transitions.dev/
- Skill gratuita: `npx skills add Jakubantalik/transitions.dev`
- CLI gratuita documentada: `npx transitions-dev add --free`; catálogo local com `npx transitions-dev list`.
- Oferece snippets CSS e React; inspecione o código e dependências antes de adaptar.
- Use para interações pontuais e consistentes (menus, tabs, dialogs, toast, elementos compartilhados), não para adicionar movimento indiscriminado.

## Complementos recomendados

### shadcn/ui

- Docs/CLI: https://ui.shadcn.com/docs e https://ui.shadcn.com/docs/cli
- Componentes copiados/adicionados ao projeto, não runtime obrigatório de uma biblioteca central.
- Use quando o projeto já adota o ecossistema e o usuário quiser componentes editáveis. `init` pode modificar dependências e configuração; não rode no fluxo de prototipagem. O comando `add` tem suporte a `--dry-run` para revisão antes de escrita.
- Verifique a base (`radix`/`base`/`aria`, conforme versão atual), tokens e estilos existentes.

### Radix UI

- Docs: https://www.radix-ui.com/primitives/docs/overview/introduction
- Primitivas React para componentes como dialogs, menus e selects. Use quando precisar de interações acessíveis e quando compatível com a stack.
- Não adicione Radix separadamente quando componentes existentes já resolvem a necessidade.

### Motion for React

- Docs: https://motion.dev/docs/react
- Import React: `motion/react`.
- `useReducedMotion` documentado: https://motion.dev/docs/react-use-reduced-motion
- Use para transições de layout/estado quando já instalado ou aprovado. Avalie tamanho, SSR e preferência de movimento reduzido.

### Tailwind CSS

- Docs: https://tailwindcss.com/docs
- Não introduza Tailwind em projetos que usam CSS Modules, styled-components, Bootstrap ou outro padrão já consolidado.

## Alternativas por ecossistema

- Vue: componentes e transições nativos do Vue/ecossistema existente.
- Svelte: transições nativas do Svelte e biblioteca local existente.
- HTML/CSS/JS: CSS transitions/animations e Web Animations API quando suficientes.
- Gráficos: mantenha a lib já usada; escolha uma lib de charts somente quando o domínio exigir visualização de dados.

## Checklist de decisão

- [ ] Stack e versão confirmadas.
- [ ] O componente resolve necessidade real.
- [ ] Não existe solução local adequada.
- [ ] Licença e termos verificados.
- [ ] Dependências transitivas e tamanho aceitáveis.
- [ ] Acessibilidade, teclado e reduced-motion avaliados.
- [ ] Custo de manutenção descrito.
- [ ] Instalação separada da geração de protótipo e depende de aprovação.
