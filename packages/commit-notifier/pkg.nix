{ rustPlatform, pkg-config, openssl, sqlite, zlib, libgit2, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "commit-notifier";
  version = "0-unstable-2024-12-05";
  src = fetchFromGitHub ({
    owner = "linyinfeng";
    repo = "commit-notifier";
    rev = "728ce9cad5defafa20fb0f898cf884121c816dbc";
    fetchSubmodules = true;
    sha256 = "sha256-xRSWKBxwH6E/cr7QmkeDs3NxOzgJVXn4RapLKcRaYGE=";
  });

  cargoHash = "sha256-PUf+EJu6Y6qo75Y+xRHArYAWkepQOU2+DvpqmRvRr8w=";

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
