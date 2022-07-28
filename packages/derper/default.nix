{ tailscale }:

tailscale.overrideAttrs (oldAttrs: rec {
  pname = "derper";

  subPackages = [ "cmd/derper" ];
  postInstall = ":";
})
