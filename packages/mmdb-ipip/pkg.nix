{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-02-21";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "bbd030c824c6811a80cb4deb37a8dcd40cbe4259";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-5ormD8dFIE0YZJnQ818Yzq8AOII2d10URO0lHzhHhK0=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
