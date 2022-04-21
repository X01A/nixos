# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl }:
{
  clash-premium = {
    pname = "clash-premium";
    version = "2022.04.17";
    src = fetchurl {
      url = "https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-2022.04.17.gz";
      sha256 = "0yrqvwlfzkjca1wb0bb40rn4333dgn0had9hikwam63m3sifmz1b";
    };
  };
  cloudreve = {
    pname = "cloudreve";
    version = "3.4.3";
    src = fetchurl {
      url = "https://github.com/cloudreve/Cloudreve/releases/download/3.4.3/cloudreve_3.4.3_linux_amd64.tar.gz";
      sha256 = "0c24wixq78xdm9d345v87f2d0kxwqgbxsjngqlrvpzz8k67wj1hx";
    };
  };
  commit-notifier = {
    pname = "commit-notifier";
    version = "573c1eb7eabc97aa06e0e9ad85f5148110749876";
    src = fetchgit {
      url = "https://github.com/linyinfeng/commit-notifier";
      rev = "573c1eb7eabc97aa06e0e9ad85f5148110749876";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0al8rvczn99hymhnanfij2b3b35gzg59v2q24swsfrky625g08i6";
    };
    cargoLock = {
      lockFile = ./commit-notifier-573c1eb7eabc97aa06e0e9ad85f5148110749876/Cargo.lock;
      outputHashes = { };
    };
  };
  drone-runner-docker = {
    pname = "drone-runner-docker";
    version = "v1.8.1";
    src = fetchgit {
      url = "https://github.com/drone-runners/drone-runner-docker";
      rev = "v1.8.1";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "03750h6zgajipkbjh33hgwfm39ijqc4srysy120hc2x6dyfyy9nx";
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
  edl = {
    pname = "edl";
    version = "3cf3324209d1c581750556c970597dafbd1e4550";
    src = fetchgit {
      url = "https://github.com/bkerler/edl";
      rev = "3cf3324209d1c581750556c970597dafbd1e4550";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1dn7bwmipya34cf3yqbmsvvdmywnnsnclzb2mki8s8rybqp8cid0";
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
  gost = {
    pname = "gost";
    version = "f94293b454444692dc6db83977f3d8da95228e3b";
    src = fetchgit {
      url = "https://github.com/ginuerzh/gost";
      rev = "f94293b454444692dc6db83977f3d8da95228e3b";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0y5y694n54fjgxncmzbq4bq30f5xhnn830lc64xcnyhin220ffhy";
    };
  };
  ksmbd = {
    pname = "ksmbd";
    version = "506bf29e436a0361088a39320191f3bd5d5b814d";
    src = fetchgit {
      url = "https://github.com/namjaejeon/ksmbd";
      rev = "506bf29e436a0361088a39320191f3bd5d5b814d";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1zqkknnxn9lwi8irdhvf862mjb8qcqv6p08f82ijx4687vc7bw2q";
    };
  };
  ksmbd-tools = {
    pname = "ksmbd-tools";
    version = "fd58ca124dc81e88d35185d15bee7520c8f0deb9";
    src = fetchgit {
      url = "https://github.com/namjaejeon/ksmbd-tools";
      rev = "fd58ca124dc81e88d35185d15bee7520c8f0deb9";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "04sn93pn2ify5dp6dn2dhcx5k59fxsn3g1r5xrjsb06qiw34195s";
    };
  };
  mattermost = {
    pname = "mattermost";
    version = "6.6.0";
    src = fetchurl {
      url = "https://releases.mattermost.com/6.6.0/mattermost-6.6.0-linux-amd64.tar.gz";
      sha256 = "04isckk6d1whsxc50h4vdr6pqd5z9xxhrc3gfjhvcbq4ssyhlwn5";
    };
  };
  microsocks = {
    pname = "microsocks";
    version = "v1.0.3";
    src = fetchgit {
      url = "https://github.com/rofl0r/microsocks";
      rev = "v1.0.3";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "18p96mm365whhiz5mvf3z896vy85j3ampwxblkwhgzcqlz73xvwp";
    };
  };
  mmdb-ipip = {
    pname = "mmdb-ipip";
    version = "fe6e9b69b1040ade4a9442f6b4118ec923738c37";
    src = fetchgit {
      url = "https://github.com/alecthw/mmdb_china_ip_list.git";
      rev = "fe6e9b69b1040ade4a9442f6b4118ec923738c37";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1mcpvr4lmw8k1bjxbnqhap9b5sskzy3q4g821bryzzgblggw91rb";
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
    version = "v0.3.2";
    src = fetchgit {
      url = "https://github.com/zu1k/nali";
      rev = "v0.3.2";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0s6bqmmklx0hb92bq4lqp3b4mgs7mxqg0l5nzksknary218fh4l9";
    };
  };
  nearcore = {
    pname = "nearcore";
    version = "1.25.0";
    src = fetchgit {
      url = "https://github.com/near/nearcore";
      rev = "1.25.0";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0cqwnyww3rc0xm9plqwb4pyncrmlr8732vx26jjgy8f6jal8267f";
    };
    cargoLock = {
      lockFile = ./nearcore-1.25.0/Cargo.lock;
      outputHashes = {
        "paperclip-0.5.0" = "11hh44c37wkjzxp2115y0v1kc6506p9z9v077aygby2xgfqyn0d1";
        "sysinfo-0.14.3" = "0ny240h5hb6zyfjh8wgh68jbjbkb60k1h2vmvi0bf841fgkv51ny";
        "actix-cors-0.6.0-beta.2" = "112s1111grqwrjax4bw3njrxrm2cn550vwimvvvjzhdl6finlnfj";
      };
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
  pufferpanel = {
    pname = "pufferpanel";
    version = "v2.4.0";
    src = fetchgit {
      url = "https://github.com/PufferPanel/PufferPanel";
      rev = "v2.4.0";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0xb1lhm0ya28fhdd3yvnyfk5407zldfad6w20nd8zlzrd122592q";
    };
  };
  simple-obfs = {
    pname = "simple-obfs";
    version = "v0.0.5";
    src = fetchgit {
      url = "https://github.com/shadowsocks/simple-obfs";
      rev = "v0.0.5";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0k20qc3gmm28z5k7xdwm6rz9x9v52kznc2j8zbaxky2mbc10inf4";
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
  tun2socks = {
    pname = "tun2socks";
    version = "v2.4.1";
    src = fetchgit {
      url = "https://github.com/xjasonlyu/tun2socks";
      rev = "v2.4.1";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1hvw6kvapsypkk9b6djwhkarlpn6injmzz68fg49c35w2jmi25hl";
    };
  };
  vouch = {
    pname = "vouch";
    version = "v0.37.0";
    src = fetchgit {
      url = "https://github.com/vouch/vouch-proxy";
      rev = "v0.37.0";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0rcc5b3v5d9v4y78z5fnjbn1k10xy8cpgxjhqc7j22k9wkic05mh";
    };
  };
  vpncloud = {
    pname = "vpncloud";
    version = "v2.3.0";
    src = fetchgit {
      url = "https://github.com/dswd/vpncloud";
      rev = "v2.3.0";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0jhqvhzwkd58mkkwxr6h6x3cidwyaq8q4g6dn3svs7n1d66j32pg";
    };
    cargoLock = {
      lockFile = ./vpncloud-v2.3.0/Cargo.lock;
      outputHashes = { };
    };
  };
  wgcf = {
    pname = "wgcf";
    version = "v2.2.12";
    src = fetchgit {
      url = "https://github.com/ViRb3/wgcf";
      rev = "v2.2.12";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "0wp8p1nmghc99c7lfsmgxjdfxzhls6kdm3i0353wqi1295fq502l";
    };
  };
  winbox = {
    pname = "winbox";
    version = "3.35";
    src = fetchurl {
      url = "https://download.mikrotik.com/winbox/3.35/winbox64.exe";
      sha256 = "0jigjs4paci6h897hl1046ks5f812jfb2ihnp78lbah0294shjnj";
    };
  };
  wiretrustee = {
    pname = "wiretrustee";
    version = "v0.5.1";
    src = fetchgit {
      url = "https://github.com/wiretrustee/wiretrustee";
      rev = "v0.5.1";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "1vqviq78vgl03dmnaamfn57958gnm1729gxb437kn4harbyiw0ha";
    };
  };
  yacd = {
    pname = "yacd";
    version = "v0.3.4";
    src = fetchurl {
      url = "https://github.com/haishanh/yacd/releases/download/v0.3.4/yacd.tar.xz";
      sha256 = "14q1wp3bdl474f6jwhykvr3409f18xmwhkzndvk6rlgidxvq6in2";
    };
  };
  yesplaymusic = {
    pname = "yesplaymusic";
    version = "0.4.4-1";
    src = fetchurl {
      url = "https://github.com/qier222/YesPlayMusic/releases/download/v0.4.4-1/YesPlayMusic-0.4.4-1.AppImage";
      sha256 = "1i6zkcvgaqijj121mcymbxbdzqha2zm05bq0w1sqqs80z7q2bpr5";
    };
  };
}
