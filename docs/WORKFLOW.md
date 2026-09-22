# The workflow

Read this once, then keep it open for a month. After that it is automatic.

## One time setup on your laptop

```bash
git config --global user.name "Divit Kejriwal"
git config --global user.email "divitkej@gmail.com"
git config --global init.defaultBranch main
git config --global pull.rebase false
```

The email must match the one on your GitHub account, or your commits will not
count on the contribution graph. Check it at
https://github.com/settings/emails. If you use the private relay address,
set that one instead.

Verify a commit is being attributed to you: after pushing, the commit on
GitHub should show your avatar, not a grey silhouette.

## Starting a project

```bash
mkdir project-name && cd project-name
git init
# write code, then:
git add .
git commit -m "Initial commit: project skeleton"
gh repo create project-name --public --source=. --push   # if gh CLI is installed
```

Without the CLI: create the repo on github.com first, leave it empty, then

```bash
git remote add origin https://github.com/divitkej/project-name.git
git branch -M main
git push -u origin main
```

## The daily loop

```bash
git status                  # what changed
git add -p                  # stage in pieces, read your own diff
git commit -m "..."         # small, one idea per commit
git push                    # same day, always
```

Never let work sit uncommitted overnight. A day of work that is not pushed is
a day that did not happen as far as the graph and your backups are concerned.

## Branches and pull requests

Even alone, work on branches. It teaches the habit and it fills the pull
request slice of your activity chart.

```bash
git checkout -b feature/login-page
# work, commit
git push -u origin feature/login-page
```

Then open a pull request on GitHub, write two lines about what changed, and
merge it yourself. Ten seconds of extra work, and now your history is readable.

Branch naming:

- `feature/short-description` for new work
- `fix/short-description` for bugs
- `docs/short-description` for documentation

## Commit messages

Format: a verb in the imperative, under 60 characters, no full stop.

Good:

```
Add rate limiting to the WhatsApp sync loop
Fix crash when contact list is empty
Remove unused Twilio credentials from config
```

Bad:

```
update
final final v2
asdasd
fixed stuff
```

If a commit needs more explanation, leave a blank line and write a paragraph
under the summary. Future you reading `git log` in 2028 is the audience.

## Issues

On your own repos, open an issue before you write the code for anything that
takes more than an hour. Then close it from the commit:

```bash
git commit -m "Add CSV export for contacts

Closes #7"
```

This costs nothing and turns your repo into something that looks maintained.

## Never do this

- `git push --force` on a branch someone else has pulled
- Committing `.env`, API keys, tokens, or `node_modules`
- One giant commit at the end of a project
- Committing generated files that a build produces
- Copying a whole project from a tutorial and pushing it as your own

If you ever do push a secret, rotate the key immediately. Deleting the commit
is not enough, it is already in the history and in caches.

## Recovering from mistakes

```bash
git commit --amend -m "Better message"      # fix the last message, before pushing
git reset --soft HEAD~1                     # undo last commit, keep the changes
git restore path/to/file                    # throw away uncommitted changes
git reflog                                  # find a commit you thought you lost
```
