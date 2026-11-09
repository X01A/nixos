{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202611090638-unstable-2026-11-08";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "5ccc1d7197f7496cfc096ffaa2f5559b34e27943";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-fi49Bk7zwKKhYDo3FGkwLpMLm/7gDJ+ZWFRel7mv7EE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
