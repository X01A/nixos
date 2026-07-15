{
  stdenvNoCC,
  fetchFromGitHub,
  defaultResolver ? "https://1.1.1.1/dns-query",
  chinaDns ? "114.114.114.114",
  ...
}:

stdenvNoCC.mkDerivation {
  pname = "dnsmasq-china-list";
  version = "0-unstable-2026-07-14";
  src = fetchFromGitHub ({
    owner = "felixonmars";
    repo = "dnsmasq-china-list";
    rev = "5c4a617bb230e27716d608288eb8d6367ae5b3f5";
    fetchSubmodules = true;
    sha256 = "sha256-BE2XksSMQrVNcqVahvmdmO65GkqgvMSpjBi6mfYyulw=";
  });

  phases = "installPhase";
  installPhase = ''
    mkdir $out
    echo "${defaultResolver}" > $out/adguard.upstream
    cat $src/accelerated-domains.china.conf | sed -E "s#server=(\/.+\/)114\.114\.114\.114#[\1]${chinaDns}#g" >> $out/adguard.upstream

    cp $src/accelerated-domains.china.conf $out/
  '';
}
