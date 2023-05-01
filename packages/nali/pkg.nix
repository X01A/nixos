{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "nali";
  version = "0.7.3";
  src = fetchFromGitHub ({
    owner = "zu1k";
    repo = "nali";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-ZKLxsq7ybom96NKWkioROAVXUoY20zFBZn7ksk4XvT4=";
  });
  vendorSha256 = "sha256-l3Fs1Hd0kXI56uotic1407tb4ltkCSMzqqozFpvobH8=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
