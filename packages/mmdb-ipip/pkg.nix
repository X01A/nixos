{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "mmdb-ipip";
  version = "202604270319-unstable-2026-04-30";
  src = fetchgit {
    url = "https://github.com/alecthw/mmdb_china_ip_list.git";
    rev = "286f750bd8a685a5eef18c3ca4f966cd08735610";
    fetchSubmodules = true;
    deepClone = false;
    leaveDotGit = false;
    sha256 = "sha256-LlpLxmPAMTWMIPCOL40jf9gTuPx7aYzKQ2Mz3NFYOMU=";
  };
  installPhase = ''
    install -m 755 Country.mmdb $out
  '';
}
