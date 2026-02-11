{
  programs.nixcord = {
    enable = true;
    discord.vencord.enable = false;
    discord.equicord.enable = true;
    config = {
      plugins = {
        biggerStreamPreview.enable = true;
        callTimer.enable = true;
        experiments.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        forceOwnerCrown.enable = true;
        friendsSince.enable = true;
        gameActivityToggle.enable = true;
        permissionsViewer.enable = true;
        serverInfo.enable = true;
        silentTyping.enable = true;
        spotifyCrack.enable = true;
        summaries.enable = true;
        typingIndicator.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        voiceChatDoubleClick.enable = true;
        voiceMessages.enable = true;
        volumeBooster.enable = true;
        webKeybinds.enable = true;
        webScreenShareFixes.enable = true;
        youtubeAdblock.enable = true;
        limitMiddleClickPaste.enable = true;
        mediaPlaybackSpeed.enable = true;
        pinIcon.enable = true;
      };
    };
  };
}
