#!/usr/bin/env bash

find . -name "*.tf" -exec terraform fmt {} \;
