{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-03-09";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ee68c9b72c524c4e229de212ae0befa890bf67b1";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-VQATWXOWEB0yIbuefwZ5c6OVAVplOnqycQqorUdFxJk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
