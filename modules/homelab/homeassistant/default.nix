{
  autoStart = true;
  image = "ghcr.io/home-assistant/home-assistant:2025.9.3";
  extraOptions = [
    "--network=home"
    "--ip=192.168.1.155"
  ];
}
