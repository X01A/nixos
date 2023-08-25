{ fetchFromGitHub, buildGo120Module, lib }:

buildGo120Module rec {
  pname = "clash-meta";
  version = "unstable-2023-08-24";
  src = fetchFromGitHub ({
    owner = "MetaCubeX";
    repo = "Clash.Meta";
    rev = "0a7b7894bd450bf9c262fb1ea891efd1a71f5979";
    fetchSubmodules = true;
    sha256 = "sha256-8y2svkWD2KSWdJJPUo1ZoH+2qaCjOjb1GXE61K8CJns=";
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
  vendorSha256 = "sha256-XD+nVaVcI4dizQdYyQ7q9+gpwFtmz3PdAuevXYJZ5Z4=";

  meta = with lib; {
    homepage = "https://github.com/MetaCubeX/Clash.Meta";
    description = "A rule-based tunnel in Go";
    changelog = "https://github.com/MetaCubeX/Clash.Meta/releases/tag/v${version}";
    license = licenses.gpl3;
  };
}

