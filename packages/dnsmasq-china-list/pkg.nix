{ stdenvNoCC
, fetchFromGitHub
, defaultResolver ? "https://1.1.1.1/dns-query"
, chinaDns ? "114.114.114.114"
, ...
}:

stdenvNoCC.mkDerivation {
  pname = "dnsmasq-china-list";
  version = "0-unstable-2024-11-23";
  src = fetchFromGitHub ({
    owner = "felixonmars";
    repo = "dnsmasq-china-list";
    rev = "a01bda7597d2d54627bf865d1b1eaa4a992a5cb3";
    fetchSubmodules = true;
    sha256 = "sha256-oAe93QMpThZyA0Ff7dxlp7AJqGbJGTFrkbdmep4k8PU=";
  });

  phases = "installPhase";
  installPhase = ''
    mkdir $out
    echo "${defaultResolver}" > $out/adguard.upstream
    cat $src/accelerated-domains.china.conf | sed -E "s#server=(\/.+\/)114\.114\.114\.114#[\1]${chinaDns}#g" >> $out/adguard.upstream

    cp $src/accelerated-domains.china.conf $out/
  '';
}
