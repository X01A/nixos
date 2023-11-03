{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-11-02";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "8044c4ce73ea90cda7aae5156057e6a06f19ff0f";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Y2ekss75dIU9GeJMGNEAbd5fQDZrmi9dN4pSY8ed3mE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
