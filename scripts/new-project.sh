#!/usr/bin/env bash
# Scaffold a new project that already meets docs/REPO_STANDARDS.md.
#
# Usage: ./scripts/new-project.sh my-project python
#        ./scripts/new-project.sh my-project node

set -euo pipefail

NAME="${1:-}"
LANG="${2:-python}"
TEMPLATES="$(cd "$(dirname "${BASH_SOURCE[0]}")/../templates" && pwd)"

if [[ -z "$NAME" ]]; then
  echo "Usage: $0 <project-name> [python|node]" >&2
  exit 1
fi

if [[ -e "$NAME" ]]; then
  echo "Refusing to overwrite existing path: $NAME" >&2
  exit 1
fi

mkdir -p "$NAME/.github/workflows"
cd "$NAME"

sed "s/project-name/$NAME/g" "$TEMPLATES/README.template.md" > README.md
cp "$TEMPLATES/LICENSE.MIT" LICENSE
cp "$TEMPLATES/github/pull_request_template.md" .github/pull_request_template.md

case "$LANG" in
  python)
    cp "$TEMPLATES/gitignore.python" .gitignore
    cp "$TEMPLATES/github/ci-python.yml" .github/workflows/ci.yml
    mkdir -p src tests
    touch requirements.txt
    ;;
  node)
    cp "$TEMPLATES/gitignore.node" .gitignore
    cp "$TEMPLATES/github/ci-node.yml" .github/workflows/ci.yml
    mkdir -p src tests
    ;;
  *)
    echo "Unknown language: $LANG (expected python or node)" >&2
    exit 1
    ;;
esac

git init -q
git symbolic-ref HEAD refs/heads/main
git add .
git commit -q -m "Initial commit: project skeleton"

echo "Created $NAME with README, LICENSE, .gitignore, and CI."
echo "Next: write the README first line, then:"
echo "  cd $NAME && gh repo create $NAME --public --source=. --push"
