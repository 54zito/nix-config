{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-CT500P3SSD8_241247C684DC";
        content = {
          type = "gpt";
          partitions = {
            efi = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            swap = {
              size = "8G";
              type = "8200";
              content = {
                type = "swap";
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
                mountOptions = [ "discard" ];
              };
            };
          };
        };
      };
    };

    disk = {
      media = {
        type = "disk";
        device = "/dev/disk/by-id/ata-SPCC_Solid_State_Disk_MQ13A77906794";
        content = {
          type = "gpt";
          partitions = {
            share = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "exfat";
                mountpoint = "/persistant";
                mountOptions = [ "iocharset=utf8" ];
              };
            };
          };
        };
      };
    };
  };
}
