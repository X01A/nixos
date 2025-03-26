{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202503240312-unstable-2025-03-25";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "03c7332be9bed5edc105c61448b638bf5f092bd9";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-cLcQrNVbbfSCS13EDt8C6hnioTfTIOJcZftC4d2wqFs=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
