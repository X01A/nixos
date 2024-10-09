{ fetchFromGitHub, rustPlatform, lib }:

rustPlatform.buildRustPackage rec {
  pname = "vpncloud";
  version = "2.3.0";
  src = fetchFromGitHub ({
    owner = "dswd";
    repo = "vpncloud";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-74ohjWnBHr31sM08ghFWnrfIRjfQ5M7nrKi0yT/cGEo=";
  });

  cargoHash = "sha256-xwHjfEOav9dRPIopvmSN9aSPIA9yqfo27xOr2XBZEjQ=";

  prePatch = ''
    rm .cargo/config
  '';
}
