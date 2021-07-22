{ stdenv
, cloudreve-cli
}:

{ share ? ""
, shareFile ? ""
, sha256 ? ""
}:

stdenv.mkDerivation {
  name = "cloudreve-share-${shareFile}";
  builder = ./builder.sh;

  nativeBuildInputs = [ cloudreve-cli ];
  outputHashAlgo = "sha256";
  outputHash = sha256;
  outputHashMode = "recursive";

  inherit share
    shareFile;
}
