{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-05-25";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "0b58bd56c2d61e238a56a7d28e6c4b5459c437cf";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-7NtyGugQjieAX5ZkARyvS6CfRV3Irxf/O8jDVqfqjPY=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
