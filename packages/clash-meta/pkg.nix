{ fetchFromGitHub, buildGo121Module, lib }:

buildGo121Module rec {
  pname = "clash-meta";
  version = "1.18.3-unstable-2024-03-29";
  src = fetchFromGitHub ({
    owner = "MetaCubeX";
    repo = "Clash.Meta";
    rev = "72d094822423af389fb181d2b4570aeb9a336fec";
    fetchSubmodules = true;
    sha256 = "sha256-FJChQtXJ+YzKxwdi7+4UD8o+47ldb/6PKXWnbJ8Blbw=";
  });


  tags = [
    "with_gvisor"
    "with_low_memory"
  ];
  ldflags = [
    "-s"
    "-w"
    "-X github.com/Dreamacro/clash/constant.Version=${version}"
  ];

  doCheck = false;
  excludedPackages = [ "./test" ];
  vendorHash = "sha256-k4xB/jO78VGD+n9HtuoWXoXB+kZCEyPKJTTwj32nGIw=";

  meta = with lib; {
    homepage = "https://github.com/MetaCubeX/Clash.Meta";
    description = "A rule-based tunnel in Go";
    changelog = "https://github.com/MetaCubeX/Clash.Meta/releases/tag/v${version}";
    license = licenses.gpl3;
    mainProgram = "mihomo";
  };
}

