# What is this?
This repository is the **ZALiA** GameMaker:Studio project including most, if not all, of its contents. 

If you're just looking for the game to play, it can be downloaded [here](https://hoverbat.itch.io/ziiaol).

[**ZALiA**(**Zelda Again: Link is Adventuresome**)](https://youtu.be/BeVDs5hIxFg?t=705) is a *Zelda II: The Adventure of Link* fan game created by [**HoverBat**](https://github.com/HoverBat1) in GameMaker:Studio with the goal of creating more Zelda II content. Although it's written in GML(Game Maker Language), the gameplay is accurate to the original's because it is a direct tranlation of the original's assembly code. ZALiA's content is mostly vanilla Zelda II but includes a bunch of added content and a ton of QOL(Quality of Life) improvements.

# License
Please read our [license](LICENSE) before distributing, modifying, contributing to, or otherwise interacting with this project.


# Contributing
Please read our [Contribution Guidelines](CONTRIBUTING.md) before opening any issues or creating pull requests.

Additionally, it would be most helpful if you joined the [Zelda Again: Link is Adventuresome Discord server](https://discord.gg/hFusD9VzVE) if you plan on contributing to the project. You can find some development files there such as my notes on what a specific RAM address is used for and a text file of dissected assembly.


# Disclaimer(s)
A warning that much of this code is messy, uses unusual solutions, and does not hold to our established formatting style - this is a result of HoverBat's disorganization, and his nature as a bat.

I'm still new the world of sharing source code and working with a community on a project. I'm not quite sure what to do next, but I'm sure there's plenty [TODO](https://github.com/search?q=repo%3AZA-LiA%2FZALiA%20todo&type=code).


# Requirements
* **GameMaker:Studio 1.4.9999** - the IDE for editing and compiling this project.
  * Someone informed me you can still get [**GameMaker:Studio 1.4.9999**](http://store.yoyogames.com/downloads/gm-studio/release-notes-studio.html). If you have trouble trusting links: Go to GameMaker's official home page (I've been told you need a YoYo account and license number, but typing gibberish into the license field works) > Click on Blog at the top > Scroll down to find the search bar > Search **1.4.9999** > Click on search result: **GAMEMAKER:STUDIO 1.4.9999 RELEASED**
  * If you can't get a copy of GameMaker:Studio 1.4.9999, I've been told [Undertale Mod Tool](https://github.com/UnderminersTeam/UndertaleModTool) can be used though I'm not familiar with it.
* [Tiled](https://www.mapeditor.org/) map/level editor if you want to edit existing scenes/rooms or make new ones.
  * [Here](https://drive.google.com/file/d/1xCY8eRpoub1zfzu0G1195Vm6OgnVpN0R/view?usp=sharing) is the Google Drive download for all the Tiled map files that ZALiA uses.

# Player Skins
**2025/9/2**: I've decided to keep all the player skins here in the repository.

~~There are about 3800 additional sprites due to the player skins. I have removed all but the default skin so that all the extras are not in the way during development.~~

~~When it's time to release the project, or if you would like to include any of the extra skins during development:~~
1. ~~Download [**files_for_importing_player_skins**](https://drive.google.com/file/d/1zvKcnBdjs-6mfKKPTBxRmiQo6pVYciEb/view?usp=sharing) folder and unzip. It contains all the player skin .gmx files and the .png image files that go with them.~~
2. ~~In **GameMaker:Studio** > In the assets tree > In the **Sprites** folder > Right click on the **player_character** folder > Click **Add Existing Sprite**.~~
3. ~~In the window that pops up, navigate to the downloaded skins folder > Select the .gmx files of which skins you want (Do not select **spr_PCSkin_KazunobuShimizu_Link01.sprite.gmx** as it's the default skin already in the project)~~
4. ~~In **GameMaker:Studio** > In the assets tree > In the **Scripts** folder > In the **game_object** folder > In the **goa** folder > Open the **PC_init** script > Find the comment `// UNCOMMENT WHICH SKINS YOU WILL USE HERE` > Uncomment which skins you're going to use.~~

# Alternate Audio Sets
**2025/9/2**: I've decided to keep all the audio sets here in the repository.

~~The largest files are audio, and there are 9 extra audio sets added by the community. Because this can slow down development time, I have removed most of them until a new release.~~

~~When it's time to release the project, or if you would like to include any of the extra audio sets during development:~~
1. ~~Download [**files_for_importing_community_audio**](https://drive.google.com/file/d/1AZmX07ezTJl5BPfcL2bHYheAR5X0dsNW/view?usp=sharing) folder and unzip. It contains all the .gmx files of the extra audio sets and the .mp3/.wav files that go with them.~~
2. ~~In **GameMaker:Studio** > In the assets tree > In the **Sounds** folder you will find several empty folders to hold each audio set; **ZeldaII_FDS**, **IsabelleChiming**, **SteelCrescent**, **SteelCrescent_Alt**, **SteelCrescent_NESPlus**, **SteelCrescent_Skug**, **SteelCrescent_Synth**, **Wyng**. You will have to import the audio sets one at a time. > Right click on an audio set's folder > Click **Add Existing Sound**.~~
3. ~~In the window that pops up, navigate to the downloaded **files_for_importing_community_audio** folder > Inside it, open the folder that matches the audio set you're importing > Select all of the .gmx files in that folder > Click **Open**.~~
4. ~~Repeat steps 2 and 3 until the desired audio sets are imported.~~
