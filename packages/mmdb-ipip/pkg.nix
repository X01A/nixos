{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202405200309-unstable-2024-05-21";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "35357dd9ef2f7d145798bb4f0018bf1be21cb0f7";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-ajHR0u7+3+VWf2DqItQovY9W8dKfAS355kkK/8ICTiA=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
