#!/usr/bin/env bash

is_dirty() {
  local -i state="$(( ! $(git status --porcelain | wc -l) ))"
  return ${state}
}

if is_dirty; then
  >&2 echo "Repository contains unstaged or uncommitted changes."
  exit 1
fi

git submodule update --remote >/dev/null 2>&1
if is_dirty; then
  {
    git add .
    git commit -m "Updated submodules"
    git push
  } >/dev/null 2>&1

  echo "Updated submodules and pushed to remote"
  exit 0
fi

echo "Nothing to update"
