{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-07-30";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d92f5782247a8692225d0307f5b9b8c4ab432395";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-8pcUu2z6pcIU9SOh6DsmG7n2MEfwyCqqkojS1sEzoIo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
