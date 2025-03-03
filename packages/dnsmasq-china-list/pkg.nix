{ stdenvNoCC
, fetchFromGitHub
, defaultResolver ? "https://1.1.1.1/dns-query"
, chinaDns ? "114.114.114.114"
, ...
}:

stdenvNoCC.mkDerivation {
  pname = "dnsmasq-china-list";
  version = "0-unstable-2025-03-02";
  src = fetchFromGitHub ({
    owner = "felixonmars";
    repo = "dnsmasq-china-list";
    rev = "b8c579b7dfefbf549c5aaab8fb6015cc78d8d298";
    fetchSubmodules = true;
    sha256 = "sha256-ywlfrIn2Ji/bXt/M+Ogf/vDeCbCsYJAdhlfQy9ih5ms=";
  });

  phases = "installPhase";
  installPhase = ''
    mkdir $out
    echo "${defaultResolver}" > $out/adguard.upstream
    cat $src/accelerated-domains.china.conf | sed -E "s#server=(\/.+\/)114\.114\.114\.114#[\1]${chinaDns}#g" >> $out/adguard.upstream

    cp $src/accelerated-domains.china.conf $out/
  '';
}
