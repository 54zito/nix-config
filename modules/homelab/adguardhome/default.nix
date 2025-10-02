{
  autoStart = true;
  image = "docker.io/adguard/adguardhome:v0.107.66";
  volumes = [
    "/etc/localtime:/etc/localtime:ro"
    "/z-homelab/adguardhome/conf:/opt/adguardhome/conf"
    "/z-homelab/adguardhome/work:/opt/adguardhome/work"
  ];
  extraOptions = [
    "--network=home"
    "--ip=192.168.1.254"
  ];
}
