{ stdenv, fetchFromGitHub, makeWrapper, python3, onepush }:

let
  python3WithPackages = python3.withPackages (python-packages: with python-packages; [
    requests
    python-dotenv
    pyyaml
    onepush
  ]);
in
stdenv.mkDerivation rec {
  pname = "miui-auto-tasks";
  version = "unstable-2023-03-03";
  src = fetchFromGitHub {
    owner = "0-8-4";
    repo = "miui-auto-tasks";
    rev = "e7d96d84c32d2b82f84982d7e9322f777a34b132";
    sha256 = "sha256-LAOiPomE9O2CnwzqmjlMNnnJ21edUuBEqX7pRlCINXk=";
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
