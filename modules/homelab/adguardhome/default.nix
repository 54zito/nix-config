{
  autoStart = true;
  image = "docker.io/adguard/adguardhome:v0.107.66";
  volumes = [
    "/etc/localtime:/etc/localtime:ro"
    "/persistant/services/adguardhome/conf:/opt/adguardhome/conf"
    "/persistant/services/adguardhome/work:/opt/adguardhome/work"
  ];
  extraOptions = [ "--network=home" "--ip=192.168.1.254" ];
}
