# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub }:
{
  clash-premium = {
    pname = "clash-premium";
    version = "2022.05.17";
    src = fetchurl {
      url = "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-2022.05.17.gz";
      sha256 = "sha256-I4A4ZKHZ1q1Vufz85/l4GYLvvbIQZtPiFSF1WRXSBh4=";
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
    version = "v1.8.1";
    src = fetchFromGitHub ({
      owner = "drone-runners";
      repo = "drone-runner-docker";
      rev = "v1.8.1";
      fetchSubmodules = true;
      sha256 = "sha256-3SbvnW+mCwaBCF77rAnDMqZRHX9wDCjXvFGq9w0E5Qw=";
    });
  };
  drone-runner-exec = {
    pname = "drone-runner-exec";
    version = "v1.0.0-beta.9";
    src = fetchFromGitHub ({
      owner = "drone-runners";
      repo = "drone-runner-exec";
      rev = "v1.0.0-beta.9";
      fetchSubmodules = true;
      sha256 = "sha256-upP6e/I5FRF+WEp086T1NmQA8YXcMG9VHixDUhTdxKs=";
    });
  };
  edl = {
    pname = "edl";
    version = "3094ae2ed9880ca28f22bba8eaffebd35ce1d801";
    src = fetchFromGitHub ({
      owner = "bkerler";
      repo = "edl";
      rev = "3094ae2ed9880ca28f22bba8eaffebd35ce1d801";
      fetchSubmodules = true;
      sha256 = "sha256-iQ2Pza4kQrFIFWn8oDtetDtW9LLEdxA/n3olh2WqVXA=";
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
  ksmbd = {
    pname = "ksmbd";
    version = "b568f6542e5aebf6fc963877a133a106c5ee6bd7";
    src = fetchFromGitHub ({
      owner = "namjaejeon";
      repo = "ksmbd";
      rev = "b568f6542e5aebf6fc963877a133a106c5ee6bd7";
      fetchSubmodules = true;
      sha256 = "sha256-5XdGfpUd1sBP5mhEIp9GoWONOJ4j4RFQAbVuMlEfeA0=";
    });
  };
  ksmbd-tools = {
    pname = "ksmbd-tools";
    version = "42cc11aa438414eba95868ff922b388165ce9378";
    src = fetchFromGitHub ({
      owner = "namjaejeon";
      repo = "ksmbd-tools";
      rev = "42cc11aa438414eba95868ff922b388165ce9378";
      fetchSubmodules = true;
      sha256 = "sha256-gEY96+47n3Da9IkWA1ELrsX0dzw0lE71pMNrt33pcEk=";
    });
  };
  mattermost = {
    pname = "mattermost";
    version = "6.7.0";
    src = fetchurl {
      url = "https://releases.mattermost.com/6.7.0/mattermost-6.7.0-linux-amd64.tar.gz";
      sha256 = "sha256-G5fvRLlXjtK2CabfMd/lnr62bHAxnO3QnV06ovZeGaY=";
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
    version = "0b5ff38adfe48fea124082197893f6f6ef88bd16";
    src = fetchgit {
      url = "https://github.com/alecthw/mmdb_china_ip_list.git";
      rev = "0b5ff38adfe48fea124082197893f6f6ef88bd16";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-g/x7QTdfIFnfLyZFz2FhnY6zZMSE0mcAeHzwZ/zRv/8=";
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
    version = "1.26.0-rc.3";
    src = fetchFromGitHub ({
      owner = "near";
      repo = "nearcore";
      rev = "1.26.0-rc.3";
      fetchSubmodules = true;
      sha256 = "sha256-MjeCGTS9UPCfk4Wyj1yx0FnsVk7o8b/Ahf9Ex+7MUgw=";
    });
    cargoLock."Cargo.lock" = {
      lockFile = ./nearcore-1.26.0-rc.3/Cargo.lock;
      outputHashes = {
        "paperclip-0.5.0" = "sha256-oQHrsXtd+PW8Ogfs9NM1oBg2wwa+hCBu/3LyMxghEIY=";
        "sysinfo-0.14.3" = "sha256-3oay53OBILdA3HULGCYway65JDLwcQSl898sWCAgwls=";
        "actix-cors-0.6.0-beta.2" = "sha256-0llqozO0wS/33jXyDUqxTNTcs7SDL9KVzBznF0IIWoQ=";
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
    version = "v2.4.0";
    src = fetchFromGitHub ({
      owner = "PufferPanel";
      repo = "PufferPanel";
      rev = "v2.4.0";
      fetchSubmodules = true;
      sha256 = "sha256-WKQiRGj504+aBYKbplyj/wBSpvN2+9EadEgoDyqkYXU=";
    });
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
    version = "v2.2.14";
    src = fetchFromGitHub ({
      owner = "ViRb3";
      repo = "wgcf";
      rev = "v2.2.14";
      fetchSubmodules = true;
      sha256 = "sha256-6V4fIoFB0fuCEu1Rj8QWGDNdgystrD/gefjbshvxVsw=";
    });
  };
  winbox = {
    pname = "winbox";
    version = "3.35";
    src = fetchurl {
      url = "https://download.mikrotik.com/winbox/3.35/winbox64.exe";
      sha256 = "sha256-0kqoSRIAqkXRuRZGsZwUAbmipyEgUHgSgiYydYmWL0o=";
    };
  };
  wiretrustee = {
    pname = "wiretrustee";
    version = "v0.5.1";
    src = fetchFromGitHub ({
      owner = "wiretrustee";
      repo = "wiretrustee";
      rev = "v0.5.1";
      fetchSubmodules = true;
      sha256 = "sha256-CgIe/coKEjvPIKu/JE6o9qGSTrGuKmVrG4C+jQ6OG+8=";
    });
  };
  yacd = {
    pname = "yacd";
    version = "v0.3.5";
    src = fetchurl {
      url = "https://github.com/haishanh/yacd/releases/download/v0.3.5/yacd.tar.xz";
      sha256 = "sha256-j2sDOC7QqoP0ptQ9cKa6kHM2efid7kgNmsggODEQaSA=";
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
