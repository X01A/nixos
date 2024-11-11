{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202411110312-unstable-2024-11-10";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "236ce57aa318bee96009fd3c2057f9d0085d1bc8";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Qc5lICrx9uANsAnqBnItzViLkHfd0nWc3F+QB8HNqpk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
