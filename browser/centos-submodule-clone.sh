#!/bin/bash
cd `git rev-parse --show-toplevel`
git submodule init browser/chrome-centos
git submodule update
