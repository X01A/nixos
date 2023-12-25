{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "unstable-2023-12-24";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "effbc2b50656bf30f247ea0c3430f79067b13f74";
    fetchSubmodules = true;
    sha256 = "sha256-axkWEtxtB+78S8+fMp4k2c4v5eGl7UYAVyv32DiIYHo=";
  });

  cargoSha256 = "sha256-TR4rUH/qTYqUt9N7FJm5djW60MismEBix59608I8Mp8=";

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
