{
  stdenvNoCC,
  fetchFromGitHub,
  defaultResolver ? "https://1.1.1.1/dns-query",
  chinaDns ? "114.114.114.114",
  ...
}:

stdenvNoCC.mkDerivation {
  pname = "dnsmasq-china-list";
  version = "0-unstable-2026-07-31";
  src = fetchFromGitHub ({
    owner = "felixonmars";
    repo = "dnsmasq-china-list";
    rev = "d65b2f85a21b803df49d3f9bd8255b522f5fddcd";
    fetchSubmodules = true;
    sha256 = "sha256-P28Y7rTnMFiD7+hjSJUFpNTIUdsQgwxXVB2g/IJtyoY=";
  });

  phases = "installPhase";
  installPhase = ''
    mkdir $out
    echo "${defaultResolver}" > $out/adguard.upstream
    cat $src/accelerated-domains.china.conf | sed -E "s#server=(\/.+\/)114\.114\.114\.114#[\1]${chinaDns}#g" >> $out/adguard.upstream

    cp $src/accelerated-domains.china.conf $out/
  '';
}
