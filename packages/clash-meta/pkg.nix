{ fetchFromGitHub, buildGo121Module, lib }:

buildGo121Module rec {
  pname = "clash-meta";
  version = "Prerelease-Alpha-unstable-2024-06-19";
  src = fetchFromGitHub ({
    owner = "MetaCubeX";
    repo = "Clash.Meta";
    rev = "917c5fdd80e760603650181190fa3c763a039622";
    fetchSubmodules = true;
    sha256 = "sha256-55/nGh49GgcAYKETsDQqE6Mrr0SI95ZbR3N+CjtP3cM=";
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
  vendorHash = "sha256-KVQnbIi0CcvfbMVgwGnBAHaNKPOiFRd1GV27NPHgF5o=";

  meta = with lib; {
    homepage = "https://github.com/MetaCubeX/Clash.Meta";
    description = "A rule-based tunnel in Go";
    changelog = "https://github.com/MetaCubeX/Clash.Meta/releases/tag/v${version}";
    license = licenses.gpl3;
    mainProgram = "mihomo";
  };
}

