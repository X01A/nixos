{ stdenvNoCC
, fetchFromGitHub
, defaultResolver ? "https://1.1.1.1/dns-query"
, chinaDns ? "114.114.114.114"
, ...
}:

stdenvNoCC.mkDerivation {
  pname = "dnsmasq-china-list";
  version = "0-unstable-2025-02-19";
  src = fetchFromGitHub ({
    owner = "felixonmars";
    repo = "dnsmasq-china-list";
    rev = "10cfb4bb952c713b8c3da3c65f2d37fd07093a76";
    fetchSubmodules = true;
    sha256 = "sha256-sgsXH+zYA5dP5znpkLn36l8nQDSYa4sxxitfkKLIUMU=";
  });

  phases = "installPhase";
  installPhase = ''
    mkdir $out
    echo "${defaultResolver}" > $out/adguard.upstream
    cat $src/accelerated-domains.china.conf | sed -E "s#server=(\/.+\/)114\.114\.114\.114#[\1]${chinaDns}#g" >> $out/adguard.upstream

    cp $src/accelerated-domains.china.conf $out/
  '';
}
