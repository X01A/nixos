{ fetchFromGitHub }:

let
  # The upstream project is archived and never tagged a release after
  # v1.6.1-update1, so follow nixpkgs' convention for post-release snapshots.
  version = "1.6.1-unstable-2025-06-01";
in
fetchFromGitHub {
  owner = "ronggang";
  repo = "transmission-web-control";
  rev = "054e2edf7ee1ec859cec3ee5661a550481321a27";
  sha256 = "sha256-OsGT4emj6nLVNG87RZ/NW1RcSrw50phKGy04t45QvX8=";
} // { inherit version; }
