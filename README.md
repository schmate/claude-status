# Claude Status

GNOME Shell extension showing [Claude Code](https://claude.com/claude-code) usage (`/usage`) in the top bar: current session (5h) and weekly percentage, with countdown to reset.

![Panel](screenshots/panel.png)

Clicking the panel opens a detailed dropdown, including live [Claude status](https://status.claude.com) (operational / degraded / outage):

![Dropdown](screenshots/dropdown.png)

## Requirements

- GNOME Shell 45 to 50
- [Claude Code](https://claude.com/claude-code) installed and authenticated, with the `claude` binary available in the login shell `PATH` (`bash -lc`)
- `curl` available in `PATH` (used to fetch the Claude status page)

## How it works

Every 5 minutes the extension runs `claude -p "/usage"` in the background, parses the output (session and weekly percentage plus reset time), and updates the panel. It also polls `status.claude.com` on the same interval and shows a color-coded indicator (green/yellow/orange/red) in the dropdown, linking out to the status page on click.

If a `/usage` call fails or times out (25s watchdog), it retries with exponential backoff (15s, 30s, 45s... capped at 120s, up to 5 attempts) instead of leaving stale data on screen. No data is sent to third parties; everything runs locally through the Claude Code CLI itself, aside from the status page check.

## Installation

```bash
git clone https://github.com/montanhes/claude-status.git ~/.local/share/gnome-shell/extensions/claude-status@oakz.org
gnome-extensions enable claude-status@oakz.org
```

On Wayland, new extensions are only picked up after logout/login (GNOME Shell doesn't hot-reload). After logging back in, run the `gnome-extensions enable` command above.

## Localization

UI strings are translated via gettext. Currently available: English (default), Portuguese (pt_BR), Spanish, French, and German. Translations follow the system locale automatically.

## Structure

- `metadata.json` — extension metadata (uuid, version, shell compatibility)
- `extension.js` — core logic: panel, `/usage` parsing, dropdown, status.claude.com polling, retry/backoff handling
- `stylesheet.css` — styling for the dropdown cards and status indicator
- `icons/` — panel icon
- `po/` — translation files (`.po`) and template (`.pot`)

## License

MIT
