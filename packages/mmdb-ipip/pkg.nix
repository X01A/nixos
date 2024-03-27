{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202403250310-unstable-2024-03-26";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "9811893baee0a4839cb89294fda8ad7b725bdd21";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-4il0Y1C7WdXOPMcjjrHmb9JtxwXoJBYNqTN81zYeKvg=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
