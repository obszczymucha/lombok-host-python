#!/usr/bin/env bash

log() {
  echo "$@" >&2
}

main() {
  if [[ "$#" -ne 1 ]]; then
    log "Usage: $0 <version>"
    exit 1
  fi

  local base_url="https://download.eclipse.org/jdtls/milestones"
  local version="$1"

  log "Fetching artifact name for ${version}..."
  local artifact_name
  artifact_name=$(wget -qO- "${base_url}/${version}/latest.txt")
  log "Found ${artifact_name}."

  local url="${base_url}/${version}/${artifact_name}"
  log "Downloading ${url}..."

  local output_location="jdtls/milestones/${version}"
  mkdir -p "$output_location"

  wget -O "jdtls/milestones/${version}/${artifact_name}" "$url"

  log "Downloading lombok..."
  wget -O "downloads/lombok.jar" "https://projectlombok.org/downloads/lombok.jar"
}

main "$@"

