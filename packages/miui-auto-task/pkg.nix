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
  version = "unstable-2023-02-14";
  src = fetchFromGitHub {
    owner = "0-8-4";
    repo = "miui-auto-tasks";
    rev = "371577c001268d46afc23b8752aa62aecb458d11";
    sha256 = "sha256-QMNVA0sDw0Z8NGRHOd8oySt27wMQfJGwD3jx9ILA3+4=";
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
