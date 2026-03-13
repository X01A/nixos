{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202603090306-unstable-2026-03-12";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "d11f15d5123adddf81b4b35e256ba7cf4a87e850";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-pwVRtF+jWO6zr84NtG+P3WdH6rg3VaZ4mYh0hIW8MLk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
