{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202410070311-unstable-2024-10-06";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "c00d551fdbb8c11d0da4c238d7413b4c9379152f";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-nhX+aPRwr9NrQTLJimExVbPA+7Je3VJIQZjJi5E8y1c=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
