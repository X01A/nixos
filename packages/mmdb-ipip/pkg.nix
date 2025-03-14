{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202503100309-unstable-2025-03-13";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "8410f9eb30f2326611816ad12252e6ce2b2a3b72";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-WZSKKrD21dTDtC+NtBKTmRiRwhW5HgMSURkgObWQYdE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
