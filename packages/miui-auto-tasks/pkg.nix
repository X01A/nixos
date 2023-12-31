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
  version = "unstable-2023-12-30";
  src = fetchFromGitHub {
    owner = "0-8-4";
    repo = "miui-auto-tasks";
    rev = "597bd50a58234552093a590d8e0a0195ff91d4c7";
    sha256 = "sha256-XFP/JLG+S6etHl69R2fE3Dp8mDsub9roQHjfS/J/9gs=";
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
