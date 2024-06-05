{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202406030309-unstable-2024-06-04";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "8065e21e7be25ece02b5e5dac5bb34adf463dbea";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-eQxCS0KisCIsDz2xQFjvadNlz+aqZcnIfocx7Xqcx+U=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
