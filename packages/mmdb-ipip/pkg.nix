{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-07-27";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "1c46eb416ef4d9daa10ff67dca2fe096ab93fdd4";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-RnEyOm9BNVDqa1dfbtsX0ZD146FcE7EF+CuqgQzyI60=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
