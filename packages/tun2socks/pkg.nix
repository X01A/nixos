{ lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "tun2socks";
  version = "2.5.0";
  src = fetchFromGitHub ({
    owner = "xjasonlyu";
    repo = "tun2socks";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-uu0FBhckZ06eXEEuKwN3MopGMDbMjjcABYa/lgM48n4=";
  });

  vendorSha256 = "sha256-QIXgRoxmJaeYGx77EB53zIb94InlQbUSOXE+cUdBttI=";

  # modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
