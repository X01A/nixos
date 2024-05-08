{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202405060310-unstable-2024-05-07";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "953b0d28d467c8b8463c531361b3ebeaaed11ca8";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-c7F8rC+/YFXdkb7wSpqa+ipdcXYcRcfiO/saXYHFsfw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
