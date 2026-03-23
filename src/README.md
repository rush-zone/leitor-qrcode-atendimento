# Sistema de Atendimento Hospitalar

Sistema completo de gestão de filas e atendimento hospitalar com leitura de código de barras via pistola scanner USB/HID.

## Funcionalidades

- **Recepção** — Cadastro de pacientes, geração de código de barras (CODE128) e impressão de pulseira
- **Sala de Espera (TV)** — Painel com fila em tempo real e chamada por áudio (pt-BR)
- **Consultório** — Timer de atendimento ativado por scanner, campo de observações do médico
- **Admin** — Métricas, cadastro de médicos/especialidades, senhas por perfil, exportação Excel e PDF

## Fluxo de atendimento

1. Recepcionista cadastra o paciente → imprime a pulseira com código de barras
2. Paciente aguarda na sala de espera (TV exibe a fila)
3. Médico escaneia o código de barras da pulseira com a pistola → timer inicia
4. Ao fim do atendimento, médico escaneia novamente → sistema encerra e chama próximo por áudio

## Como usar

Abra o arquivo `src/index.html` diretamente no navegador (Chrome ou Edge recomendado).

Não requer servidor — funciona 100% offline após o primeiro carregamento.

## Senhas padrão

| Perfil       | Senha |
|--------------|-------|
| Recepção     | 1234  |
| Médico       | 5678  |
| Admin        | 9999  |
| TV (painel)  | —     |

## Scanner

Compatível com qualquer pistola scanner USB/HID (CODE128, CODE39, EAN). Funciona como teclado — plug and play, sem driver.

## Tecnologias

- HTML5 / CSS3 / JavaScript puro (sem framework)
- [JsBarcode](https://github.com/lindell/JsBarcode) — geração de código de barras
- [SheetJS (XLSX)](https://sheetjs.com/) — exportação Excel
- Web Speech API — anúncio por áudio

## Estrutura

```
leitor-qrcode-atendimento/
├── src/
│   └── index.html       # Aplicação completa
├── assets/              # Recursos futuros (logo, sons)
├── README.md
├── .gitignore
└── CHANGELOG.md
```
