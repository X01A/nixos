# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl }:
{
  chia-plotter = {
    pname = "chia-plotter";
    version = "a9f35cd605517a8c134e7bb4e2af88dd3d3ac236";
    src = fetchgit {
      url = "https://github.com/madMAx43v3r/chia-plotter";
      rev = "a9f35cd605517a8c134e7bb4e2af88dd3d3ac236";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0c3qxd1r61kwxzmfjcqpyxdjyim5f6rhsm42gfd3p3qkxmr6mvpc";
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
    version = "209726cf96d96775fac0deb7931f83c14ad0aa27";
    src = fetchgit {
      url = "https://gitlab.com/rastersoft/desktop-icons-ng.git";
      rev = "209726cf96d96775fac0deb7931f83c14ad0aa27";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0za32my01wsmwrkzlym2mig25fi8pcqmpjx7mjw3w8bwa41fgjl6";
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
    version = "6cfe37c64c988092f1f51f8ead74c6f93144dfd6";
    src = fetchgit {
      url = "https://github.com/alecthw/mmdb_china_ip_list.git";
      rev = "6cfe37c64c988092f1f51f8ead74c6f93144dfd6";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1bpw3kdyv1v44c9zsgk6i3i10bhz0mihb73dpqxrs4zzckiazip4";
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
    version = "v5.0.1";
    src = fetchgit {
      url = "https://github.com/theonedev/onedev";
      rev = "v5.0.1";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1rxmg0v8y53zjj21bkrlbkfpyfcpahzlbxsfci00n5g7xkrp1wnn";
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
    version = "v0.10.1";
    src = fetchgit {
      url = "https://github.com/loki-47-6F-64/sunshine";
      rev = "v0.10.1";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0hwb0kadjw9kzlxb6izrbwcbn1xqs2djdm4p7gym9si1snix171v";
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
    version = "v2.2.8";
    src = fetchgit {
      url = "https://github.com/ViRb3/wgcf";
      rev = "v2.2.8";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0fhvdk43vyn1nj5sr96hi5l468qi9dilq1kp01lhzhf4dvyzhx2n";
    };

  };
  winbox = {
    pname = "winbox";
    version = "3.31";
    src = fetchurl {
      sha256 = "0pnrp6g6ff1lygqjdkjvsxds74q8z08w85ll3xqshqf2crkr2kk8";
      url = "https://download.mikrotik.com/winbox/3.31/winbox64.exe";
    };

  };
  wiretrustee = {
    pname = "wiretrustee";
    version = "v0.1.0-beta.3";
    src = fetchgit {
      url = "https://github.com/wiretrustee/wiretrustee";
      rev = "v0.1.0-beta.3";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1i52zm660561mbhibwd3adgh8g4ql3m7hrgjndv23j2vn2vz12bp";
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
    version = "0.4.1";
    src = fetchurl {
      sha256 = "0bqybqkikr82mbwkyfb1ld6n9mi4mgcfcsry5jxxas15lraszx8d";
      url = "https://github.com/qier222/YesPlayMusic/releases/download/v0.4.1/YesPlayMusic-0.4.1.AppImage";
    };

  };
}
