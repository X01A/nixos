{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "trojan-go";
  version = "v0.10.6";
  src = fetchFromGitHub ({
    owner = "p4gefau1t";
    repo = "trojan-go";
    rev = "v0.10.6";
    fetchSubmodules = true;
    sha256 = "sha256-ZzIEKyLhHwYEWBfi6fHlCbkEImetEaRewbsHQEduB5Y=";
  });

  vendorSha256 = "sha256-c6H/8/dmCWasFKVR15U/kty4AzQAqmiL/VLKrPtH+s4=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  tags = [ "full" ];

  doCheck = false;
}
