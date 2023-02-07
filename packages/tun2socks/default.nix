{ lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "tun2socks";
  version = "2.4.1";
  src = fetchFromGitHub ({
    owner = "xjasonlyu";
    repo = "tun2socks";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-FBYRqxS8DJbIc8j8X6WNxl6a1YRcNrPSnNfrq/Y0fMM=";
  });

  vendorSha256 = "sha256-XWzbEtYd8h63QdpAQZTGxyxMAAnpKO9Fp4y8/eeZ7Xw=";

  # modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
