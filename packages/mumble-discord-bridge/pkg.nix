{ fetchFromGitHub
, buildGoModule
, callPackage
, lib
, pkg-config
, libopus
,
}:

let
  mlspp = callPackage ./mlspp.nix { };
  libdave = callPackage ./libdave.nix { inherit mlspp; };
in
buildGoModule rec {
  pname = "mumble-discord-bridge";

  version = "0.9.0";

  src = fetchFromGitHub ({
    owner = "Stieneee";
    repo = pname;
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-9EFTmRJx7vsjvSX9nbXtpDkgif3IlaGRKxQRxyuJ3hs=";
  });

  vendorHash = "sha256-vUr0Im1UrJHPhGcAk6z1KYVj+dEhADbP4ZJtVgNaQk8=";
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [
    libdave
    libopus
  ];

  # Testing is taking more then 10 minute
  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/Stieneee/mumble-discord-bridge";
    description = "A simple voice bridge between Mumble and Discord";
    changelog = "https://github.com/Stieneee/mumble-discord-bridge/releases/tag/v${version}";
    license = licenses.mit;
  };
}
