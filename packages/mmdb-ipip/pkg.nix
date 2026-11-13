{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202611090638-unstable-2026-11-12";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "db704c3a573d8ddd5d74ff46687a7dd116050304";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-X/1RJ6hl8Frmu2im/yDcMyGX2BOk3nvqrQ5FDwYQIpE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
