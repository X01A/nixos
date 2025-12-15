{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202512150303-unstable-2025-12-14";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b5b3143620bfc976cd11bf0139b4fa44e64877f0";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-SSaNFOIQ5/PkwdDCiyOAi+6fEYvj5do26196sGgQxmg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
