{
  autoStart = true;
  image = "docker.io/adguard/adguardhome:v0.107.66";
  extraOptions = [
    "--network=home"
    "--ip=192.168.1.154"
  ];
}
