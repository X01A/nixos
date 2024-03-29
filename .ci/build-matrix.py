#!/usr/bin/env python3
import os
import sys
import json

path = os.popen('nix build --print-out-paths --no-link .#packageList').read().strip()

pkgs = []

with open(path, 'r') as file:
    pkgs = json.load(file)



if not os.getenv('GITHUB_OUTPUT'):
    print("GITHUB_OUTPUT env not found")
    sys.exit(1)

with open(os.getenv('GITHUB_OUTPUT'), 'w') as file:
    value = json.dumps({
        "pacakges": list(map(lambda x: ({ 'name': x }), pkgs))
    })
    print(f"matirx -> {value}")
    file.write(f"matrix={value}\n")
