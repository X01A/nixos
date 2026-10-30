{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202610260523-unstable-2026-10-29";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "3f6a459933f4a83433db26ec6b6dae53fb846fa5";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-RdNd7mQSW/Zt0ovhQA7Fm77v9qYVM4u6eZbSnwC+4Ys=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
