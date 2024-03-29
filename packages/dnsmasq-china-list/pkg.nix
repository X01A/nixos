{ stdenvNoCC
, fetchFromGitHub
, defaultResolver ? "https://1.1.1.1/dns-query"
, chinaDns ? "114.114.114.114"
, ...
}:

stdenvNoCC.mkDerivation {
  pname = "dnsmasq-china-list";
  version = "0-unstable-2024-03-28";
  src = fetchFromGitHub ({
    owner = "felixonmars";
    repo = "dnsmasq-china-list";
    rev = "452a655e0b35f5e53d46caa352c915a707462b81";
    fetchSubmodules = true;
    sha256 = "sha256-gTjpuGk0wTe915IDAFqMKacdW8NuXea5WL7dwbXe97w=";
  });

  phases = "installPhase";
  installPhase = ''
    mkdir $out
    echo "${defaultResolver}" > $out/adguard.upstream
    cat $src/accelerated-domains.china.conf | sed -E "s#server=(\/.+\/)114\.114\.114\.114#[\1]${chinaDns}#g" >> $out/adguard.upstream

    cp $src/accelerated-domains.china.conf $out/
  '';
}
