def step(arch, node):
  return {
    "kind": "pipeline",
    "name": "build-%s" % arch,
    "type": "exec",
    "trigger": {
      "branch": [ "master" ]
    },
    "platform": {
      "arch": arch
    },
    "steps": [
      {
        "name": "lint",
        "commands": [ "nixpkgs-fmt --check ." ]
      },
      {
        "name": "build",
        "environment": {
          "NIX_PATH": "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos",
          "CACHIX_TOKEN": {
            "from_secret": "CACHIX_TOKEN"
          }
        },
        "commands": [
          "cachix authtoken $CACHIX_TOKEN",
          "bash build-cache.bash"
        ]
      }
    ],
    "node": node
  }

def main(ctx):
  return [
    step("arm64", {
      "os": "nixos",
      "arch": "aarch64",
      "type": "exec",
      "hostname": "oracle"
    }),
    step("amd64", {
      "os": "nixos",
      "arch": "amd64",
      "type": "exec",
      "hostname": "horizon"
    })
  ]
