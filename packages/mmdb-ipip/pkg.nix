{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-10-08";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b293af972b96dd827fbe77f672bf6d7cb78614be";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-GUaBsI/lq+GbsfFL/tZDur0599lQVxJzUHZWOSEyyRs=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
