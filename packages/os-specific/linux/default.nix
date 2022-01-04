{ nixpkgs, nvfetcherOut, ... }:

with nixpkgs;
{
  ksmbd-tools = callPackage ./ksmbd/tools.nix {
    source = nvfetcherOut.ksmbd-tools;
  };

  ksmbd-kernel = callPackage ./ksmbd/kernel.nix {
    source = nvfetcherOut.ksmbd;
  };
}
