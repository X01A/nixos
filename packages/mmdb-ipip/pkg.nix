{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-08-24";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "372cbf746cacc4562a44e4676569af357d272c92";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-dFzsXNMmbcXCNmhHqpkehq6i8x4qMWASiVZ6HamRroM=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
