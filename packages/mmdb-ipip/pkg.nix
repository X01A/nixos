{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-04-02";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "b2baa7dea4751723d34a8c2632d2e21d5e0cabee";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-7mCXcnqF/QrAw8/h8fjoeAzpkfBVHT47RdmhdiPZn3A=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
