# Repo audit

State of every repo on the account, what was wrong, and what is left to
decide. Updated 22 September 2026.

## divitkej/github-develop (public)

This repo. Holds the plan, standards, and templates.

Open item: the default branch is `claude/github-portfolio-setup-mir3g8`
because the repo was empty when the first branch was pushed. Rename it to
`main` under Settings, Branches. Contributions only count on the default
branch, so this is not cosmetic.

## divitkej/whatsapp-group-sync (public)

Working Node and Python tool. A dashboard links a WhatsApp session, logs group
members hourly, and reconciles them against a registration roster.

Fixed on branch `claude/repo-cleanup-mir3g8`:

- Two real names and phone numbers were sitting in the `group_sync.py`
  docstring in a public repo
- `extract.py` had the input spreadsheet path, sheet name, and output
  directory hardcoded to absolute paths from one machine, including a
  `/root/.claude/uploads/...` path. They are command line arguments now
- `server.js` hardcoded port 3000 while the docs told people to set `PORT`
- README was a wall of checkmarks and emoji with an ASCII mockup of the
  dashboard. Rewritten around what the tool does and what it cannot do
- `SETUP_WHATSAPP.md` documented five npm scripts that do not exist in
  `package.json`. Folded the useful parts into the README and deleted it
- No LICENSE file although the README claimed MIT
- No `requirements.txt` for the Python dependency
- No CI

Still open:

- The two real phone numbers are still in the git history of `main`. Removing
  them properly means rewriting history or recreating the repo. Decide which
- `extract.py` reads spreadsheet columns by fixed index instead of by header
- The dashboard has no authentication. Fine on localhost, unsafe if exposed
- No tests

## divitkej/whatsapp-adding-automation (private)

The strongest piece of work on the account. Reads a spreadsheet of numbers,
drives WhatsApp Web in a real browser, and adds each number to a chosen group,
with a desktop UI, a phone control panel, a CSV report, and a real test suite
running on three Python versions in CI.

The problem is structural, not technical:

- `main` contains one commit with a `.gitattributes` file and nothing else.
  All of the actual work sits on the unmerged branch
  `claude/loving-thompson-dap8ev`. Anyone who opens the repo sees an empty
  project, and commits on a non-default branch do not count as contributions
- The repo is private, so none of it is visible on the profile
- There was no LICENSE. Added on branch `claude/repo-cleanup-mir3g8`

Decisions needed:

1. Merge the work into `main`. Without this the repo reads as abandoned
2. Public or private. It automates a platform in ways that can breach
   WhatsApp's terms of service, and it handles other people's phone numbers.
   If it goes public, the README needs to lead with that. If it stays private,
   write a public post about the engineering instead
3. The repo name is `Whatsapp-Adding-Automation` in mixed case while GitHub
   serves it lowercase. Rename it to `whatsapp-group-adder` to match the tool

## gradlink (not on GitHub yet)

Currently being built. Nothing exists under this account yet, so nothing can
be reviewed. Needs a repo, a name decision, and the standard scaffolding
before the code grows any further.
