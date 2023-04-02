#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o pipefail

BINS=('shellcheck' 'hadolint')
sudo dnf install ${BINS[@]} -y