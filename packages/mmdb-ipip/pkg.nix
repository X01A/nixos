{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-06-13";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "2a4ccf0d852b061b746502974507331eef4150ed";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-Ji2o3ILRub7CW0TMaGfJJSE8BPYSE7aZdQZtfva3JLo=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
