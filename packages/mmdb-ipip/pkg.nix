{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-01-28";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ab4835b06c1cbcf129599ac24b137e90fd520628";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-PnK4y6PwPL29X/ZN/MIxy7sDSew01JGNXel2FZVlyYU=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
