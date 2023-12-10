{ fetchFromGitHub, buildGo120Module, lib, pkg-config, libopus }:

buildGo120Module rec {
  pname = "mumble-discord-bridge";

  version = "0.5.3";

  src = fetchFromGitHub ({
    owner = "Stieneee";
    repo = pname;
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-Rr1g3gdmbmMcXN9KFpktKhB2sedplrFcT2GMfUY9b7g=";
  });

  vendorHash = "sha256-U3RLLXGirZsh5nTlt8tgLsCmNIa3x1SacTFgHhG4OoI=";
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ libopus ];

  # Testing is taking more then 10 minute
  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/Stieneee/mumble-discord-bridge";
    description = "A simple voice bridge between Mumble and Discord";
    changelog = "https://github.com/Stieneee/mumble-discord-bridge/releases/tag/v${version}";
    license = licenses.mit;
  };
}
