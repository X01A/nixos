# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl }:
{
  microsocks = {
    pname = "microsocks";
    version = "v1.0.2";
    src = fetchgit {
      url = "https://github.com/rofl0r/microsocks";
      rev = "v1.0.2";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1di11wx9ihwa0g9qzsqrb3ka2xxjb10fyc7hwjhn58mxdfwlavl0";
    };
  };
  wgcf = {
    pname = "wgcf";
    version = "v2.2.4";
    src = fetchgit {
      url = "https://github.com/ViRb3/wgcf";
      rev = "v2.2.4";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "16kjs517dms9ksmlac26hbp493za2fi435995w1vj2igkanjyyw7";
    };
  };
}
