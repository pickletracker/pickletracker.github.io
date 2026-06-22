#!/usr/bin/env bash
set -ex

rm -rf dist

git clone https://github.com/pickletracker/pickletracker source

mkdir dist

pushd source
	nix develop --command bash -c "make build-web"
popd

cp -l index.html                          dist/

# Web version
cp -l source/build/web/pickletracker.js   dist/
cp -l source/build/web/pickletracker.wasm dist/
cp -l app.html                            dist/
