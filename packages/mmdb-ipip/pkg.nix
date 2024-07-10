{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202407080310-unstable-2024-07-09";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "44c09b9c41c2db3c575469ad6cffc86fb67d2455";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-BkimIdkmBJNgtcl/D6kIHI0BGRMuUuaOmdFcKDlD+oo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
