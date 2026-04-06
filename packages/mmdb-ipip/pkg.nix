{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202604060314-unstable-2026-04-05";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "3d06056d07df3d747d271c575509609c039fdc34";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-msC8NZ+0111bFSqBSdVbWJ1lpF4quneZLp8HPjbzBJA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
