{ pkgs, normalPkgs, nvfetcherOut, kernelPatches, ... }:

with normalPkgs;
{
  ksmbd-tools = callPackage ./ksmbd/tools.nix { };

  ksmbd-kernel = callPackage ./ksmbd/kernel.nix { };
}
