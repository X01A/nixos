{ fetchFromGitHub, buildGoModule, lib }:

buildGoModule rec {
  pname = "clash-meta";
  version = "unstable-2023-04-17";
  src = fetchFromGitHub ({
    owner = "MetaCubeX";
    repo = "Clash.Meta";
    rev = "f100ce6a04818e1aad53b7854c93bb85d2442353";
    fetchSubmodules = true;
    sha256 = "sha256-FGmUzv9Ae2dn6vqlAXcpM5xs1K8P4tGn5tchl7N2rqg=";
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
  vendorSha256 = "sha256-D6b0U04wwDUzeIu3//E10YehohTzvyHWtK5Yzf3xrAI=";

  meta = with lib; {
    homepage = "https://github.com/MetaCubeX/Clash.Meta";
    description = "A rule-based tunnel in Go";
    changelog = "https://github.com/MetaCubeX/Clash.Meta/releases/tag/v${version}";
    license = licenses.gpl3;
  };
}

