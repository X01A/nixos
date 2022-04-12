{ lib, fetchFromGitHub, buildGo117Module, source }:

buildGo117Module rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-XWzbEtYd8h63QdpAQZTGxyxMAAnpKO9Fp4y8/eeZ7Xw=";

  # modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
