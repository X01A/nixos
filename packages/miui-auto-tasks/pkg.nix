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
  version = "1.8.2-unstable-2025-01-25";
  src = fetchFromGitHub {
    owner = "0-8-4";
    repo = "miui-auto-tasks";
    rev = "e2b4643b4f3072c192912837164f57437431902f";
    sha256 = "sha256-BzkM5WQY9AIYUZAvfrzu2vp9eSzF0MQMnmPP5/cG9LI=";
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
