{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-02-12";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "5927e18ec26ec14777c43f4db70fd18004155f97";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-T1HcwzBlw7HKNxBmPZlXSF8obJwTLNS2m0LhMfSSLCE=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
