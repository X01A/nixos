{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "netmaker";
  version = "0.14.6";

  src = fetchFromGitHub {
    owner = "gravitl";
    repo = "netmaker";
    rev = "66cbc96b894f455de40c5342ef37c5d473e8079b";
    fetchSubmodules = true;
    sha256 = "sha256-jN4ep4HMPT8nZe+RmCnrHv8X2uqcjrPVFdAVLGRu9Zk=";
  };

  vendorSha256 = "sha256-AfD5d0KDnVIEo4glf1IqTT33XvXbnMILhCbyslUdZiQ=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." "netclient" ];

  doCheck = false;
}
