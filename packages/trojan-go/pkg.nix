{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "trojan-go";
  version = "0.10.6";
  src = fetchFromGitHub ({
    owner = "p4gefau1t";
    repo = "trojan-go";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-ZzIEKyLhHwYEWBfi6fHlCbkEImetEaRewbsHQEduB5Y=";
  });

  vendorHash = "sha256-c6H/8/dmCWasFKVR15U/kty4AzQAqmiL/VLKrPtH+s4=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  tags = [ "full" ];

  doCheck = false;
}
