{ fetchFromGitHub, buildGo121Module, lib }:

buildGo121Module rec {
  pname = "clash-meta";
  version = "Prerelease-Alpha-unstable-2024-09-03";
  src = fetchFromGitHub ({
    owner = "MetaCubeX";
    repo = "Clash.Meta";
    rev = "faaa90f8a621499ba86f8734a05bb80edb38ada9";
    fetchSubmodules = true;
    sha256 = "sha256-DFDyQCmZau9UMSo01bXaGOYtZ/pSZLiK7lWnDY0e6MU=";
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

