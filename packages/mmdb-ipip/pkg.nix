{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-07-13";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "87f716779dd45f7b9974b50155962009b180e3eb";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-GEvNESM4VjHEc+jl+v9bktgsYI/FsoVM47rZI7+mIko=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
