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
  version = "1.7.6-hotfix1-unstable-2024-04-26";
  src = fetchFromGitHub {
    owner = "0-8-4";
    repo = "miui-auto-tasks";
    rev = "6b1e43f652aa61c246d95e56c0de3bf0df2bd065";
    sha256 = "sha256-+ONlMwrCfuTxZjWqh4eEvlitRV+fyYPbfttXju5NZAY=";
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
