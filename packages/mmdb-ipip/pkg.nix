{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-04-04";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "ae4230c150226cb42ce3e540c64c19d92b9078ab";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-l9QUmbvYl1UEw7xerYKEWp7ITeFbdAnrWYPsetdcO9U=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
