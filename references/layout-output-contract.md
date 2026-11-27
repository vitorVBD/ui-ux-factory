# Layout Output Contract

Contrato dos artefatos criados pelo `/uiux-layout`. Use nomes estáveis e mantenha a especificação sincronizada com o protótipo.

## Diretório

`<DESIGN_SYSTEM_DIR>/layouts/`

```text
layouts/
├── docs/
│   ├── 04-screen-architecture.md
│   ├── 05-layout-specification.md
│   └── 06-component-decisions.md
├── preview/
│   ├── index.html
│   ├── PROTOTYPE-NOTES.md
│   ├── styles/
│   ├── scripts/
│   ├── assets/
│   └── screens/
│       └── <screen-id>.html
├── qa/
│   ├── layout-audit.md
│   └── screenshots/
└── cursor-rule/
    └── ui-layout.mdc
```

Diretórios vazios podem ser omitidos. Não crie arquivos vazios para preencher a árvore.

## Convenções

- IDs de tela em `kebab-case`, estáveis e sem duplicatas.
- Cada tela listada como MVP/CORE em `04-screen-architecture.md` precisa de protótipo ou justificativa explícita para não ser prototipada.
- `preview/index.html` é a entrada única. Oferece links funcionais para cada tela e indica claramente que dados/ações são demonstrativos.
- Use arquivos compartilhados para navegação, tokens e componentes quando isso reduzir inconsistência; não crie um design system paralelo.
- Quando os tokens originais não puderem ser importados diretamente no preview, crie uma bridge CSS que mapeie nomes para as variáveis existentes e documente o mapeamento. Não redefina valores.
- Evite links absolutos à máquina local, assets externos frágeis, placeholders vazios e APIs reais.
- A interface deve continuar navegável sem autenticação, backend ou segredos.

## Dados e ações

- Dados de demonstração são sintéticos e identificados nas notas.
- Ações locais devem produzir feedback de demonstração e nunca sugerir persistência real.
- Não chame endpoints do produto nem reutilize dados pessoais armazenados no repositório.

## Rastreabilidade

Cada tela do protótipo deve conter o ID da arquitetura nos comentários/documentação e corresponder à especificação. A especificação descreve elementos que o protótipo realmente apresenta. Decisões que mudarem durante a construção voltam ao documento e ficam registradas.

## Handoff

`cursor-rule/ui-layout.mdc` é um contrato de implementação, não código executável. Deve citar caminhos relativos reais e explicar como os agentes de desenvolvimento devem consultar arquitetura, especificação, decisões de componentes e tokens.
