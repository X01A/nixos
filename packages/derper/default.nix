{ tailscale }:

tailscale.overrideAttrs (oldAttrs: rec {
  pname = "derper";
  subPackages = [ "cmd/derper" ];

  patchPhase = ''
    # Disable ServerHello check
    substituteInPlace cmd/derper/cert.go --replace 'hi.ServerName != m.hostname' 'false'
  '';

  postInstall = ":";
})
