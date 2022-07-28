# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub }:
{
  clash-premium = {
    pname = "clash-premium";
    version = "2022.07.07";
    src = fetchurl {
      url = "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-2022.07.07.gz";
      sha256 = "sha256-JmGP9ziouzSQFI1kvpM+ejmQibKP8UNPDXhmNkBCWi8=";
    };
  };
  cloudreve = {
    pname = "cloudreve";
    version = "3.5.3";
    src = fetchurl {
      url = "https://github.com/cloudreve/Cloudreve/releases/download/3.5.3/cloudreve_3.5.3_linux_amd64.tar.gz";
      sha256 = "sha256-RGlo99nmffTNc85syPGY7VIkCRPqDrN+KC2oMoBWGDQ=";
    };
  };
  commit-notifier = {
    pname = "commit-notifier";
    version = "573c1eb7eabc97aa06e0e9ad85f5148110749876";
    src = fetchFromGitHub ({
      owner = "linyinfeng";
      repo = "commit-notifier";
      rev = "573c1eb7eabc97aa06e0e9ad85f5148110749876";
      fetchSubmodules = true;
      sha256 = "sha256-JiLwijB+Zqe5JgKLncr7r4w1lpDRWWVh9TAl+9nOiCo=";
    });
    cargoLock."Cargo.lock" = {
      lockFile = ./commit-notifier-573c1eb7eabc97aa06e0e9ad85f5148110749876/Cargo.lock;
      outputHashes = { };
    };
  };
  drone-runner-docker = {
    pname = "drone-runner-docker";
    version = "v1.8.2";
    src = fetchFromGitHub ({
      owner = "drone-runners";
      repo = "drone-runner-docker";
      rev = "v1.8.2";
      fetchSubmodules = true;
      sha256 = "sha256-ZpkVfzqeltZSYrKYB6dXtlVjl1uFpQdl2fa+c5ApiW4=";
    });
  };
  drone-runner-exec = {
    pname = "drone-runner-exec";
    version = "v1.0.0-beta.10";
    src = fetchFromGitHub ({
      owner = "drone-runners";
      repo = "drone-runner-exec";
      rev = "v1.0.0-beta.10";
      fetchSubmodules = true;
      sha256 = "sha256-dQIN0DXH9j4Qu0Q8vwHjTG/lrtThHnR2bc1UymuUACI=";
    });
  };
  edl = {
    pname = "edl";
    version = "4f4e5600c7817e6613a40d97f438ea90291fe9f4";
    src = fetchFromGitHub ({
      owner = "bkerler";
      repo = "edl";
      rev = "4f4e5600c7817e6613a40d97f438ea90291fe9f4";
      fetchSubmodules = true;
      sha256 = "sha256-6fr2WCK4V0eqFd2lFx1KQjtA4ObQWDzddsekvPUA9EI=";
    });
  };
  fcitx5-material-color = {
    pname = "fcitx5-material-color";
    version = "0.2.1";
    src = fetchFromGitHub ({
      owner = "hosxy";
      repo = "Fcitx5-Material-Color";
      rev = "0.2.1";
      fetchSubmodules = true;
      sha256 = "sha256-i9JHIJ+cHLTBZUNzj9Ujl3LIdkCllTWpO1Ta4OT1LTc=";
    });
  };
  gost = {
    pname = "gost";
    version = "0247b941ac31344f0d7b3c547941a051188ba202";
    src = fetchFromGitHub ({
      owner = "ginuerzh";
      repo = "gost";
      rev = "0247b941ac31344f0d7b3c547941a051188ba202";
      fetchSubmodules = true;
      sha256 = "sha256-GYFWEHt1CNoKvdcQh0fEU/BH3Go85RrIwUZb3EUZeSI=";
    });
  };
  guestfs-tools = {
    pname = "guestfs-tools";
    version = "f5baf83e464c276d3dae6f8e878b8f47fe0d43d9";
    src = fetchFromGitHub ({
      owner = "rwmjones";
      repo = "guestfs-tools";
      rev = "f5baf83e464c276d3dae6f8e878b8f47fe0d43d9";
      fetchSubmodules = true;
      sha256 = "sha256-LsvsnPQcBblRhGLZP7MQuufnPnvKeL2EpI23ec/gjys=";
    });
  };
  ksmbd = {
    pname = "ksmbd";
    version = "81de8a6b5b9b8baa266f61c1ce9f6fed83e6c5fe";
    src = fetchFromGitHub ({
      owner = "namjaejeon";
      repo = "ksmbd";
      rev = "81de8a6b5b9b8baa266f61c1ce9f6fed83e6c5fe";
      fetchSubmodules = true;
      sha256 = "sha256-tQ3QBl3Nb0TdQdlpmHWBAwaUf5lGDBEVs7T8u92zbtE=";
    });
  };
  ksmbd-tools = {
    pname = "ksmbd-tools";
    version = "e1af92da7da2c5c0540bca1d543e7586cfc6d597";
    src = fetchFromGitHub ({
      owner = "namjaejeon";
      repo = "ksmbd-tools";
      rev = "e1af92da7da2c5c0540bca1d543e7586cfc6d597";
      fetchSubmodules = true;
      sha256 = "sha256-vzn4OJrD62oLFVH9X24/ObYONZ5ZezCbn+MeEN2ahnE=";
    });
  };
  landrop = {
    pname = "landrop";
    version = "v0.4.0";
    src = fetchFromGitHub ({
      owner = "LANDrop";
      repo = "LANDrop";
      rev = "v0.4.0";
      fetchSubmodules = false;
      sha256 = "sha256-IwtphjMSa0e2mO5C4zHId48SUpT99sXziZzApnSmvrU=";
    });
  };
  mattermost = {
    pname = "mattermost";
    version = "7.1.2";
    src = fetchurl {
      url = "https://releases.mattermost.com/7.1.2/mattermost-7.1.2-linux-amd64.tar.gz";
      sha256 = "sha256-QFjx4Ju5xMC9N9GwYAI1TlkJe9jrgznMy2BvYy2HHKY=";
    };
  };
  microsocks = {
    pname = "microsocks";
    version = "v1.0.3";
    src = fetchFromGitHub ({
      owner = "rofl0r";
      repo = "microsocks";
      rev = "v1.0.3";
      fetchSubmodules = true;
      sha256 = "sha256-l+8+zqeY/Qf5pKvzW9WQBfltEvrD7Vp+hJAXM2o16aI=";
    });
  };
  mmdb-ipip = {
    pname = "mmdb-ipip";
    version = "f8ffe175b92dd181642dbeb011d4da7fcdf32341";
    src = fetchgit {
      url = "https://github.com/alecthw/mmdb_china_ip_list.git";
      rev = "f8ffe175b92dd181642dbeb011d4da7fcdf32341";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-a1QfEsG8m5EGy+gN8hi9M4T5UqCAV00p8C7sDkalL8I=";
    };
  };
  motrix = {
    pname = "motrix";
    version = "1.6.11";
    src = fetchurl {
      url = "https://github.com/agalwood/Motrix/releases/download/v1.6.11/Motrix-1.6.11.AppImage";
      sha256 = "sha256-tE2Q7NM+cQOg+vyqyfRwg05EOMQWhhggTA6S+VT+SkM=";
    };
  };
  nali = {
    pname = "nali";
    version = "v0.3.2";
    src = fetchFromGitHub ({
      owner = "zu1k";
      repo = "nali";
      rev = "v0.3.2";
      fetchSubmodules = true;
      sha256 = "sha256-iRLoUBA+Kzv1/LZQ8HCvR79K1riYErxEWhB0OmvFy2g=";
    });
  };
  nearcore = {
    pname = "nearcore";
    version = "1.28.0";
    src = fetchFromGitHub ({
      owner = "near";
      repo = "nearcore";
      rev = "1.28.0";
      fetchSubmodules = true;
      sha256 = "sha256-DRVlD74XTYgy3GeUd/7OIl2aie8nEJLmrmmkwPRkrA8=";
    });
    cargoLock."Cargo.lock" = {
      lockFile = ./nearcore-1.28.0/Cargo.lock;
      outputHashes = {
        "sysinfo-0.14.3" = "sha256-3oay53OBILdA3HULGCYway65JDLwcQSl898sWCAgwls=";
      };
    };
  };
  openwhisk-cli = {
    pname = "openwhisk-cli";
    version = "1.2.0";
    src = fetchFromGitHub ({
      owner = "apache";
      repo = "openwhisk-cli";
      rev = "1.2.0";
      fetchSubmodules = true;
      sha256 = "sha256-SdsfRuN4tsuTObETrES8VOrn2jgz3SucMXKvyUuuZYs=";
    });
  };
  pufferpanel = {
    pname = "pufferpanel";
    version = "v2.5.1";
    src = fetchFromGitHub ({
      owner = "PufferPanel";
      repo = "PufferPanel";
      rev = "v2.5.1";
      fetchSubmodules = true;
      sha256 = "sha256-GrMqZGvPOyPvUAheR4ybEJDWrQ7WukioPFnyrSNDmSA=";
    });
  };
  realm = {
    pname = "realm";
    version = "v2.4.1";
    src = fetchFromGitHub ({
      owner = "zhboner";
      repo = "realm";
      rev = "v2.4.1";
      fetchSubmodules = true;
      sha256 = "sha256-G92SxJE8cv8ATWt9UfQoBYCdo13/V/wqMlGfO6FI8/k=";
    });
    cargoLock."Cargo.lock" = {
      lockFile = ./realm-v2.4.1/Cargo.lock;
      outputHashes = { };
    };
  };
  simple-obfs = {
    pname = "simple-obfs";
    version = "v0.0.5";
    src = fetchFromGitHub ({
      owner = "shadowsocks";
      repo = "simple-obfs";
      rev = "v0.0.5";
      fetchSubmodules = true;
      sha256 = "sha256-xNkIAltV+NnV+kgKZv8UZaeefjaVt35m+UjU+gbDQEw=";
    });
  };
  sunshine = {
    pname = "sunshine";
    version = "v0.11.1";
    src = fetchFromGitHub ({
      owner = "loki-47-6F-64";
      repo = "sunshine";
      rev = "v0.11.1";
      fetchSubmodules = true;
      sha256 = "sha256-YrQHHpw7GOcdlnyJI28VShYFrTRq7kpILnkyCYf77NE=";
    });
  };
  trojan-go = {
    pname = "trojan-go";
    version = "v0.10.6";
    src = fetchFromGitHub ({
      owner = "p4gefau1t";
      repo = "trojan-go";
      rev = "v0.10.6";
      fetchSubmodules = true;
      sha256 = "sha256-ZzIEKyLhHwYEWBfi6fHlCbkEImetEaRewbsHQEduB5Y=";
    });
  };
  tun2socks = {
    pname = "tun2socks";
    version = "v2.4.1";
    src = fetchFromGitHub ({
      owner = "xjasonlyu";
      repo = "tun2socks";
      rev = "v2.4.1";
      fetchSubmodules = true;
      sha256 = "sha256-FBYRqxS8DJbIc8j8X6WNxl6a1YRcNrPSnNfrq/Y0fMM=";
    });
  };
  vouch = {
    pname = "vouch";
    version = "v0.37.0";
    src = fetchFromGitHub ({
      owner = "vouch";
      repo = "vouch-proxy";
      rev = "v0.37.0";
      fetchSubmodules = true;
      sha256 = "sha256-sBbA4uRpCiEPw1D2dxnyHYQZ7JLWlY+OJzu1sscqjGU=";
    });
  };
  vpncloud = {
    pname = "vpncloud";
    version = "v2.3.0";
    src = fetchFromGitHub ({
      owner = "dswd";
      repo = "vpncloud";
      rev = "v2.3.0";
      fetchSubmodules = true;
      sha256 = "sha256-74ohjWnBHr31sM08ghFWnrfIRjfQ5M7nrKi0yT/cGEo=";
    });
    cargoLock."Cargo.lock" = {
      lockFile = ./vpncloud-v2.3.0/Cargo.lock;
      outputHashes = { };
    };
  };
  wechat-uos = {
    pname = "wechat-uos";
    version = "2.1.3";
    src = fetchurl {
      url = "https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.weixin/com.tencent.weixin_2.1.3_amd64.deb";
      sha256 = "sha256-W3ckVWbmgpwrIjsEFz80wcN853CdIu1NiiR1czjPsKM=";
    };
  };
  wgcf = {
    pname = "wgcf";
    version = "v2.2.15";
    src = fetchFromGitHub ({
      owner = "ViRb3";
      repo = "wgcf";
      rev = "v2.2.15";
      fetchSubmodules = true;
      sha256 = "sha256-tUEeczs3J//2ZrZkAsSn3C+GScRPaIgheRM2wByS8p4=";
    });
  };
  winbox = {
    pname = "winbox";
    version = "3.37";
    src = fetchurl {
      url = "https://download.mikrotik.com/winbox/3.37/winbox64.exe";
      sha256 = "sha256-q+aW5FgJ8msDIJJqABTTCI3MWsQ9VTorek4l9UoEdDk=";
    };
  };
  wiretrustee = {
    pname = "wiretrustee";
    version = "v0.8.4";
    src = fetchFromGitHub ({
      owner = "wiretrustee";
      repo = "wiretrustee";
      rev = "v0.8.4";
      fetchSubmodules = true;
      sha256 = "sha256-LbushkVF+Bs5BxEp6rczhUc7cIy2yTGdVcJgNgIS5hs=";
    });
  };
  yacd = {
    pname = "yacd";
    version = "v0.3.6";
    src = fetchurl {
      url = "https://github.com/haishanh/yacd/releases/download/v0.3.6/yacd.tar.xz";
      sha256 = "sha256-YIx+IcHubP7mJoxaOVGkwh3EB+6mcEkFjOwpnAsR4vs=";
    };
  };
  yesplaymusic = {
    pname = "yesplaymusic";
    version = "0.4.5";
    src = fetchurl {
      url = "https://github.com/qier222/YesPlayMusic/releases/download/v0.4.5/YesPlayMusic-0.4.5.AppImage";
      sha256 = "sha256-9Jj4VqrEIsx2oFUoQaPEKaEcyKDR5SQF9tJ2r2w62CM=";
    };
  };
}
