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
    version = "v2.2.5";
    src = fetchgit {
      url = "https://github.com/ViRb3/wgcf";
      rev = "v2.2.5";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0vvjywsigh9j669zd2blsnhlz5kjv4j39g33hclj2a7i44dwg13h";
    };
  };
  yacd = {
    pname = "yacd";
    version = "v0.3.2";
    src = fetchgit {
      url = "https://github.com/haishanh/yacd";
      rev = "v0.3.2";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1jamzci2d2q3cbanbbjgyv83kc3mgr3sm86wzgl2li9ig3b6cqkz";
    };
  };
}
