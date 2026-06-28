#!/usr/bin/env bash

set -ex

function update-use-codex {
  codex exec "Goal: Update package \`${PACKAGE}\`

Found latest version and update

Test compile on both x86_64-linux and aarch64-linux

Commit Message Format:

\$(PACKAGE_NAME): \$(OLD_VERSION) -> \$(NEW_VERSION)
"
}

PACKAGE=mcsmanager update-use-codex
