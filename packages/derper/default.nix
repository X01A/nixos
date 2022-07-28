{ tailscale }:

tailscale.overrideAttrs (oldAttrs: rec {
  pname = "derper";
  subPackages = [ "cmd/derper" ];

  patchPhase = ''
    # Disable ServerHello check
    substituteInPlace cmd/derper/cert.go --replace 'hi.ServerName != m.hostname' 'false'
    substituteInPlace cmd/derper/cert.go --replace 'x509Cert.VerifyHostname(hostname)' 'nil'
  '';

  postInstall = ":";
})
