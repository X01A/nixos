# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl }:
{
  chia-plotter = {
    pname = "chia-plotter";
    version = "8332d625220b9a54c097d85d6eb4c6b0c9464214";
    src = fetchgit {
      url = "https://github.com/madMAx43v3r/chia-plotter";
      rev = "8332d625220b9a54c097d85d6eb4c6b0c9464214";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "037n54hff2zspn8ra7lqx0b9h7r2vr9qz62v9ppyfbm2cpc06qrm";
    };
  };
  cloudreve = {
    pname = "cloudreve";
    version = "3.3.2";
    src = fetchurl {
      url = "https://github.com/cloudreve/Cloudreve/releases/download/3.3.2/cloudreve_3.3.2_linux_amd64.tar.gz";
      sha256 = "1iq4dj5hr2zxji7nhrx7yn1wc72ssx3lyhclipfggap3f7zlk5l0";
    };
  };
  cloudreve-cli = {
    pname = "cloudreve-cli";
    version = "306ddc5d939004d263641bbff37b3398843eab92";
    src = fetchgit {
      url = "https://github.com/Indexyz/CloudreveCLI";
      rev = "306ddc5d939004d263641bbff37b3398843eab92";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "07npxyn9zkk4am06wyqdblpdw126501fs6pa4ff37jv133s1yqvd";
    };
  };
  desktop-icons-ng = {
    pname = "desktop-icons-ng";
    version = "0a015310cdc07660e276e340c46a9e881e2fe6eb";
    src = fetchgit {
      url = "https://gitlab.com/rastersoft/desktop-icons-ng.git";
      rev = "0a015310cdc07660e276e340c46a9e881e2fe6eb";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1m79p5w4pqh0z9y9wc99rcc76g6d8xh3spj5jh0y0smgva0shwfv";
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
  ksmbd = {
    pname = "ksmbd";
    version = "b8ee38069107e3fee7e0da43f8cd3753c81b620b";
    src = fetchgit {
      url = "https://github.com/namjaejeon/ksmbd";
      rev = "b8ee38069107e3fee7e0da43f8cd3753c81b620b";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0pdh1ql61ijq8jcv3w6i3yj6fi6xk4202fbs129kz3cqrz78vrc7";
    };
  };
  ksmbd-tools = {
    pname = "ksmbd-tools";
    version = "35e939b0dd4db6cfe0886320221729e55e1aa1b9";
    src = fetchgit {
      url = "https://github.com/namjaejeon/ksmbd-tools";
      rev = "35e939b0dd4db6cfe0886320221729e55e1aa1b9";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0gk17m4bjrjrzd9dmm5jjwzp0qrjfh6rfkl9zyigsg95xi8p6syp";
    };
  };
  mattermost = {
    pname = "mattermost";
    version = "6.0.1";
    src = fetchurl {
      url = "https://releases.mattermost.com/6.0.1/mattermost-6.0.1-linux-amd64.tar.gz";
      sha256 = "0zi8v7cxxl4qg8cyrgxs64mrbi1hcc7wwsscj931hfynrz3x0np0";
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
    version = "40c424fdb51f0bc5fb88c592b34cba0809993769";
    src = fetchgit {
      url = "https://github.com/alecthw/mmdb_china_ip_list.git";
      rev = "40c424fdb51f0bc5fb88c592b34cba0809993769";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1a0icshszy4zj57sy3sqjxssk79xyymwvzr9kb36m69i23pick74";
    };
  };
  motrix = {
    pname = "motrix";
    version = "1.6.11";
    src = fetchurl {
      url = "https://github.com/agalwood/Motrix/releases/download/v1.6.11/Motrix-1.6.11.AppImage";
      sha256 = "0hsazragk4hf9hh1i1hnqhw48kl3f3sckapwzah06w9ysgn90kdl";
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
    version = "v0.11.1";
    src = fetchgit {
      url = "https://github.com/loki-47-6F-64/sunshine";
      rev = "v0.11.1";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1lgczf3hjckr5r44mvka6jnha5ja2mpj72bwjqfyf61vkhg0gd32";
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
  vouch = {
    pname = "vouch";
    version = "v0.35.1";
    src = fetchgit {
      url = "https://github.com/vouch/vouch-proxy";
      rev = "v0.35.1";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1j425hfji5f2ki9s049b8z0si31jdkh9smhhvmxp1jn2d3qzm9vl";
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
    version = "v2.2.9";
    src = fetchgit {
      url = "https://github.com/ViRb3/wgcf";
      rev = "v2.2.9";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0982lj174q5y6h8k3dj939ki79r6ym34rma0f4sihqjgl3pwlqjj";
    };
  };
  winbox = {
    pname = "winbox";
    version = "3.31";
    src = fetchurl {
      url = "https://download.mikrotik.com/winbox/3.31/winbox64.exe";
      sha256 = "0pnrp6g6ff1lygqjdkjvsxds74q8z08w85ll3xqshqf2crkr2kk8";
    };
  };
  wiretrustee = {
    pname = "wiretrustee";
    version = "v0.2.0-beta.1";
    src = fetchgit {
      url = "https://github.com/wiretrustee/wiretrustee";
      rev = "v0.2.0-beta.1";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "13zn8544vj9ag2nws02zm4bm5f2mkargc3i0p0d3n9q2zlpc3q4c";
    };
  };
  yacd = {
    pname = "yacd";
    version = "v0.3.3";
    src = fetchurl {
      url = "https://github.com/haishanh/yacd/releases/download/v0.3.3/yacd.tar.xz";
      sha256 = "1f5qdj22wplj5xw2hp9r8acq740csv4n4viwb39cyk77baxq8bvl";
    };
  };
  yesplaymusic = {
    pname = "yesplaymusic";
    version = "0.4.2";
    src = fetchurl {
      url = "https://github.com/qier222/YesPlayMusic/releases/download/v0.4.2/YesPlayMusic-0.4.2.AppImage";
      sha256 = "015qk82spzar89p3kbkg3al1hssyda2a9ha50cp0bhxr5jqvf5rs";
    };
  };
}
