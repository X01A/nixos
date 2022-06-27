{ pkgs, source, lib, stdenv, fetchurl, pkg-config, autoreconfHook, makeWrapper
, ncurses, cpio, gperf, cdrkit, flex, bison, qemu, pcre2, libxml2
, gmp, readline, file, jansson
, getopt, perlPackages, ocamlPackages }:

let
  libguestfs = pkgs.callPackage ./libguestfs.nix { };
in
stdenv.mkDerivation rec {
  inherit (source) pname version src;

  nativeBuildInputs = [
    autoreconfHook bison cdrkit cpio flex getopt gperf makeWrapper pkg-config qemu
  ] ++ (with perlPackages; [ perl ])
    ++ (with ocamlPackages; [ ocaml findlib ]);

  buildInputs = [
    libguestfs ncurses pcre2 libxml2 jansson
  ];

  prePatch = ''
    substituteInPlace run.in           --replace '#!/bin/bash' '#!${stdenv.shell}'
    substituteInPlace ocaml-dep.sh.in  --replace '#!/bin/bash' '#!${stdenv.shell}'
    substituteInPlace ocaml-link.sh.in --replace '#!/bin/bash' '#!${stdenv.shell}'
  '';
}
