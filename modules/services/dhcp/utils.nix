{ lib }:

with lib;

let
  ipxeOptionsString = ''
    # iPXE config space
    option space ipxe;
    option ipxe-encap-opts code 175 = encapsulate ipxe;
    option ipxe.priority code 1 = signed integer 8;
    option ipxe.keep-san code 8 = unsigned integer 8;
    option ipxe.skip-san-boot code 9 = unsigned integer 8;
    option ipxe.syslogs code 85 = string;
    option ipxe.cert code 91 = string;
    option ipxe.privkey code 92 = string;
    option ipxe.crosscert code 93 = string;
    option ipxe.no-pxedhcp code 176 = unsigned integer 8;
    option ipxe.bus-id code 177 = string;
    option ipxe.san-filename code 188 = string;
    option ipxe.bios-drive code 189 = unsigned integer 8;
    option ipxe.username code 190 = string;
    option ipxe.password code 191 = string;
    option ipxe.reverse-username code 192 = string;
    option ipxe.reverse-password code 193 = string;
    option ipxe.version code 235 = string;
    option iscsi-initiator-iqn code 203 = string;
    # Feature indicators
    option ipxe.pxeext code 16 = unsigned integer 8;
    option ipxe.iscsi code 17 = unsigned integer 8;
    option ipxe.aoe code 18 = unsigned integer 8;
    option ipxe.http code 19 = unsigned integer 8;
    option ipxe.https code 20 = unsigned integer 8;
    option ipxe.tftp code 21 = unsigned integer 8;
    option ipxe.ftp code 22 = unsigned integer 8;
    option ipxe.dns code 23 = unsigned integer 8;
    option ipxe.bzimage code 24 = unsigned integer 8;
    option ipxe.multiboot code 25 = unsigned integer 8;
    option ipxe.slam code 26 = unsigned integer 8;
    option ipxe.srp code 27 = unsigned integer 8;
    option ipxe.nbi code 32 = unsigned integer 8;
    option ipxe.pxe code 33 = unsigned integer 8;
    option ipxe.elf code 34 = unsigned integer 8;
    option ipxe.comboot code 35 = unsigned integer 8;
    option ipxe.efi code 36 = unsigned integer 8;
    option ipxe.fcoe code 37 = unsigned integer 8;
    option ipxe.vlan code 38 = unsigned integer 8;
    option ipxe.menu code 39 = unsigned integer 8;
    option ipxe.sdi code 40 = unsigned integer 8;
    option ipxe.nfs code 41 = unsigned integer 8;
    option client-arch code 93 = unsigned integer 16;
    option ipxe.no-pxedhcp 1;
  '';

  buildHost = opt: ''
    host ${opt.name} {
      hardware ethernet ${opt.mac};
      ${optionalString (opt.address != null) ''
        fixed-address ${opt.address};
      ''}

      ${optionalString (opt.router != null) ''
        option routers ${opt.router};
      ''}

      ${optionalString (opt.dns != null) ''
        option domain-name-servers ${opt.dns};
      ''}

      ${optionalString (opt.extraOptions != null) ''
        ${opt.extraOptions}
      ''}
    }
  '';

  buildSubnet = opt: ''
    subnet ${opt.ip} netmask ${opt.netmask} {
      range ${opt.rangeBegin} ${opt.rangeEnd};
      option subnet-mask ${opt.netmask};
      ${optionalString (opt.router != null) ''
        option routers ${opt.router};
      ''}
      ${optionalString (opt.dns != null) ''
        option domain-name-servers ${opt.dns};
      ''}
      ${optionalString (opt.interface != null) ''
        interface ${opt.interface};
      ''}

      ${opt.extraConfig}

      ${optionalString (opt.ipxeFile != null) ''
        if exists user-class and option user-class = "iPXE" {
          filename "${opt.ipxeFile}";
        }
      ''}

       ${optionalString (opt.tftpServer != null) ''
        else if option client-arch != 00:00 {
          next-server ${opt.tftpServer};
          filename "ipxe.efi";
        }

        else {
          next-server ${opt.tftpServer};
          filename "undionly.kpxe";
        }

      ''}

      ${builtins.concatStringsSep "\n" (map buildHost opt.hosts)}
    }
  '';

in
rec {
  buildConfig = opt: ''
    ddns-update-style none;
    ${optionalString opt.enableIpxe ipxeOptionsString}

    ${optionalString opt.enableIpxe ''
      class "Apple-Intel-Netboot" {
        match if substring (option vendor-class-identifier, 0, 14) = "AAPLBSDPC/i386";
        option dhcp-parameter-request-list 1,3,17,43,60;
        if (option dhcp-message-type = 1) {
            option vendor-class-identifier "AAPLBSDPC/i386";
            option vendor-encapsulated-options 08:04:81:00:00:67;
        }
        next-server 10.0.0.1;
        filename "ipxe.efi";
      }
    ''}

    ${builtins.concatStringsSep "\n" (map buildSubnet opt.subnets)}
  '';
}
