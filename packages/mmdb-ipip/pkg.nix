{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202403250310-unstable-2024-03-24";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "f706362646c9adc6794a594c66a24cf9f6bfa369";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-oweA4Pwu6RFef4mE5NJnI8Dau/JH3oZxjJQBKMRek6E=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
