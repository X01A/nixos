{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-06-21";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "59ab942bc7241fef559cd86b6dd5fbe2653d6dc9";
    fetchSubmodules = true;
    sha256 = "sha256-t4SI8utEKSI3+83NSx3fOLHnjYfUQuk37QltO24qY10=";
  });

  cargoSha256 = "sha256-Ppj/o6I1BUcQ8TFQXcDO1slDbF8Uo5ihtM6LPLG7oTo=";

  RUSTC_BOOTSTRAP = 1;

  buildInputs = [
    openssl
    sqlite
    libgit2
    zlib
  ];

  # TODO libssh2-sys failed to pass test
  doCheck = false;
  nativeBuildInputs = [ pkg-config ];
}
