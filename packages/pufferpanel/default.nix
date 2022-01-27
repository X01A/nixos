{ lib, fetchFromGitHub, buildGo117Module, source }:

buildGo117Module rec {
  inherit (source) pname version src;

  vendorSha256 = lib.fakeSha256;

  # modSha256 = lib.fakeSha256;
  subPackages = [ "cmd" ];

  doCheck = false;
}
