# How to make this work

## Multiplayer client (FAForever)

You have 3 options:

1. Install manually, [guide here](https://wiki.faforever.com/en/Linux-Install)
2. Use Lutris [installation script](https://lutris.net/games/forged-alliance-forever/)
3. Get it from [AUR](https://aur.archlinux.org/packages/downlords-faf-client) (Arch Linux only)

After installing the client & creating an account, you'll need to launch the game at least once. Then copy the debug dump to any place (your home directory, for example) with this command:

```cp /tmp/proton_$USER/run ~/run```

Then open the client, go to Setting > Forged Alliance Forever, find "Command Line Format for Executable", copy and paste the location of `run` file & append `"%s"` parameter. So it will look like this: ```~/run "%s"```. Also, don't forget to set the "Game Location" to game path. Now you can create a new game or join someone else's, you should be able to play.

## Restore graphical effects & fix flickering mouse

You're gonna need dgVoodoo version 2.79 or later. You can grab it [here](https://github.com/dege-diosg/dgVoodoo2/releases). Also, I would recommend to check out [this forum](https://www.vogons.org/viewtopic.php?f=59&t=82441) for Work-In-Progress builds & updates.

Extract the archive, copy dgVoodooCpl.exe and D3D9.dll from MS/x86 directory to game's bin directory (where SupremeCommander.exe is located). Then you'll need to run dgVoodooCpl.exe with Proton inside the game's Wine prefix. Use this command (assuming you are using Proton 7.0 and it's installed into default location along with the game itself):

```STEAM_COMPAT_CLIENT_INSTALL_PATH="" STEAM_COMPAT_DATA_PATH=~/.local/share/Steam/steamapps/compatdata/9420 ~/.local/share/Steam/steamapps/common/Proton\ 7.0/proton run ./dgVoodooCpl.exe```

In the opened window set the config folder (just press `.\` or point to game's bin folder), then go to DirectX tab, disable dgVoodoo watermark and hit apply to create config file. I would recommend to enable it again, so you check if it works. Launch the game from Steam, you should see the watermark in bottom-right corner.

Then copy D3D9.dll & dgVoodooCpl.exe to bin directory inside FAForever data folder (by default it's `$HOME/.faforever`, but can be configured in client preferences), and disable & enable again the watermark. Launch the game from FAForever, if you see the watermark, then everything's working as expected, you can run dgVoodooCpl.exe again and remove the watermark.
