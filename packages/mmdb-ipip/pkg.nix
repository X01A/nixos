{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202603300313-unstable-2026-04-02";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "3e0c7dbda8c06a7c90e5fb7e588853e93773b307";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-W7RAkpqa2nT2hgBEvGdXUZYG55SHCP19q02qizy+vJw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
