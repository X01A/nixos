{ fetchFromGitHub, buildGo121Module, lib }:

buildGo121Module rec {
  pname = "clash-meta";
  version = "Prerelease-Alpha-unstable-2024-04-18";
  src = fetchFromGitHub ({
    owner = "MetaCubeX";
    repo = "Clash.Meta";
    rev = "d4ececae20eda1f61f0ee87021756c81b54e4251";
    fetchSubmodules = true;
    sha256 = "sha256-VnzoJTugf/OUyA2HzCc506rQvPjwT7aK2Wx2fiQ9los=";
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
  vendorHash = "sha256-bcaNTPtoCkvmPvvj50rE3539+ux3LcLbrR9CVBysL6I=";

  meta = with lib; {
    homepage = "https://github.com/MetaCubeX/Clash.Meta";
    description = "A rule-based tunnel in Go";
    changelog = "https://github.com/MetaCubeX/Clash.Meta/releases/tag/v${version}";
    license = licenses.gpl3;
    mainProgram = "mihomo";
  };
}

