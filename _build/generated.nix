# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub }:
{
  clash-premium = {
    pname = "clash-premium";
    version = "2022.08.26";
    src = fetchurl {
      url = "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-2022.08.26.gz";
      sha256 = "sha256-F3Gn2b5zhgd+galkJIt5Hw2fDs9SGKPE7vxi+GRR3h0=";
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
  edl = {
    pname = "edl";
    version = "f6b94da5faa003b48d24a5f4a8f0b8495626fd5b";
    src = fetchFromGitHub ({
      owner = "bkerler";
      repo = "edl";
      rev = "f6b94da5faa003b48d24a5f4a8f0b8495626fd5b";
      fetchSubmodules = true;
      sha256 = "sha256-bxnRy+inWNArE2gUA/qDPy7NKvqBm43sbxdIaTc9N28=";
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
    version = "b0bb26fc952bb7e27a93d7be9d4694e9e0d6da84";
    src = fetchFromGitHub ({
      owner = "ginuerzh";
      repo = "gost";
      rev = "b0bb26fc952bb7e27a93d7be9d4694e9e0d6da84";
      fetchSubmodules = true;
      sha256 = "sha256-tmZSGKfhBxGBGjh/Br0nBDwdb4Svmn9ckLpQNKMEkFU=";
    });
  };
  guestfs-tools = {
    pname = "guestfs-tools";
    version = "e094eb340b367b2fc6ef4cad495bb15f4efc1da9";
    src = fetchFromGitHub ({
      owner = "rwmjones";
      repo = "guestfs-tools";
      rev = "e094eb340b367b2fc6ef4cad495bb15f4efc1da9";
      fetchSubmodules = true;
      sha256 = "sha256-L53nMNzRW0HDlCO4NyPuAN9QDSpmirwufcToL0cSBRI=";
    });
  };
  hev-socks5-tproxy = {
    pname = "hev-socks5-tproxy";
    version = "2.3.3";
    src = fetchFromGitHub ({
      owner = "heiher";
      repo = "hev-socks5-tproxy";
      rev = "2.3.3";
      fetchSubmodules = true;
      sha256 = "sha256-UEqv5WO+VlprJmHoLdI/h34CyP/yhzC8qofI+rAZnAI=";
    });
  };
  ksmbd = {
    pname = "ksmbd";
    version = "714e046416ab0a107ce3af92b3dee1329565b9f8";
    src = fetchFromGitHub ({
      owner = "namjaejeon";
      repo = "ksmbd";
      rev = "714e046416ab0a107ce3af92b3dee1329565b9f8";
      fetchSubmodules = true;
      sha256 = "sha256-VwD0K5X0wCUTyvUL/yp9DlZeFTDfryoBoekIFvtaub0=";
    });
  };
  ksmbd-tools = {
    pname = "ksmbd-tools";
    version = "fca8e2d8a5f6a5c2f8fe2f26211521c534149b78";
    src = fetchFromGitHub ({
      owner = "namjaejeon";
      repo = "ksmbd-tools";
      rev = "fca8e2d8a5f6a5c2f8fe2f26211521c534149b78";
      fetchSubmodules = true;
      sha256 = "sha256-3X7y0JNNZY1OWvqX9hsSf/DWHegmps53pOicGk0xn8c=";
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
    version = "7.4.0";
    src = fetchurl {
      url = "https://releases.mattermost.com/7.4.0/mattermost-7.4.0-linux-amd64.tar.gz";
      sha256 = "sha256-N4wvgrTmg1J06IPmpLlPHOHNNB+bH2BBQgEsv9GWCN0=";
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
    version = "1c9709270260b96ed116a84e8a9813bd93da0633";
    src = fetchgit {
      url = "https://github.com/alecthw/mmdb_china_ip_list.git";
      rev = "1c9709270260b96ed116a84e8a9813bd93da0633";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-Nbu8blZYCGUqBIxUS2P295lmhBAy6K4V6kP0NmpxvP4=";
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
  pufferpanel = {
    pname = "pufferpanel";
    version = "v2.5.2";
    src = fetchFromGitHub ({
      owner = "PufferPanel";
      repo = "PufferPanel";
      rev = "v2.5.2";
      fetchSubmodules = true;
      sha256 = "sha256-ALqc72A6DY8AN6ichMi15WVRMJLlZS7ABBRliO78v9w=";
    });
  };
  realm = {
    pname = "realm";
    version = "v2.4.4";
    src = fetchFromGitHub ({
      owner = "zhboner";
      repo = "realm";
      rev = "v2.4.4";
      fetchSubmodules = true;
      sha256 = "sha256-pGIPfMliRkTVjGtLZBdFL0ABx3G0jZHeX6En0CqhKFM=";
    });
    cargoLock."Cargo.lock" = {
      lockFile = ./realm-v2.4.4/Cargo.lock;
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
  winbox = {
    pname = "winbox";
    version = "3.37";
    src = fetchurl {
      url = "https://download.mikrotik.com/winbox/3.37/winbox64.exe";
      sha256 = "sha256-q+aW5FgJ8msDIJJqABTTCI3MWsQ9VTorek4l9UoEdDk=";
    };
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
