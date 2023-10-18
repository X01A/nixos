{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-10-17";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "72efef6687f2b04a71f6727d0c1ab6d7804e8a55";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-vOKcoNQ0js9DEQcJojZUPxbX1GLpN8M9xii3Ie7+txE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
