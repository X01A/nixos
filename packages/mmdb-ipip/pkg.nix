{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "unstable-2023-06-11";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "08a58448dd2bfe1aa6dfe1debe817ef8f99a2fa6";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-jBq/thAZQND/GHA9I2ZQ0tQEr1RLcXn6aKYITE4WXRw=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
