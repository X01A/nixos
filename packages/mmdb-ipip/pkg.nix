{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202504070311-unstable-2025-04-08";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "dff74fc3b3b13ef401f3d33b0fc3dd78333cc033";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-vXtN5PtccdeEbY9kgSUFW9xrEje1talJpDStLWpmnlA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
