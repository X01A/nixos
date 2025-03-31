{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202503310311-unstable-2025-03-30";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "eddac66c6dab5244cef75f357566d1c9ad820bcc";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-1VmFn+PLSZymMQ+pil/goSlscTRsjdxm0EM8ZsvDZvI=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
