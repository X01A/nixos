{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-05-21";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "9acb9632d492ffd47f1a9bada178b4b1a50404e1";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-4ZPN5YXoA5ehqQZuaDfibAl6xtoAXDOCn8C7gqcnWNg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
