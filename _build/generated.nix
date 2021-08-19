# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl }:
{
  chia-plotter = {
    pname = "chia-plotter";
    version = "974d6e5f1440f68c48492122ca33828a98864dfc";
    src = fetchgit {
      url = "https://github.com/madMAx43v3r/chia-plotter";
      rev = "974d6e5f1440f68c48492122ca33828a98864dfc";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0dliswvqmi3wq9w8jp0sb0z74n5k37608sig6r60z206g2bwhjja";
    };

  };
  cloudreve = {
    pname = "cloudreve";
    version = "3.3.2";
    src = fetchurl {
      sha256 = "1iq4dj5hr2zxji7nhrx7yn1wc72ssx3lyhclipfggap3f7zlk5l0";
      url = "https://github.com/cloudreve/Cloudreve/releases/download/3.3.2/cloudreve_3.3.2_linux_amd64.tar.gz";
    };

  };
  cloudreve-cli = {
    pname = "cloudreve-cli";
    version = "456d8c4403efea11e4584067419f8f20a8682e06";
    src = fetchgit {
      url = "https://github.com/Indexyz/CloudreveCLI";
      rev = "456d8c4403efea11e4584067419f8f20a8682e06";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0dxhwaxrzg5vqgyh0cy4g68r5xsdn0489k92b2ypclg5paq1zrci";
    };

  };
  desktop-icons-ng = {
    pname = "desktop-icons-ng";
    version = "ce0578241eaa78a8013a41b35ab37b5b1a037cbf";
    src = fetchgit {
      url = "https://gitlab.com/rastersoft/desktop-icons-ng.git";
      rev = "ce0578241eaa78a8013a41b35ab37b5b1a037cbf";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "112ia0i2kc421i3cpayxabixz72yajg2zx8nnil27kh342ivkjck";
    };

  };
  drone-runner-docker = {
    pname = "drone-runner-docker";
    version = "v1.6.3";
    src = fetchgit {
      url = "https://github.com/drone-runners/drone-runner-docker";
      rev = "v1.6.3";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1r3nmm7n7y9z1n5z0nzy1vqqx3897q10hc740k4fn4bs9fpyk3aq";
    };

  };
  drone-runner-exec = {
    pname = "drone-runner-exec";
    version = "v1.0.0-beta.9";
    src = fetchgit {
      url = "https://github.com/drone-runners/drone-runner-exec";
      rev = "v1.0.0-beta.9";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1ay4vla54hrc3ranyc6whpqh0r1nynjg6x2ab1z1259ry9xzm4xs";
    };

  };
  fcitx5-material-color = {
    pname = "fcitx5-material-color";
    version = "0.2.1";
    src = fetchgit {
      url = "https://github.com/hosxy/Fcitx5-Material-Color";
      rev = "0.2.1";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0drdypjf1njl7flkb5d581vchwlp4gaqyws3cp0v874wkwh4gllb";
    };

  };
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
  mmdb-ipip = {
    pname = "mmdb-ipip";
    version = "30455f35da5a19b94cfb5ee0b944dbb063ceaf5a";
    src = fetchgit {
      url = "https://github.com/alecthw/mmdb_china_ip_list.git";
      rev = "30455f35da5a19b94cfb5ee0b944dbb063ceaf5a";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0vzfcck22m75hbw0vvvg03al0l6x298kafg30jvyi3m7j832b6jf";
    };

  };
  motrix = {
    pname = "motrix";
    version = "1.6.11";
    src = fetchurl {
      sha256 = "0hsazragk4hf9hh1i1hnqhw48kl3f3sckapwzah06w9ysgn90kdl";
      url = "https://github.com/agalwood/Motrix/releases/download/v1.6.11/Motrix-1.6.11.AppImage";
    };

  };
  nali = {
    pname = "nali";
    version = "v0.3.1";
    src = fetchgit {
      url = "https://github.com/zu1k/nali";
      rev = "v0.3.1";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0ra405s878cvd0p5wdi45sm3bkhhz3lhhhi7lgzsr5vijdr44dgn";
    };

  };
  onedev = {
    pname = "onedev";
    version = "v4.9.4";
    src = fetchgit {
      url = "https://github.com/theonedev/onedev";
      rev = "v4.9.4";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1cm8fl2fqxz0lzajran5nj2yba8h9wiyi985swbra6v6my4cfwzv";
    };

  };
  openwhisk-cli = {
    pname = "openwhisk-cli";
    version = "1.2.0";
    src = fetchgit {
      url = "https://github.com/apache/openwhisk-cli";
      rev = "1.2.0";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "12v5mr5wkbvj66f2pp9k73dfgsjlpi2aq4xi769wpdkqwd31zns9";
    };

  };
  sunshine = {
    pname = "sunshine";
    version = "v0.9.0";
    src = fetchgit {
      url = "https://github.com/loki-47-6F-64/sunshine";
      rev = "v0.9.0";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1nqaxf246zihakljg3dd7kzpg0wbrcvsxyqy9z2dxjzx2fq917jj";
    };

  };
  tifig = {
    pname = "tifig";
    version = "60b920c06fdf1240936ef73668b03457ebb8e813";
    src = fetchgit {
      url = "https://github.com/monostream/tifig";
      rev = "60b920c06fdf1240936ef73668b03457ebb8e813";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "05czqkcyq7yiwdg96q9qdm43l2a5d6asdfddvj7h5af73chmp4gi";
    };

  };
  vpncloud = {
    pname = "vpncloud";
    version = "v2.2.0";
    src = fetchgit {
      url = "https://github.com/dswd/vpncloud";
      rev = "v2.2.0";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0khq52ks0irfzr56yy73kydpba8na61skfx2c2wdjr2zscvh6l8r";
    };

  };
  wgcf = {
    pname = "wgcf";
    version = "v2.2.6";
    src = fetchgit {
      url = "https://github.com/ViRb3/wgcf";
      rev = "v2.2.6";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1wa4bkzggm80v6ddascrw88zfll0xwh3yfd5svbrxsf7a5cyp6x2";
    };

  };
  winbox = {
    pname = "winbox";
    version = "3.28";
    src = fetchurl {
      sha256 = "0ygrn9cq9sc4qw5rard10jwcv079md2vzs401w413j5pni0dwiar";
      url = "https://download.mikrotik.com/winbox/3.28/winbox64.exe";
    };

  };
  yacd = {
    pname = "yacd";
    version = "v0.3.3";
    src = fetchurl {
      sha256 = "1f5qdj22wplj5xw2hp9r8acq740csv4n4viwb39cyk77baxq8bvl";
      url = "https://github.com/haishanh/yacd/releases/download/v0.3.3/yacd.tar.xz";
    };

  };
  yesplaymusic = {
    pname = "yesplaymusic";
    version = "0.4.0";
    src = fetchurl {
      sha256 = "1dx0127xr0mlkskvspqmdbl0q1ysdxbdjf17d7mwkzxsrbky6xi1";
      url = "https://github.com/qier222/YesPlayMusic/releases/download/v0.4.0/YesPlayMusic-0.4.0.AppImage";
    };

  };
}
