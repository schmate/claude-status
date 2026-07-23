# Claude Status

Extensão GNOME Shell que mostra o uso do [Claude Code](https://claude.com/claude-code) (`/usage`) na barra superior: porcentagem da sessão atual (5h) e da semana, com contagem regressiva até o reset.

![Painel](screenshots/panel.png)

Clique no painel abre o detalhamento:

![Dropdown](screenshots/dropdown.png)

## Requisitos

- GNOME Shell 45 a 50
- [Claude Code](https://claude.com/claude-code) instalado e autenticado, com o binário `claude` disponível no `PATH` do shell de login (`bash -lc`)

## Como funciona

A cada 5 minutos a extensão roda `claude -p "/usage"` em background, faz parse da saída (porcentagem e horário de reset da sessão e da semana) e atualiza o painel. Nenhum dado é enviado a terceiros; tudo roda localmente via o próprio CLI do Claude Code.

## Instalação

```bash
git clone https://github.com/montanhes/claude-status.git ~/.local/share/gnome-shell/extensions/claude-status@oakz.org
gnome-extensions enable claude-status@oakz.org
```

No Wayland, extensões novas só são detectadas após logout/login (o GNOME Shell não recarrega em quente). Depois de logar de novo, rode o `gnome-extensions enable` acima.

## Estrutura

- `metadata.json` — metadados da extensão (uuid, versão, compatibilidade)
- `extension.js` — lógica: painel, parse do `/usage`, dropdown
- `stylesheet.css` — estilo dos cards do dropdown
- `icons/` — ícone do painel

## Licença

MIT
