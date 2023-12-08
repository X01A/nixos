{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-12-07";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "9deecbbbf5610ffda2980d7f990e37950980ea8b";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-mPZx7iuxbl8pW7YZ/fmoUNMfpRlCfj7FWxRiYbkhGLc=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
