#!/usr/bin/env bash
# Remove personal data from every commit in the history of a repository,
# then leave you ready to force push the rewritten history.
#
# Run this on your own laptop. Rewriting published history is blocked inside
# a Claude session as a destructive operation.
#
# The replacements file is deliberately NOT stored in this repository. It
# contains the very data you are trying to remove, and this repo is public.
# Write it locally, run this, then delete it.
#
# Usage:
#   git clone https://github.com/divitkej/whatsapp-group-sync.git
#   cd whatsapp-group-sync
#   bash /path/to/scrub-sync-history.sh /path/to/replacements.txt
#
# Format of replacements.txt, one per line, no quotes:
#   <the real value>==><the replacement>
#
# For whatsapp-group-sync you need eight lines: three phone numbers, one
# older number, two names, and two student IDs. See docs/REPO_AUDIT.md for
# which files and commits they appear in.

set -euo pipefail

REPL="${1:-}"

if [[ ! -d .git ]]; then
  echo "Run this from inside a clone of the repository you are scrubbing." >&2
  exit 1
fi

if [[ -z "$REPL" || ! -f "$REPL" ]]; then
  echo "Usage: bash scrub-sync-history.sh /path/to/replacements.txt" >&2
  exit 1
fi

if ! command -v git-filter-repo >/dev/null 2>&1; then
  echo "git-filter-repo is not installed. Install it with one of:" >&2
  echo "  pip install git-filter-repo" >&2
  echo "  brew install git-filter-repo" >&2
  exit 1
fi

git filter-repo --replace-text "$REPL" --force

echo
echo "History rewritten locally. Verify before pushing. For each real value:"
echo "  git log -p | grep -c '<the value>'    # must print 0"
echo
echo "Then, and only then:"
echo "  git remote add origin <the repo URL>"
echo "  git push --force origin main"
echo
echo "filter-repo drops the remote on purpose, so you cannot force push by"
echo "accident before you have looked at the result."
echo
echo "Afterwards: delete $REPL, and tell the people whose details were"
echo "exposed. A force push does not remove the old commits from anyone's"
echo "existing clone, or from GitHub's cache of them immediately."
