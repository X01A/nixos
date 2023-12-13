{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-12-12";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "6c489edd1fa6fa3b91efb2819650abbefc9128d9";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-sqyQp9IIrB6kRJg7mXHXf6/o3t1btx1bNqQly0djwgw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
