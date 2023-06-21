#!/usr/bin/env python3
import os
import json

path = os.popen('nix build --print-out-paths --no-link .#packageList').read().strip()

pkgs = "[]"

with open(path, 'r') as file:
    data = json.load(file)
    pkgs = json.dumps(list(map(lambda x: ({ "package": x }), data)))

with open(os.getenv('GITHUB_OUTPUT'), 'w') as file:
    file.write(f"matrix={pkgs}")
