# Introduction

This is a simple SourceMod plugin personally made by me that announces teamkills (TKs) to everyone on chat along with its counter, showing the number of times a TK was performed per player. Counter-Strike games such as Counter-Strike: Source usually put a maximum teamkill limit of 3. The player is then kicked when the player kills too many teammates in a single game.

## Installation

Installation is fairly simple: 

1. First, get a dedicated server. You can follow the instructions at this [Steam tutorial](https://steamcommunity.com/sharedfiles/filedetails/?id=397365275).

2. Download [SourceMod](https://www.sourcemod.net/downloads.php) and extract the contents to your dedicated server's `cstrike/` directory.

3. Clone this repository and extract the contents to your dedicated server's `cstrike/` directory.

4. Run your dedicated server, and set it up based on the Steam tutorial link provided above. On your dedicated server's console, load the plugin with `sm plugins load teamkillannounce.smx` to load it individually or `sm plugins unload_all` then `sm plugins refresh` to refresh all your plugins.

## Configuration

You can edit the message being sent to chat by editing the file `teamkillannounce.sp` under the `scripting/` directory. For each change you make, you must compile this file by dragging it to `compile.exe` located at the same directory. Go to the `compiled/` directory of the same folder and copy the `teamkillannounce.smx` file to the plugins folder (e.g. `/addons/sourcemod/plugins`). Reload your plugins.

> NOTE: If you don't want to have colored chats, remove the line `#include <morecolors>` and change both instances of `CPrintToChatAllEx` to `PrintToChatAll`. You don't actually have to remove `morecolors.inc` from the `include/` directory if you have plugins that use this as it will cause those plugins to fail.

## Dependencies

- [morecolors.inc](https://forums.alliedmods.net/showthread.php?t=185016) (included)

## Contributions

Contributions are welcome! Please create a new branch and make a pull request to the main branch so that I'll review the changes and approve it if it's beneficial enough.

## Credits

- To Valve for making a wonderful game.
- To Dr. McKay from the SourceMod community for creating morecolors.inc.
- To Zeromix from Steam for creating a Counter-Strike: Source Dedicated Server.
- To the SourceMod community for making it possible to create and play Counter-Strike: Source with plugins.
