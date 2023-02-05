{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "nali";
  version = "v0.7.1";
  src = fetchFromGitHub ({
    owner = "zu1k";
    repo = "nali";
    rev = "v0.7.1";
    fetchSubmodules = true;
    sha256 = "sha256-ZJnQiTcfvxHFgRNytQANs/lF4hy0S0cXOy8IuGECYi0=";
  });
  vendorSha256 = "sha256-TLij88IksL0+pARKVhEhPg6qUPAXMlL2DWJk4ynahUs=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
