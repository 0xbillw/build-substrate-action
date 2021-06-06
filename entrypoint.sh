#!/bin/sh -l

rustup override set $1 && rustup target add wasm32-unknown-unknown --toolchain $1

cargo build --release

binary-path="$PWD/target/release"

echo "::set-output name=binary-path::$binary-path"