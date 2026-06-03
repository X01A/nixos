{
  stdenvNoCC,
  fetchFromGitHub,
  defaultResolver ? "https://1.1.1.1/dns-query",
  chinaDns ? "114.114.114.114",
  ...
}:

stdenvNoCC.mkDerivation {
  pname = "dnsmasq-china-list";
  version = "0-unstable-2026-06-02";
  src = fetchFromGitHub ({
    owner = "felixonmars";
    repo = "dnsmasq-china-list";
    rev = "c03be8e135d4ff0ba3fff9e1a454dd9dedd93b1c";
    fetchSubmodules = true;
    sha256 = "sha256-T+CCXzLF7jkpdAVf7N08UEVqNuWh/xru8S4NLPLShAo=";
  });

  phases = "installPhase";
  installPhase = ''
    mkdir $out
    echo "${defaultResolver}" > $out/adguard.upstream
    cat $src/accelerated-domains.china.conf | sed -E "s#server=(\/.+\/)114\.114\.114\.114#[\1]${chinaDns}#g" >> $out/adguard.upstream

    cp $src/accelerated-domains.china.conf $out/
  '';
}
