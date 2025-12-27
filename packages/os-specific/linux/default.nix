{
  pkgs,
  normalPkgs,
  kernelPatches,
  ...
}:

with normalPkgs;
{
  ksmbd-tools = callPackage ./ksmbd/tools.nix { };

  ksmbd-kernel = callPackage ./ksmbd/kernel.nix { };
}
