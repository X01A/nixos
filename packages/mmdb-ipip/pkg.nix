{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202411110312-unstable-2024-11-12";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "4d96bee6662809b0ba618e24b941ea8f29d0f810";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-CdWH4/FadDm7GZIPTAWa7aU98ZTiwmHIEzzi9TsvcRs=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
