{ ... }: {
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };
  services.mpd = {
    enable = true;
    extraConfig = ''
      audio_output {
          type "pulse"
          name "My PulseAudio" # this can be whatever you want
        }
    '';

    # Optional:
    network.listenAddress =
      "any"; # if you want to allow non-localhost connections
  };
}
