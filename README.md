# Dotfiles
My personal stash of dotfiles.

## Installation
For an empty directory, installation is probably just as simple as
```
cd $HOME
git clone https://github.com/mjeromin/dotfiles.git .
```

## .bash_prompt
This controls the Bash prompt behavior, via `$PS1` and `$PROMPT_COMMAND` environment variables. It takes advantage of [color](https://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html) and [emoji](https://www.unicode.org/emoji/charts/full-emoji-list.html#1f600), since most terminals support this (see Tested section below). Features include: an exit code status emoji, an alarm clock emoji, mail notification emoji, trimmed working directory, current time, current git branch name (prepended with a `β`), number of commits ahead/behind (prepended with a +/-), the number of git stashes (prepended by a `Δ`), and a random emoji at the end of the prompt. For readability, these features are partitioned into prompt "trays", (ie. alerting tray, user tray, time tray, and git tray) 

![](.img/full-prompt1.png)
![](.img/root-prompt1.png)

#### Alarm Clock
This emoji is generated when the environment variable `ALARMCLOCK` is set to a 24-hour time `HH:MM` (ie. `ALARMCLOCK=15:45`). It is used to alert the user when the alarm time has exired by blinking the emoji. To turn off the clock, just unset this variable.

#### Dark theme
If your terminal uses a dark theme, you can switch the prompt to use a white font color by setting variable `DARK_THEME=1`

### Tested
The prompt has been tested for working emoji and color in [Fedora 28](https://getfedora.org/) on the following terminals:
* gnome-terminal
* konsole
* roxterm
* terminology
* mate-terminal
* pantheon-terminal
* lilyterm
* termit
* cool-retro-term (working emoji, obviously color is monochrome)

(Also tested good in gnome-terminal on Cygwin)

Unfortunately, these terminals (or at least the versions packaged with F28) do not seem to support emoji:
* qterminal
* Eterm
* xterm

## Licensing
Most of the files in this repo are public domain (see [PUBLIC DOMAIN](./LICENSE-PUBLICDOMAIN)) unless specified differently at the top of the file. When possible, I tried giving credit to any originators of public domain works in the comments.
