#!/bin/bash

cat << 'EOF' > /etc/nanorc
## Sample initialization file for GNU nano.
##
## For the options that take parameters, the default value is shown.
## Other options are unset by default.  To make sure that an option
## is disabled, you can use "unset <option>".
##
## Characters that are special in a shell should not be escaped here.
## Inside string parameters, quotes should not be escaped -- the last
## double quote on the line will be seen as the closing quote.

## Make 'nextword' (Ctrl+Right) and 'chopwordright' (Ctrl+Delete)
## stop at word ends instead of at beginnings.
# set afterends

## When soft line wrapping is enabled, make it wrap lines at blanks
## (tabs and spaces) instead of always at the edge of the screen.
# set atblanks

## Automatically indent a newly created line to the same number of
## tabs and/or spaces as the preceding line -- or as the next line
## if the preceding line is the beginning of a paragraph.
# set autoindent

## Back up files to the current filename plus a tilde.
# set backup

## The directory to put unique backup files in.
# set backupdir ""

## Use bold text instead of reverse video text.
# set boldtext

## Treat any line with leading whitespace as the beginning of a paragraph.
# set bookstyle

## The characters treated as closing brackets when justifying paragraphs.
## This may not include any blank characters.  Only closing punctuation,
## optionally followed by these closing brackets, can end sentences.
# set brackets ""')>]}"

## Automatically hard-wrap the current line when it becomes overlong.
# set breaklonglines

## Do case-sensitive searches by default.
# set casesensitive

## Constantly display the cursor position in the status bar.  Note that
## this overrides "quickblank".
# set constantshow

## Use cut-from-cursor-to-end-of-line by default.
set cutfromcursor

## Do not use the line below the title bar, leaving it entirely blank.
set emptyline

## Set the target width for automatic hard-wrapping and for justifying
## paragraphs.  If the specified value is 0 or less, the wrapping point
## will be the terminal's width minus this number.
# set fill -8

## Remember the used search/replace strings for the next session.
set historylog

## Display a "scrollbar" on the righthand side of the edit window.
# set indicator

## Scroll the buffer contents per half-screen instead of per line.
# set jumpyscrolling

## Display line numbers to the left (and any anchors in the margin).
set linenumbers

## Enable vim-style lock-files.  This is just to let a vim user know you
## are editing a file [s]he is trying to edit and vice versa.  There are
## no plans to implement vim-style undo state in these files.
set locking

## Fall back to slow libmagic to try and determine an applicable syntax.
# set magic

## The opening and closing brackets that can be found by bracket
## searches.  They cannot contain blank characters.  The former set must
## come before the latter set, and both must be in the same order.
# set matchbrackets "(<[{)>]}"

## Enable mouse support, if available for your system.  When enabled,
## mouse clicks can be used to place the cursor, set the mark (with a
## double click), and execute shortcuts.  The mouse will work in the X
## Window System, and on the console when gpm is running.
set mouse

## Switch on multiple file buffers (inserting a file will put it into
## a separate buffer).
# set multibuffer

## Don't convert files from DOS/Mac format.
# set noconvert

## Don't display the helpful shortcut lists at the bottom of the screen.
# set nohelp

## Don't automatically add a newline when a file does not end with one.
# set nonewlines

## Set operating directory.  nano will not read or write files outside
## this directory and its subdirectories.  Also, the current directory
## is changed to here, so any files are inserted from this dir.  A blank
## string means the operating-directory feature is turned off.
# set operatingdir ""

## Remember the cursor position in each file for the next editing session.
# set positionlog

## Preserve the XON and XOFF keys (^Q and ^S).
# set preserve

## The characters treated as closing punctuation when justifying
## paragraphs.  They cannot contain blank characters.  Only closing
## punctuation, optionally followed by closing brackets, can end
## sentences.
# set punct "!.?"

## Do quick status-bar blanking.  Status-bar messages will disappear after
## 1 keystroke instead of 26.  Note that "constantshow" overrides this.
# set quickblank

## Try to work around a mismatching terminfo terminal description.
# set rawsequences

## Fix Backspace/Delete confusion problem.
# set rebinddelete

## Do regular-expression searches by default.
## Regular expressions are of the extended type (ERE).
# set regexp

## Save a changed buffer automatically on exit; don't prompt.
# set saveonexit
## (The old form of this option, 'set tempfile', is deprecated.)

## Put the cursor on the highlighted item in the file browser, and show
## the cursor in the help viewer; useful for people who use a braille
## display and people with poor vision.
# set showcursor

## Make the Home key smarter.  When Home is pressed anywhere but at the
## very beginning of non-whitespace characters on a line, the cursor
## will jump to that beginning (either forwards or backwards).  If the
## cursor is already at that position, it will jump to the true
## beginning of the line.
# set smarthome

## Spread overlong lines over multiple screen lines.
# set softwrap

## Use this spelling checker instead of the internal one.  This option
## does not have a default value.
# set speller "aspell -x -c"

