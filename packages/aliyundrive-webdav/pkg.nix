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

  cargoHash = "sha256-eow/kyjruEiT5QSGge09kKA/yS74C5BWjg+xRZUkmLQ=";
}
