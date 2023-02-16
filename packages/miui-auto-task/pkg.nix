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
  version = "unstable-2023-02-16";
  src = fetchFromGitHub {
    owner = "0-8-4";
    repo = "miui-auto-tasks";
    rev = "b232a83a5cccc35a116fb14b27868036cb0652a7";
    sha256 = "sha256-kjl4NPYpsA3lq1qvYkjJaICryMrR6sohQRbNTfc1hn8=";
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
