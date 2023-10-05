{ fetchFromGitHub, rustPlatform, lib }:

rustPlatform.buildRustPackage rec {
  pname = "aliyundrive-webdav";
  version = "2.3.3";
  src = fetchFromGitHub ({
    owner = "messense";
    repo = pname;
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-LN2HdmhcPk6RCrRZdV3A8InoYgqJSHC2XjjuKZLfVaI=";
  });

  cargoSha256 = "sha256-/UZHfAW96kqySmic9Fc2FDOq7QAfcVHo1Stlx67YeS8=";
}
