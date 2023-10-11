{ stdenvNoCC
, fetchFromGitHub
, defaultResolver ? "https://1.1.1.1/dns-query"
, chinaDns ? "114.114.114.114"
, ...
}:

stdenvNoCC.mkDerivation {
  pname = "dnsmasq-china-list";
  version = "unstable-2023-10-10";
  src = fetchFromGitHub ({
    owner = "felixonmars";
    repo = "dnsmasq-china-list";
    rev = "f310028cd5ce37d28c9d2f680e32658295e1eab1";
    fetchSubmodules = true;
    sha256 = "sha256-x4PE3pD4do/+xuW2jtTPgzIm5KjVMCZWpejGwU6fNy4=";
  });

  phases = "installPhase";
  installPhase = ''
    mkdir $out
    echo "${defaultResolver}" > $out/adguard.upstream
    cat $src/accelerated-domains.china.conf | sed -E "s#server=(\/.+\/)114\.114\.114\.114#[\1]${chinaDns}#g" >> $out/adguard.upstream

    cp $src/accelerated-domains.china.conf $out/
  '';
}
