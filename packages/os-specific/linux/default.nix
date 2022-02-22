{ nixpkgs, nvfetcherOut, kernelPatches, ... }:

with nixpkgs;
let
  linux-rc = callPackage ./linux-rc {
    source = nvfetcherOut.linux-rc;
    kernelPatches = [
      kernelPatches.bridge_stp_helper
      kernelPatches.request_key_helper
    ];
  };
in
{
  ksmbd-tools = callPackage ./ksmbd/tools.nix {
    source = nvfetcherOut.ksmbd-tools;
  };

  ksmbd-kernel = callPackage ./ksmbd/kernel.nix {
    source = nvfetcherOut.ksmbd;
  };

  inherit linux-rc;

  linuxPackages-rc = (linuxPackagesFor linux-rc).extend (final: prev: {
    zfs = prev.zfs.overrideAttrs (_: {
      name = "zfs-2.1.3-staging-${prev.kernel.version}";
      version = "zfs-2.1.3-staging";
      src = fetchFromGitHub {
        owner = "openzfs";
        repo = "zfs";
        rev = "zfs-2.1.3-staging";
        sha256 = "sha256-bQ6KR3XlqIze4esHpfWZTBXTdtM8y67Tg+jQlLG7HD4";
      };
      meta.broken = false;
    });
  });
}
