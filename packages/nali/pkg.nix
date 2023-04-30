{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "nali";
  version = "0.7.2";
  src = fetchFromGitHub ({
    owner = "zu1k";
    repo = "nali";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-tIn5ty7faM9BBmUWCvok94QOAMVtz5daCPpZkDGOJfo=";
  });
  vendorSha256 = "sha256-l3Fs1Hd0kXI56uotic1407tb4ltkCSMzqqozFpvobH8=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
