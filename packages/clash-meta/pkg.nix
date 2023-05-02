{ fetchFromGitHub, buildGo120Module, lib }:

buildGo120Module rec {
  pname = "clash-meta";
  version = "unstable-2023-05-02";
  src = fetchFromGitHub ({
    owner = "MetaCubeX";
    repo = "Clash.Meta";
    rev = "81b268853511954275b607ac42e07d7406afa5d8";
    fetchSubmodules = true;
    sha256 = "sha256-I9/CcziPEJwmS8eT7ckdkHVNQZES/Zt64YtKTsgLJ7E=";
  });


  tags = [
    "with_gvisor"
  ];
  ldflags = [
    "-s"
    "-w"
    "-X github.com/Dreamacro/clash/constant.Version=${version}"
  ];

  doCheck = false;
  excludedPackages = [ "./test" ];
  vendorSha256 = "sha256-kliAQh4hzNqTNl/7UiilUOL8A++nb+rY10P3mBqlyhE=";

  meta = with lib; {
    homepage = "https://github.com/MetaCubeX/Clash.Meta";
    description = "A rule-based tunnel in Go";
    changelog = "https://github.com/MetaCubeX/Clash.Meta/releases/tag/v${version}";
    license = licenses.gpl3;
  };
}

