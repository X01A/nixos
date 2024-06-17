{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202406170311-unstable-2024-06-16";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "c704831c04e1f01ace66976e75e0715505f9fe94";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-0Sbx6wPv28w97pcfL/bS52d4IQyxmI5hfSiBCD4YyQk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
