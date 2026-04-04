{
  rustPlatform,
  pkg-config,
  openssl,
  sqlite,
  zlib,
  libgit2,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2026-04-04";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "5a397f633ef770412c122a565263960c6d737843";
    fetchSubmodules = true;
    sha256 = "sha256-dkQu70gkE7K43sGH7AH4dKtv+dmye3yoT9kTGfIsnrg=";
  });

  cargoHash = "sha256-qPSg8pMSzy/juq4/RKWdPbrG/P12jvXf4NeWYsnYgY0=";

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
