{ dwm }:

dwm.overrideAttrs(oldAttrs: rec {
  postPatch = ''
    cp ${./dwm.config.h} config.h
  '';

  patches = [
    # https://dwm.suckless.org/patches/awesomebar/
    ./patchs/dwm-awesomebar-20200907-6.2.diff
    # https://dwm.suckless.org/patches/hide_vacant_tags/
    ./patchs/dwm-hide_vacant_tags-6.2.diff
    # https://dwm.suckless.org/patches/alpha/
    ./patchs/dwm-alpha-20201019-61bb8b2.diff
    # https://dwm.suckless.org/patches/layoutmenu/
    ./patchs/dwm-layoutmenu-6.2.diff
    # https://dwm.suckless.org/patches/statuspadding/
    ./patchs/dwm-statuspadding-20150524-c8e9479.diff
    # https://github.com/bakkeby/patches/blob/master/dwm/dwm-alpha-systray-6.2.diff
    ./patchs/dwm-alpha-systray-6.2.diff
  ];
})
