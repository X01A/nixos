{ fetchFromGitHub, buildGoModule, lib }:

buildGoModule rec {
  pname = "clash-meta";
  version = "unstable-2023-04-29";
  src = fetchFromGitHub ({
    owner = "MetaCubeX";
    repo = "Clash.Meta";
    rev = "6ecd1c31e5ae292cd891421cdec7153c0b2e2a91";
    fetchSubmodules = true;
    sha256 = "sha256-chQnqQn5QMDM72V3tb2h6Ov0XBGMPjLiWVZotF8WorQ=";
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
  vendorSha256 = "sha256-jvl4dAP0EOl9p/3LPNLUqzg8H/mP7AKaI+lJ6ROo/1k=";

  meta = with lib; {
    homepage = "https://github.com/MetaCubeX/Clash.Meta";
    description = "A rule-based tunnel in Go";
    changelog = "https://github.com/MetaCubeX/Clash.Meta/releases/tag/v${version}";
    license = licenses.gpl3;
  };
}

