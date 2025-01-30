#!/usr/bin/env bash

stderr() {
  echo "$@" >&2
}

setup_venv() {
  if [[ -d ".venv" ]]; then
    return
  fi

  stderr "Setting up virtual environment..."
  python3 -m venv .venv
  source .venv/bin/activate
  pip install twisted pyopenssl
}

main() {
  twistd -n web --port ssl:443:privateKey=server.key:certKey=server.crt --path .
}

setup_venv
main "$@"

