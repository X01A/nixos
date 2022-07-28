{ tailscale }:

tailscale.overrideAttrs (oldAttrs: rec {
  pname = "derper";
  subPackages = [ "cmd/derper" ];

  patchPhase = ''
    # Disable ServerHello check
    substituteInPlace cmd/derper/cert.go --replace 'hi.ServerName != m.hostname' 'false'
    substituteInPlace cmd/derper/cert.go --replace 'err := x509Cert.VerifyHostname(hostname); err != nil' 'false'
    substituteInPlace cmd/derper/cert.go --replace 'x509Cert, err := x509.ParseCertificate(cert.Certificate[0])' ""
    substituteInPlace cmd/derper/cert.go --replace '"crypto/x509"' ""
  '';

  postInstall = ":";
})
