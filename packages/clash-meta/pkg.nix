{ fetchFromGitHub, buildGo121Module, lib }:

buildGo121Module rec {
  pname = "clash-meta";
  version = "unstable-2024-01-09";
  src = fetchFromGitHub ({
    owner = "MetaCubeX";
    repo = "Clash.Meta";
    rev = "425bc692add830105198e03544f25344611af29e";
    fetchSubmodules = true;
    sha256 = "sha256-N4Ce7853cxNxTLWM3Qri/QFMO7v4K33nsgs/bSmeGV4=";
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
  vendorHash = "sha256-b7q0e3HHolVhwNJF0kwvwuVy8ndJLc0ITMl+0/YtSjA=";

  meta = with lib; {
    homepage = "https://github.com/MetaCubeX/Clash.Meta";
    description = "A rule-based tunnel in Go";
    changelog = "https://github.com/MetaCubeX/Clash.Meta/releases/tag/v${version}";
    license = licenses.gpl3;
    mainProgram = "mihomo";
  };
}

