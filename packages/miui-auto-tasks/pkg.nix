{ stdenv, fetchFromGitHub, makeWrapper, python3, python3Packages }:

let
  onepush = import ../onepush/pkg.nix {
    inherit python3Packages fetchFromGitHub;
  };

  python3WithPackages = python3.withPackages (python-packages: with python-packages; [
    requests
    python-dotenv
    pyyaml
    onepush
  ]);
in
stdenv.mkDerivation {
  pname = "miui-auto-tasks";
  version = "1.8.2-hotfix4-unstable-2025-04-15";
  src = fetchFromGitHub {
    owner = "0-8-4";
    repo = "miui-auto-tasks";
    rev = "7793b1e8ff760ded06833d1df65a17d7695e51a0";
    sha256 = "sha256-Ce6hP4+dw8oIX/ddFHkCCHN6gzC+am9zHV8PNqa0F5g=";
    fetchSubmodules = true;
  };

  phases = "installPhase";
  nativeBuildInputs = [ makeWrapper ];
  installPhase = ''
    mkdir -p $out/python $out/bin
    cp -r $src/* $out/python/
    rm -f $out/python/config.yaml
    substituteInPlace "$out/python/utils/utils.py" \
      --replace "dotenv.find_dotenv(filename='config.yaml')" "dotenv.find_dotenv(filename='config.yaml', usecwd=True)"
    makeWrapper ${python3WithPackages}/bin/python "$out/bin/miuitask" \
      --add-flags "$out/python/miuitask.py"
  '';
}
