{ fetchFromGitHub, buildGo121Module, lib }:

buildGo121Module rec {
  pname = "clash-meta";
  version = "1.18.8-unstable-2024-09-02";
  src = fetchFromGitHub ({
    owner = "MetaCubeX";
    repo = "Clash.Meta";
    rev = "43f21c0b412b7a8701fe7a2ea6510c5b985a53d6";
    fetchSubmodules = true;
    sha256 = "sha256-UImkDjfNbC59SkoR0SsmlxGO5UPjMA0IURj+2+zgsVQ=";
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
  vendorHash = "sha256-Lrd+og6bOopbV/JDwfWY4X+D/2iOCMgDA+JlHJlxwXE=";

  meta = with lib; {
    homepage = "https://github.com/MetaCubeX/Clash.Meta";
    description = "A rule-based tunnel in Go";
    changelog = "https://github.com/MetaCubeX/Clash.Meta/releases/tag/v${version}";
    license = licenses.gpl3;
    mainProgram = "mihomo";
  };
}

