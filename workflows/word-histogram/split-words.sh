#!/usr/bin/env bash

sed -e 's/[;[:punct:][:space:]]/\n/g' | sed -e '/^[:space:]*$/d'