## Use the end of the title bar for some state flags: I = auto-indenting,
## M = mark, L = hard-wrapping long lines, R = recording, S = soft-wrapping.
set stateflags

## Allow nano to be suspended (with ^Z by default).
set suspendable
## (The old form of this option, 'set suspend', is deprecated.)

## Use this tab size instead of the default; it must be greater than 0.
set tabsize 4

## Convert typed tabs to spaces.
# set tabstospaces

## Snip whitespace at the end of lines when justifying or hard-wrapping.
# set trimblanks

## The two single-column characters used to display the first characters
## of tabs and spaces.  187 in ISO 8859-1 (0000BB in Unicode) and 183 in
## ISO-8859-1 (0000B7 in Unicode) seem to be good values for these.
## The default when in a UTF-8 locale:
# set whitespace "»·"
## The default otherwise:
# set whitespace ">."

## Detect word boundaries differently by treating punctuation
## characters as parts of words.
# set wordbounds

## The characters (besides alphanumeric ones) that should be considered
## as parts of words.  This option does not have a default value.  When
## set, it overrides option 'set wordbounds'.
# set wordchars "<_>."

## Let an unmodified Backspace or Delete erase the marked region (instead
## of a single character, and without affecting the cutbuffer).
set zap

## Paint the interface elements of nano.  These are examples;
## by default there are no colors, except for errorcolor.
set titlecolor bold,lightwhite,blue
# set statuscolor bold,lightwhite,green
# set errorcolor bold,lightwhite,red
# set selectedcolor lightwhite,magenta
# set stripecolor ,yellow
# set scrollercolor cyan
set numbercolor cyan
# set keycolor cyan
set functioncolor green

## In root's .nanorc you might want to use:
# set titlecolor bold,lightwhite,magenta
set statuscolor bold,lightwhite,magenta
set errorcolor bold,lightwhite,red
set selectedcolor lightwhite,cyan
set stripecolor ,yellow
set scrollercolor magenta
# set numbercolor magenta
set keycolor lightmagenta
# set functioncolor magenta


## === Syntax coloring ===
## For all details, see 'man nanorc', section SYNTAX HIGHLIGHTING.

## To include most of the existing syntax definitions, you can do:
include "/usr/share/nano/*.nanorc"

## Or you can select just the ones you need.  For example:
# include "/usr/share/nano/html.nanorc"
# include "/usr/share/nano/python.nanorc"
# include "/usr/share/nano/sh.nanorc"

## In /usr/share/nano/extra/ you can find some syntaxes that are
## specific for certain distros or for some less common languages.


## If <Tab> should always produce four spaces when editing a Python file,
## independent of the settings of 'tabsize' and 'tabstospaces':
# extendsyntax python tabgives "    "

## If <Tab> should always produce an actual TAB when editing a Makefile:
# extendsyntax makefile tabgives "      "


## === Key bindings ===
## For all details, see 'man nanorc', section REBINDING KEYS.

## The <Ctrl+Delete> keystroke deletes the word to the right of the cursor.
## On some terminals the <Ctrl+Backspace> keystroke produces ^H, which is
## the ASCII character for backspace, so it is bound by default to the
## backspace function.  The <Backspace> key itself produces a different
## keycode, which is hard-bound to the backspace function.  So, if you
## normally use <Backspace> for backspacing and not ^H, you can make
## <Ctrl+Backspace> delete the word to the left of the cursor with:
# bind ^H chopwordleft main

## If you would like nano to have keybindings that are more "usual",
## such as ^O for Open, ^F for Find, ^H for Help, and ^Q for Quit,
## then uncomment these:
bind ^Q exit all
bind ^S savefile main
bind ^W writeout main
#bind ^O insert main
#bind ^H help all
#bind ^H exit help
#bind ^F whereis all
#bind ^G findnext all
#bind ^B wherewas all
#bind ^D findprevious all
#bind ^R replace main
#bind M-X flipnewbuffer all
bind ^X cut all
bind ^C copy main
bind ^V paste all
#bind ^P location main
#bind ^A mark main
#unbind ^K main
#unbind ^U all
#unbind ^N main
#unbind ^Y all
#unbind M-J main
#unbind M-T main
#bind ^T gotoline main
#bind ^T gotodir browser
#bind ^Y speller main
#bind M-U undo main
#bind M-R redo main
#bind ^U undo main
#bind ^E redo main
#set multibuffer
EOF

cat ./.profile > /etc/skel/.profile

function setup_defaults() {
  username=$SETUP_1
  sleep 1
  echo "User: $username"
  password=$SETUP_2
  sleep 1
  useradd -m -s /bin/bash "$username"
  sleep 1
  echo "${username}:${password}" | chpasswd
  sleep 1
  echo "PW: $password"
  sleep 1
  usermod -a -G sudo ts
  sleep 1
  echo 'Installation complete'
}

setup_defaults
