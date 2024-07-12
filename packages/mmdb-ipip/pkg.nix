{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202407080310-unstable-2024-07-11";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "5ff5a6d868d35adb7062f2034ded705560137ef0";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-sasrvGw3YfQI9+pT4wt35PD+88DnniY3FskpjCHtcg0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
