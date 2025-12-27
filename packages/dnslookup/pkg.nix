{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "dnslookup";
  version = "1.10.0";
  src = fetchFromGitHub ({
    owner = "ameshkov";
    repo = "dnslookup";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-T3KvaNAPS4WEALttMaZx+zOc3Iu9aSujH0WNfHa2baM=";
  });

  vendorHash = "sha256-pLgXsasWD4Wb1dW0+1fl5M+CM2hr7zohXiHLsDj73h0=";

  modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
