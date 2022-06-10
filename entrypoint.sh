#!/bin/sh -l

cargo test --release
cargo build --release

binary-path="$PWD/target/release"

echo "::set-output name=binary-path::$binary-path"