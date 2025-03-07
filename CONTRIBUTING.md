# Contributing Guidelines
## General Notice
***We reserve the right to remove any pull request or issue at any time for any reason.***

We hope not to excercise this right, but recognize that any open-source project may attract poor or malicious contribution attempts.

Unless a potential contributor is acting maliciously, we will attempt to provide notice of why their contributions have been denied.
## Code Formatting
There are many ways of formatting code (particularly in regard to indentation and brackets), and it is helpful for projects to hold to a given format for consistency and clarity. Unfortunately, HoverBat is a bat.. who is a self-taught programmer that can't help but code in his own style. Therefor much of the code format isn't standardized.

Moving forward, we will be holding to a fairly strict set of formatting rules(or at least trying to..) in an attempt to remedy this and *may* deny pull requests until their formatting is fixed. On a related note, pull requests that simply change existing formatting for consistency's sake are more than welcome.

I guess it depends on what the coder is used to, but I strongly feel open bracketing is more readable overall. This may just be a consequense of coding in GMS 1 code editor for so long.
```
if (codeFormatIsGood)
{
    show_debug_message("YOU SAVED HYRULE!");
} 
else
{
    show_debug_message("I AM ERROR");
}
```
Please comment your code thoroughly. We don't need a breakdown of every single line of code, but we must be able to tell what your code is doing with a quick perusal.

Comments should always be in English and generally follow proper grammar and sentence structuring norms. Other contributors must be able to understand what you are saying.

Comment lines should not be unecessarily long. Rule of thumb: if you have to scroll horizontally to read them, you're doing it wrong. Multiline comments should be used instead:
```
/*
    Actually using the /**/ comments is kinda annoying to turn on and off.
    I wish there was a simple toggle for it :)
*/
```
In keeping with GM:S conventions, all functions/methods should use snake_case.

Variables (local, global, and temporary) should use camelCase.

Local variables must start with an underscore: `var _localVar`

Enums and variables used as constants should use UPPER_CASE.

Sprites, surfaces, sounds, backgrounds/tilesets, shaders, fonts, and objects should all hold to a camelCase format with an appropriate prefix:
```
sprSpriteName, srfSurfaceName, sndSoundName, musMusicName, bgrBackgroundName, tsTilesetName, shdShaderName, fntFontName, objObjectName
```

**Data Structures** should all hold to a camelCase format with an appropriate prefix:
```
dl_ListName, dm_MapName, dg_GridName, ds_StackName, dq_QueueName, dp_PriorityName
```
We will not typically accept pull requests that implement new timelines, or rooms, and maybe several other things like just adding a font. Here's why:
* Timelines are too integrated with GML Drag 'n' Drop and can be easily replicated with proper state machines. Two currently exist, but they will eventually be replaced.
* Shaders are difficult to provide quality control for thanks to differences in evaluation on various GPU models. The palette swap shader currently utilized already has issues with various GPUs (or lack thereof), and providing support for more would require a low cost/benefit ratio. Shaders can also cause significant performance drops on Linux and Android devices.
## Why we reject Enhancement/Feature requests
We may reject Enhancement/Feature requests for many reasons, but they usually boil down to one of three: project bloat, project scope, and feasibility.

Project bloat is an issue that occurs when a project has too many options and/or features and becomes overwhelming and/or uncohesive. I already have issues with managing every little feature and toggleable option.

Project scope is the set of overarching goals for a project and the boundaries it should stay within. When something is "outside of project scope," it means that it does not fall within the project's goals. Enhancements/Features that are outside of project scope could create feature bloat, cause a project to lose its focus, or provide a large waste of time.

Feasibility is a balance of the effort required to implement an Enhancement/Feature versus the benefit of implementing said Enhancement/Feature. Some ideas are really cool and would fit within project scope, but simply aren't worth the time and effort to implement. This is less of a concern now that the project is open source and can have more contributors, but is still always worth keeping in mind.
