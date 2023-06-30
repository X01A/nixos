{ fetchFromGitHub, buildGo120Module, lib }:

buildGo120Module rec {
  pname = "clash-meta";
  version = "unstable-2023-06-30";
  src = fetchFromGitHub ({
    owner = "MetaCubeX";
    repo = "Clash.Meta";
    rev = "57db8dfe239d056c7f0020549218fb7ac201aa1a";
    fetchSubmodules = true;
    sha256 = "sha256-OGy0fKkD6zfP1EMYgMMal9jeHVExfhTric9bEiH+Gek=";
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
  vendorSha256 = "sha256-DigKtUqFx4ljnIS4sQgkH8qvGvT06Q4FnrICzl8YYsY=";

  meta = with lib; {
    homepage = "https://github.com/MetaCubeX/Clash.Meta";
    description = "A rule-based tunnel in Go";
    changelog = "https://github.com/MetaCubeX/Clash.Meta/releases/tag/v${version}";
    license = licenses.gpl3;
  };
}

