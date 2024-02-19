{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2024-02-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "49f9423ed68627aa001656da42bb3306379a2d46";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-60Ij2vsdfilgzvRVt7tFYrgDt9IV6oQ44yQenEJGyHk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
