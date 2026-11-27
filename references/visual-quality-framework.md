# Visual Quality & Complexity Framework

Este documento orienta o `/uiux-layout` e os agentes 07–10. É um contrato de qualidade, não um tema visual a ser imposto a todos os produtos.

## 1. Qualidade não é quantidade de efeitos

Uma interface pode ser visualmente sofisticada por meio de hierarquia, composição, ritmo, tipografia, proporção, densidade adequada, conteúdo autêntico e consistência. Não use animação, glassmorphism, gradientes, blur, parallax, 3D ou cards apenas para tornar uma tela “mais bonita”. Cada recurso precisa resolver um problema identificável.

## 2. Princípios de composição

- **Purpose first:** a tarefa principal e a informação mais importante devem ser reconhecíveis sem procurar.
- **Content before chrome:** navegação e decoração não podem competir com o trabalho principal.
- **Domain specificity:** reflita objetos, fluxos e vocabulário reais do produto; evite dashboard genérico.
- **Progressive disclosure:** mostre primeiro o necessário e revele controles avançados no contexto apropriado.
- **Consistent, not monotonous:** reutilize padrões, mas varie a composição conforme a tarefa.
- **Data density with rhythm:** densidade é uma escolha de produto; use agrupamento, alinhamento e hierarquia para tornar dados escaneáveis.
- **Responsive by intent:** redesenhe prioridades e interações para cada breakpoint.
- **Accessible by default:** semântica, teclado, foco, contraste e movimento reduzido fazem parte do design.

## 3. Teste de justificação de complexidade

Antes de adicionar um elemento visual complexo, responda:
1. Que tarefa, compreensão ou feedback ele melhora?
2. O mesmo resultado seria obtido com uma solução local mais simples?
3. Qual é o custo de performance, acessibilidade, manutenção e aprendizagem?
4. Ele continua útil em mobile, teclado e reduced motion?
5. Está coerente com a identidade existente?

Se não houver benefício verificável, não o implemente. Não existe quota mínima de cards, animações, gradientes ou componentes especiais.

## 4. Motion principles

- Use motion para feedback, continuidade espacial, mudança de estado e hierarquia.
- Prefira transições curtas e previsíveis; não atrase ações do usuário.
- Evite animar propriedades que causam layout thrashing quando transform/opacity resolverem.
- Evite autoplay e movimento contínuo em informação operacional.
- Respeite `prefers-reduced-motion`; forneça alternativa sem movimento e não use movimento como único canal de informação.
- Não adicione animação a toda entrada, card, número ou scroll.

## 5. Escala de complexidade

Escolha o menor nível que resolva a tarefa:

| Nível | Uso | Exemplo |
|---|---|---|
| 0 — Base | Conteúdo linear e leitura | Formulário simples, página de preferências |
| 1 — Composto | Agrupamento e hierarquia | Página de detalhes com resumo e abas |
| 2 — Workspace | Múltiplas áreas contextuais | Lista + painel de detalhes, calendário com agenda |
| 3 — Especializado | Interação ou visualização de domínio | Editor, canvas, planejamento avançado, visualização clínica |

Nível alto exige justificativa de domínio, não preferência estética.

## 6. Critérios de avaliação

Avalie cada dimensão de 1 a 5, com evidência e problemas concretos:

- Clareza da tarefa e hierarquia.
- Especificidade do produto e coerência com a marca.
- Consistência de componentes e tokens.
- Densidade e escaneabilidade.
- Responsividade e adaptação de interação.
- Acessibilidade e teclado.
- Utilidade do motion.
- Performance e simplicidade de manutenção.

A pontuação é diagnóstico, não substitui critérios bloqueadores. Não declare aprovação com overflow que impede tarefa principal, foco invisível, contraste reprovado, ação sem feedback ou tela core ausente.
