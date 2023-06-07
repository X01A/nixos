{ lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "tun2socks";
  version = "2.5.1";
  src = fetchFromGitHub ({
    owner = "xjasonlyu";
    repo = "tun2socks";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-qRjVZF15CjFohv9PQO0bLAjS8ip//S7yncXOn9oS2XM=";
  });

  vendorSha256 = "sha256-zeiOcn33PnyoseYb0wynkn7MfGp3rHEYBStY98C6aR8=";

  # modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
