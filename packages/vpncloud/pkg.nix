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

  cargoHash = "sha256-cJ88EIR+SobGZRTdrYmSZnwPxzwbLRN7TVJrqpdNF+g=";

  prePatch = ''
    rm .cargo/config
  '';
}
