{ lib
, buildGoModule
, buildNpmPackage
, coreutils
, fetchFromGitHub
, installShellFiles
,
}:

buildGoModule (finalAttrs: {
  pname = "sing-box-extended";
  version = "1.13.18-extended-2.6.5";

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "shtorm-7";
    repo = "sing-box-extended";
    tag = "v${finalAttrs.version}";
    hash = "sha256-h2MXld776trOB7ZUARjvnc6EfzlErumvMOCk/hvd0AA=";
  };

  vendorHash = "sha256-8Nkrk2RbbHnS4JwLm3Py7VONsQ3IZVL0qzzBDp86xvY=";

  # The main preBuild needs vendored modules, so it must not run while
  # buildGoModule is producing the vendor fixed-output derivation.
  overrideModAttrs = _: _: {
    preBuild = "";
  };

  adminPanel = buildNpmPackage {
    pname = "sing-box-extended-admin-panel";
    inherit (finalAttrs) src version;
    sourceRoot = "${finalAttrs.src.name}/service/admin_panel/web";

    npmDepsHash = "sha256-m0oTSkiI2r1QtljEBnhOAcd7CLOB78t5wF1PUr9ZQ/4=";

    postPatch = ''
      substituteInPlace package.json \
        --replace-fail '--outDir ../dist' '--outDir dist'
    '';

    installPhase = ''
      runHook preInstall

      mkdir -p "$out"
      cp -r dist/. "$out/"

      runHook postInstall
    '';
  };

  tags = [
    "with_gvisor"
    "with_quic"
    "with_dhcp"
    "with_wireguard"
    "with_utls"
    "with_acme"
    "with_clash_api"
    "with_tailscale"
    "with_masque"
    "with_mtproxy"
    "with_openvpn"
    "with_trusttunnel"
    "with_call"
    "with_sudoku"
    "with_snell"
    "with_manager"
    "with_admin_panel"
    "with_profiler"
    "badlinkname"
    "tfogo_checklinkname0"
  ];

  subPackages = [ "cmd/sing-box" ];

  env.CGO_ENABLED = 0;

  nativeBuildInputs = [ installShellFiles ];

  ldflags = [
    "-s"
    "-w"
    "-X=github.com/sagernet/sing-box/constant.Version=${finalAttrs.version}"
    "-X=internal/godebug.defaultGODEBUG=multipathtcp=0"
    "-checklinkname=0"
  ];

  preBuild = ''
    mkdir -p service/admin_panel/dist
    cp -r ${finalAttrs.adminPanel}/. service/admin_panel/dist/
    chmod -R u+w service/admin_panel/dist
    go run ./cmd/internal/admin_panel_pack -dir service/admin_panel/dist
  '';

  postInstall = ''
    installShellCompletion release/completions/sing-box.{bash,fish,zsh}

    substituteInPlace release/config/sing-box{,@}.service \
      --replace-fail "/usr/bin/sing-box" "$out/bin/sing-box" \
      --replace-fail "/bin/kill" "${coreutils}/bin/kill"
    install -Dm444 -t "$out/lib/systemd/system/" release/config/sing-box{,@}.service

    install -Dm444 release/config/sing-box.rules "$out/share/polkit-1/rules.d/sing-box.rules"
    install -Dm444 release/config/sing-box-split-dns.xml "$out/share/dbus-1/system.d/sing-box-split-dns.conf"
  '';

  passthru.updateScript = ./update.sh;

  meta = {
    description = "Sing-box with extended features";
    homepage = "https://github.com/shtorm-7/sing-box-extended";
    changelog = "https://github.com/shtorm-7/sing-box-extended/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.gpl3Plus;
    mainProgram = "sing-box";
    platforms = lib.platforms.unix;
  };
})
