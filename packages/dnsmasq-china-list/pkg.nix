{
  stdenvNoCC,
  fetchFromGitHub,
  defaultResolver ? "https://1.1.1.1/dns-query",
  chinaDns ? "114.114.114.114",
  ...
}:

stdenvNoCC.mkDerivation {
  pname = "dnsmasq-china-list";
  version = "0-unstable-2026-05-27";
  src = fetchFromGitHub ({
    owner = "felixonmars";
    repo = "dnsmasq-china-list";
    rev = "3dcbc231722ab41c84e9f93eb759e0682155d55a";
    fetchSubmodules = true;
    sha256 = "sha256-YJt6LzRBA26UhBFDWx26eTSgJ0HJxEVZIGeOKbFPfek=";
  });

  phases = "installPhase";
  installPhase = ''
    mkdir $out
    echo "${defaultResolver}" > $out/adguard.upstream
    cat $src/accelerated-domains.china.conf | sed -E "s#server=(\/.+\/)114\.114\.114\.114#[\1]${chinaDns}#g" >> $out/adguard.upstream

    cp $src/accelerated-domains.china.conf $out/
  '';
}
