# UI Layout Factory — guia complementar

O `/uiux-layout` adiciona uma etapa independente ao `/uiux`. Use `/uiux` para gerar identidade, tokens e styleguide; depois use `/uiux-layout` para gerar arquitetura de telas, protótipos navegáveis, QA visual e handoff. A Software Factory implementa o produto depois.

## Uso

```text
/uiux-layout
Analise o produto e o Design System existentes. Projete as telas de dashboard,
clientes, agenda e financeiro. Priorize fluxos reais, tabelas e calendários
adequados ao domínio, estados completos e experiência responsiva. Não altere
código de produção nem instale dependências. Entregue protótipos navegáveis.
```

O comando exige Design System válido. Se ele não existir, rode `/uiux` primeiro.

## Agentes

| Agente | Responsabilidade | Saída principal |
|---|---|---|
| 07 Screen Architect | Inventário e arquitetura da informação | `docs/04-screen-architecture.md` |
| 08 Layout Architect | Composição, responsividade, motion e decisões | `docs/05-layout-specification.md`, `docs/06-component-decisions.md` |
| 09 Interface Builder | Protótipos isolados e interativos | `preview/` |
| 10 Layout Visual QA | Inspeção, correção e handoff | `qa/layout-audit.md`, `cursor-rule/ui-layout.mdc` |

## Bibliotecas

Taste Skill informa método de pesquisa e crítica visual; React Bits fornece componentes React selecionáveis; Transitions.dev fornece padrões de motion. shadcn/ui, Radix, Motion e Tailwind são opções complementares. A factory não instala nada automaticamente e não exige que todos os projetos usem React.

Leia `references/library-catalog.md` para requisitos e política atual de seleção. Verifique sempre licença/termos, versão, compatibilidade e dependências do componente específico. Recursos pagos não são presumidos como disponíveis.

## Saídas

Por padrão, `design-system/layouts/` recebe documentos, protótipos separados do frontend de produção, relatório de QA e uma regra `ui-layout.mdc`. O protótipo utiliza dados fictícios e não persiste alterações.

## Instalação e atualização

Os instaladores globais percorrem automaticamente os novos arquivos `.md` de agentes e commands. A pasta `references/` também precisa ser ligada em `~/.cursor/ui-ux-factory/references/`; a versão atualizada do `install.sh`/`install.ps1` faz isso.
