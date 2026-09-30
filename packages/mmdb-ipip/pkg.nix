{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202609280549-unstable-2026-09-29";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "5773955c6f7de697b21359e3038365e538a03726";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-sbEaDzLdPP8JdTTJHoelFV9bKX5O9tncS03g3i66aQU=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
