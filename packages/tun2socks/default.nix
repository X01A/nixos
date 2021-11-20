{ lib, fetchFromGitHub, buildGo117Module, source }:

buildGo117Module rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-dcLEJJn2shl9lpohdZw6svWFAgmRGkDO3/Vctag0m8E=";

  # modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
