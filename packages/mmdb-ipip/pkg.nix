{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-01-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "5604a266ffcfda0e437957b95662c4aff5684c8d";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-BHYoPMp9WZyL7WGgL7yugfRqyWV8byeS+GyZJKwVR58=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
