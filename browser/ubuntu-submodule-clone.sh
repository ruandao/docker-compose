#!/bin/bash
cd `git rev-parse --show-toplevel`
git submodule init browser/chrome-ubuntu
git submodule update
