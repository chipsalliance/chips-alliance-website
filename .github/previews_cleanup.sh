#!/usr/bin/env bash

function remove_if_outdated() {
  PR_DIR=$1
  PR_NUM=$(basename $PR_DIR)

  echo "Getting status for $PR_NUM"
  STATE=$(gh api \
          -H "Accept: application/vnd.github+json" \
          -H "X-GitHub-Api-Version: 2022-11-28" \
          "/repos/$REPO/pulls/$PR_NUM" | jq -r .state)

  if [[ $STATE = "closed" ]]; then
    echo "  PR #$PR_NUM is safe to remove - REMOVING!"
    rm $PR_DIR -r
  else
    echo "  PR #$PR_NUM is NOT safe to remove"
  fi
}

for pr_dir in $(ls pages/preview/* -d); do
  remove_if_outdated $pr_dir
done
