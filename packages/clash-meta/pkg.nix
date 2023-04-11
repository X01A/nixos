{ fetchFromGitHub, buildGoModule, lib }:

buildGoModule rec {
  pname = "clash-meta";
  version = "1.14.1";
  src = fetchFromGitHub ({
    owner = "MetaCubeX";
    repo = "Clash.Meta";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-xlrhDCvRWvDz6TsHj04x0ojTfL+gkhHLLy9VnJkETqI=";
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
  vendorSha256 = "sha256-8cbcE9gKJjU14DNTLPc6nneEPZg7Akt+FlSDlPRvG5k=";

  meta = with lib; {
    homepage = "https://github.com/MetaCubeX/Clash.Meta";
    description = "A rule-based tunnel in Go";
    changelog = "https://github.com/MetaCubeX/Clash.Meta/releases/tag/v${version}";
    license = licenses.gpl3;
  };
}

