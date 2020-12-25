### TABLE OF CONTENTS
- [**(A) INTRODUCTION**](#introduction)
  - [**(1) Features**](#features)
  - [**(2) Installation**](#installation)
  - [**(3) Usage**](#usage)
  - [**(4) Supported Version**](#supported-version)
  - [**(5) Shortcut**](#shortcut)
- [**(B) MODULE**](#module)
- [**(C) MACROS**](#macros)
  - [**(1) Break Lines**](#break-lines)
  - [**(2) Case Conversion**](#case-conversion)
  - [**(3) Check Lines**](#check-lines)
  - [**(4) Comment Finder**](#comment-finder)
  - [**(5) Copy Lines**](#copy-lines)
  - [**(6) Create Lines**](#create-lines)
  - [**(7) Delete Lines**](#delete-lines)
  - [**(8) Duplicate Lines**](#duplicate-lines)
  - [**(9) Export Lines**](#export-lines)
  - [**(10) Format Lines**](#format-lines)
  - [**(11) HTML TABLE From ASS**](#html-table-from-ass)
  - [**(12) Manage Lines**](#manage-lines)
  - [**(13) Measure Lines**](#measure-lines)
  - [**(14) Select Lines**](#select-lines)
  - [**(15) Shaper**](#shaper)
  - [**(16) Strip Lines**](#strip-lines)
  - [**(17) Translator Info**](#translator-info)
  - [**(18) Translator Status**](#translation-status)
  - [**(19) Typewriter**](#typewriter)
- [**(D) ASS Files**](#ass-files)
  - [**(1) Autotags**](#autotags)
  - [**(2) Color Fade**](#color-fade)
  - [**(3) Rainbow**](#rainbow)
  - [**(4) Rand Color**](#rand-color)
  - [**(5) Shaper**](#shaper-1)
  - [**(6) T_Calc**](#t_calc)
  - [**(7) Vertical Kanji**](#vertical-kanji)

## INTRODUCTION
This page provides a download link to the lua plugins I write.

#### Features
- Multi-language

*All my lua plugin has two languages, Turkish and English. The English language is selected by default on the first boot-up. To change language, each lua plugin comes with a language change interface. On the automation submenu, hover over the name of the lua plugin which you want to change the language and click on the **Change Language** option.*

- Physically save interface preferences

*Preferences are saved to an external file for always remembering. The file is in the **%appdata%/aegisub/** directory. In portable Aegisub, it is saved where **aegisub.exe** is.*

#### Installation
* Installation directory of module file: **aegisub/automation/include/**
* Installation directory of lua files: **aegisub/automation/autoload/**

Move the module file and lua plugins to their own installation directories while the program is closed. You can move them while the program is open but you need to press **Automation/Automation.../Rescan Autoload Dir** button to enable them.

#### Usage
The lua plugins you install are added to the **Automation** submenu as a new item with a similar name to the file name. You can run the lua plugin by clicking on the name.

#### Supported Version
I've written all of my lua files in Aegisub 3.2.2, the latest stable version. You may have a problem with previous **3.x.x versions** but will definitely with **2.x.x versions**. If a new stable version of Aegisub comes out and there is an incompatibility problem with it, I going to fix it. I will always support the most recent stable release of Aegisub.

#### Shortcut
You can assign a shortcut to use the lua plugins more quickly. For this:
* Open **View/Options/Interface/Hotkeys**.
* Create a shortcut in the **Default**.

Wherever you are in the program, lua plugin starts to work when you press the shortcut.

## MODULE
I made a file to not write the functions I use repeatedly and to correct mistakes from one place. If you do not install the module, you can not use the lua plugins.

## MACROS

### [Break Lines](automation/autoload/mag.break_lines.lua)
Breaks the lines that are not breaked and must be breaked.

### [Case Conversion](automation/autoload/mag.case_conversion.lua)
Makes letter conversions.

### [Check Lines](automation/autoload/mag.check_lines.lua)
Detects technical problems.

### [Comment Finder](automation/autoload/mag.comment_finder.lua)
It finds notes and lists them in the interface. Also allows you to jump between them.

### [Copy Lines](automation/autoload/mag.copy_lines.lua)
Copies lines to clipboard or text file.

### [Create Lines](automation/autoload/mag.create_lines.lua)
Helps to create a line.

### [Delete Lines](automation/autoload/delete_lines.lua)
Deletes lines by style, actor or effect.

### [Duplicate Lines](automation/autoload/mag.duplicate_lines.lua)
Provides translation mode by duplicating lines.

### [Export Lines](automation/autoload/mag.export_lines.lua)
Creates a new subtitle file with selected lines based on specific filters.

### [Format Lines](automation/autoload/mag.format_lines.lua)
Adds italic, alignment and transparency tags.

### [HTML TABLE From ASS](automation/autoload/mag.html_table_from_ass.lua)
Converts lines to a html table. The html table is colorful and responsive.

### [Manage Lines](automation/autoload/mag.manage_lines.lua)
Facilitates various editing works.

### [Measure Lines](automation/autoload/mag.measure_lines.lua)
Adds percentage to effect box of applied lines. It is important to share translation.

### [Select Lines](automation/autoload/mag.select_lines.lua)
Selects lines in any way.

### [Shaper](automation/autoload/mag.shaper.lua)
Adds image, grid or quad to active line.

### [Strip Lines](automation/autoload/mag.strip_lines.lua)
Clears tags, extra whitespaces and things like them.

### [Translator Info](automation/autoload/mag.translator_info.lua)
Designed to write translator data with social media accounts.

### [Translation Status](automation/autoload/mag.translation_status.lua)
Shows the status of your translation.

### [Typewriter](automation/autoload/mag.typewriter.lua)
Helps typewriter-style typesettings.

## ASS Files
### [Autotags](ass/autotagsv4.ass)
Converts between two tag during the line.

### [Color Fade](ass/color_fade_v3.ass)
Makes horizontal color transition between two or more colors.

### [Rainbow](ass/rainbow_v2.ass)
Makes color transitions in rainbow color.

### [Rand Color](ass/randcolor.ass)
Specified colors applies to the karaoke lines either in sequence or randomly.

### [Shaper](ass/shaper.ass)
Draw shape based on subtitle or video resolution for picture.

### [T_Calc](ass/t_calc(v11).ass)
Converts from frame value to millisecond. You can change the color of the karaoke lines according to the scene.

### [Vertical Kanji](ass/vertical_kanji.ass)
Positions kanji characters vertically.