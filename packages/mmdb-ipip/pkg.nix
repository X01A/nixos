{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-01-30";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "133e9249147edd9bfb21844d9faac6f74dcb75bd";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-p+uTsy60t9TVeCNcjZJKoCG4SZyy0/oZ6yXqV+yyY1I=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
