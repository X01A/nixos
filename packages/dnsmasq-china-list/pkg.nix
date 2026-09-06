{
  stdenvNoCC,
  fetchFromGitHub,
  defaultResolver ? "https://1.1.1.1/dns-query",
  chinaDns ? "114.114.114.114",
  ...
}:

stdenvNoCC.mkDerivation {
  pname = "dnsmasq-china-list";
  version = "0-unstable-2026-09-05";
  src = fetchFromGitHub ({
    owner = "felixonmars";
    repo = "dnsmasq-china-list";
    rev = "c55bc322c2ebcb0e0d78614ef44951be629862ed";
    fetchSubmodules = true;
    sha256 = "sha256-UeiZ+xOF0FlH9Ic1xn6Tvkr9BH7Jm5YVQL/s6zxi3FM=";
  });

  phases = "installPhase";
  installPhase = ''
    mkdir $out
    echo "${defaultResolver}" > $out/adguard.upstream
    cat $src/accelerated-domains.china.conf | sed -E "s#server=(\/.+\/)114\.114\.114\.114#[\1]${chinaDns}#g" >> $out/adguard.upstream

    cp $src/accelerated-domains.china.conf $out/
  '';
}
