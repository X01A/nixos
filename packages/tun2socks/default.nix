{ lib, fetchFromGitHub, buildGo118Module, source }:

buildGo118Module rec {
  inherit (source) pname version src;

  vendorSha256 = "sha256-XWzbEtYd8h63QdpAQZTGxyxMAAnpKO9Fp4y8/eeZ7Xw=";

  # modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
