{ fetchFromGitHub, rustPlatform, lib }:

rustPlatform.buildRustPackage rec {
  pname = "aliyundrive-webdav";
  version = "2.3.2";
  src = fetchFromGitHub ({
    owner = "messense";
    repo = pname;
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-3MeWJR35CrmFXVb3I+mAJFuXGksdjLyv+oQ1xuH//gU=";
  });

  cargoSha256 = "sha256-goPomcCkJxAkvieQi53zI0r4K1qDQ9GaDOATgdOo/3Y=";
}
