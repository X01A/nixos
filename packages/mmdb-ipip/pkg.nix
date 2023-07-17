{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-07-16";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "eed0d1fc7def9b91c75183f8b06ead5b7e4e162c";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-/QBgsf9UEnufjIf/Owt9SvX4c3IvaMg9xX2HF3zuEbE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
