{ nixpkgs, nvfetcherOut, kernelPatches, ... }:

with nixpkgs;
{
  ksmbd-tools = callPackage ./ksmbd/tools.nix {
    source = nvfetcherOut.ksmbd-tools;
  };

  ksmbd-kernel = callPackage ./ksmbd/kernel.nix {
    source = nvfetcherOut.ksmbd;
  };

  linux-rc = callPackage ./linux-rc {
    source = nvfetcherOut.linux-rc;
    kernelPatches = [
      kernelPatches.bridge_stp_helper
      kernelPatches.request_key_helper
    ];
  };
}
