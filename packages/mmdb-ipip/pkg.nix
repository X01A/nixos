{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202406100310-unstable-2024-06-11";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "07d6b34122db69723b33aefb82ed8b0f08d2235f";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-7NvuACl8gLAKy7e22m0QicF1dr9ccnY8yuAtvMSEEXw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
