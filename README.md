# ZeroQuarry Skills

The agent skills we use day to day at ZeroQuarry, published in the hope they're useful to anyone else driving coding agents for a living. Each directory is one self-contained skill — a folder with a `SKILL.md` in the open agent-skills format. No dependencies, no build step, MIT licensed.

## Install

With the [skills CLI](https://github.com/vercel-labs/skills), which installs into Claude Code, Codex, Cursor, and other agents that read the format:

```sh
npx skills add ZeroQuarry/SkillZ          # everything
npx skills add ZeroQuarry/SkillZ --list   # browse first
```

Or the manual way — copy the directories you want into your agent's skills folder (`~/.agents/skills/` on most setups):

```sh
git clone https://github.com/ZeroQuarry/SkillZ
cp -r skills/code-review ~/.agents/skills/
```

## The skills

| Skill | What it does |
| --- | --- |
| [`code-review`](code-review/) | Reviews code changes for concrete defects. Strict calibration: every finding names its trigger and impact, pre-existing issues aren't reported as regressions, taste isn't reported at all. |
| [`frontend-design`](frontend-design/) | Builds UI with a distinctive, intentional visual identity: design plan → genericity self-check → build, grounded in the brief's real subject matter. |
| [`frontend-design-review`](frontend-design-review/) | The read-only counterpart: reviews a UI, page, or design diff for templated defaults, weak typography, decorative noise, copy that fights the user, and quality-floor failures. |
| [`docs-review`](docs-review/) | The same review motion for technical writing: claims verified against the code, steps a reader can actually follow, consistent terminology, no adjectives standing in for facts. |
| [`animate`](animate/) | Builds UI motion by deciding in order: should it animate at all, what purpose, cheapest tool, properties, curve and duration, interruption, exit. After Emil Kowalski's animation philosophy. |
| [`ponytail`](ponytail/) | The lazy senior developer: simplest solution that actually works. YAGNI, stdlib before custom code, native before dependencies. Intensity levels: lite / full / ultra. |
| [`ponytail-review`](ponytail-review/) | Diff review for over-engineering only. One line per finding: what to cut, what replaces it. Ends with `net: -N lines possible.` |
| [`ponytail-audit`](ponytail-audit/) | `ponytail-review` for a whole repository: a ranked list of everything to delete, shrink, or replace with stdlib. |

## Using this repo across machines

The repo is the source of truth for the skills it contains. Clone it anywhere and run:

```sh
./install.sh
```

That symlinks each skill into `~/.agents/skills`, alongside your local-only skills. Edits happen in one place (the symlink means both paths are the same directory), and syncing is just `git pull` / `git push`. Local skills are never touched.

## License

[MIT](LICENSE)
