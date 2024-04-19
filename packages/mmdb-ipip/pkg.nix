{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202404150659-unstable-2024-04-18";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "6c86b0ecb3b68dacc85aaf46e668701390f7f764";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-ygHdJqYKnSMjws9lqlemYAbc+XxDt9QJwLIgMIbu6mA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
