#!/usr/bin/env pwsh -nologo
Param([switch]$Upload,[switch]$Build)
Push-Location $PSScriptRoot

if ( $Build -or !$Upload ) {
    docker build . -t ghcr.io/sudachen/eth-mynet:latest
}

# it does upload only if it's requested
# you must login into GitHub container registry before
#    docker login ghcr.io
# it requires GITHUB_TOKEN with packages writing permission

if ( $Upload ) {
    docker push ghcr.io/sudachen/eth-mynet:latest
}

Pop-Location

