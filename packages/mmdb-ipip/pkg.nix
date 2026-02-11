{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202602090309-unstable-2026-02-10";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ad3540d48df60b37a4c478415eeeb2ead31426a1";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-c52fp9ViY72JBAY+DLO95vj80zrqiB+/xGH6DUUtdQw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
