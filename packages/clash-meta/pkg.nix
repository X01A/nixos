{ fetchFromGitHub, buildGo121Module, lib }:

buildGo121Module rec {
  pname = "clash-meta";
  version = "unstable-2024-02-14";
  src = fetchFromGitHub ({
    owner = "MetaCubeX";
    repo = "Clash.Meta";
    rev = "080d316059d9bceff569370f36c19f3de570ec5b";
    fetchSubmodules = true;
    sha256 = "sha256-00t/h3i5MdFNHfV9FGZfXOyIJXkFQyw9HojhV9Docpk=";
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
  vendorHash = "sha256-xBUYk/axSg+d9yy2l12ACw2ns2qUmlBWOf8/+5xuAno=";

  meta = with lib; {
    homepage = "https://github.com/MetaCubeX/Clash.Meta";
    description = "A rule-based tunnel in Go";
    changelog = "https://github.com/MetaCubeX/Clash.Meta/releases/tag/v${version}";
    license = licenses.gpl3;
    mainProgram = "mihomo";
  };
}

