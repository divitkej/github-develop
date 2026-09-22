# Repo audit

State of every repo on the account, what was fixed, and what is left to
decide. Updated 22 September 2026.

## divitkej/github-develop (public)

This repo. Holds the plan, standards, templates, and this audit.

Done: a `main` branch now exists with all the content.

Left to do, by hand: Settings, Branches, switch the default branch to `main`,
then delete `claude/github-portfolio-setup-mir3g8`. Contributions only count
on the default branch, so this is not cosmetic.

## divitkej/whatsapp-adding-automation (private, going public)

The strongest work on the account. Reads a spreadsheet of phone numbers,
drives WhatsApp Web in a real browser, and adds each number to a chosen group.
Desktop UI, a phone control panel, a CSV report, and a test suite running on
three Python versions in CI.

Done:

- Merged the work into `main`. It had been sitting on an unmerged branch while
  `main` held one commit containing a `.gitattributes` file. Anyone opening
  the repo saw an empty project, and commits outside the default branch do not
  count as contributions
- Added LICENSE. Without one, nobody may legally use the code
- Added `docs/how-it-works.md`, an engineering writeup on why the tool drives
  a browser instead of an API, how the selector fallbacks and the checked-in
  page fixture keep it working, what real registration phone data looks like,
  and how one worker thread serves three front ends
- README now leads with the consent and terms warning, before the setup steps

Left to do, by hand:

1. Settings, General, Danger Zone, change visibility to public
2. Settings, General, rename the repo to `whatsapp-group-adder`. The current
   name is mixed case and does not describe the tool. The CI badge already
   points at the lowercase path and will need updating again after the rename

## divitkej/whatsapp-group-sync (public)

Working Node and Python tool. A dashboard links a WhatsApp session, logs group
members hourly, and reconciles them against a registration roster.

Fixed on branch `claude/repo-cleanup-mir3g8`:

- Removed real personal data from the working tree
- `extract.py` had its input path, sheet name, and output directory hardcoded
  to absolute paths from one machine. They are command line arguments now
- `server.js` hardcoded port 3000 while the docs told people to set `PORT`
- README rewritten around what the tool does and what it cannot do
- `SETUP_WHATSAPP.md` documented five npm scripts that do not exist in
  `package.json`. Folded the useful parts into the README and deleted it
- Added LICENSE, `requirements.txt`, and CI

### Blocked: personal data still in the git history

All four commits on `main` contain other people's data:

| What | Where |
| --- | --- |
| Three real phone numbers | `group_sync.py` in all four commits, `README.md` in the first |
| Two real names | `README.md` in the first commit |
| Two BITS student IDs | `README.md` in the first commit |

The cleanup branch fixes the current files. It cannot fix the history, because
old commits keep their own copies of every file. Anyone can still read them
with `git log -p`.

Removing them needs either a history rewrite and a force push, or deleting the
repo and pushing a clean copy. Both were blocked in this environment as
destructive git operations. This needs a decision and a hand to run it.

Until it is resolved, the sensible interim step is to make the repo private,
which takes one click in Settings and stops the exposure while the fix is
worked out.

## gradlink (not on GitHub)

Nothing exists under this account by that name. Needs a repo, a one line
description, and the standard scaffolding before the code grows further.
`scripts/new-project.sh` produces a project that already meets the standards.
