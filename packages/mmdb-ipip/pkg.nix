{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202404220310-unstable-2024-04-23";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "c23fdc0041ed42632ba2b436bbf5a1bb5238d5eb";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-klwCzb2C9lvlTnDAaC9MgKborxVv8uEv88qHLAqz/Qk=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
