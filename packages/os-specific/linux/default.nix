{ nixpkgs, nvfetcherOut, kernelPatches, ... }:

with nixpkgs;
{
  ksmbd-tools = callPackage ./ksmbd/tools.nix { };

  ksmbd-kernel = callPackage ./ksmbd/kernel.nix { };
}
