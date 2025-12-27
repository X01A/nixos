{
  lib,
  fetchFromGitHub,
  buildGoModule,
}:

buildGoModule rec {
  pname = "tun2socks";
  version = "2.6.0";
  src = fetchFromGitHub ({
    owner = "xjasonlyu";
    repo = "tun2socks";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-ec4M107BE6MCnW/uz9S83JYJtY9tsQQXDFL98h951DA=";
  });

  vendorHash = "sha256-YAAdyV2p/Ci9RzgVWYXBwR/ctERSQ8SPK7AbwRuUJiI=";

  # modSha256 = lib.fakeSha256;
  subPackages = [ "." ];

  doCheck = false;
}
