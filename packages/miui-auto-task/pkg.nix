{ stdenv, fetchFromGitHub, makeWrapper, python3 }:

let
  python3WithPackages = python3.withPackages (python-packages: with python-packages; [
    requests
    python-dotenv
    pyyaml
  ]);
in
stdenv.mkDerivation rec {
  pname = "miui-auto-tasks";
  version = "unstable-2023-02-08";
  src = fetchFromGitHub {
    owner = "0-8-4";
    repo = "miui-auto-tasks";
    rev = "6c3c31a58a2204fe1d1701b7a69be3cc0bd012ea";
    sha256 = "sha256-a+p8ko1c1rfwoXkinUzZYYcHeFFy3YdLNHdi/cxO7HQ=";
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
