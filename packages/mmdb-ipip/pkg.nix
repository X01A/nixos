{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202502240310-unstable-2025-02-25";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "f215693683c1ded2f3c3f9a46466bb72c6d86479";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-DkSm5Y9hmAjit38jvOZ3mK2yXeuY1b3aphlPyHRsGJk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
