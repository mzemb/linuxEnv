# linuxEnv
my little linux env customisations


# what you get
1 gvim 
A little menu (or key bindings) linked to ctags and cscope that allows you to work efficiently with C code (search for
symbol, definition, call,...). It's a simple wrapper around ctags and csope.

2 bash
added features:
- "~/.bash_internal_history" : any bash command you type in a terminal will be appended to this file, with the full
path and the time of the command.
small aliases:
- fb: "Find Base": > fb <str> will list you files with <str> it their names
- fbi: "Find Base In" : > fbi <str> will list you files with <str> in their content.
- You'll also get a lot more of my little aliases and settings, you may want to edit the file ~/.bashrc to your taste
before using it.


# installation howto
> apt install gvim ctags cscope
> ./install.sh
(or just copy the files manually to your home dir)
I suggest you just source my bashrc at the end of yours to avoid loosing your current settings.


# usage
1 gvim
Before you can use the feature, you must first build the database ("DatabaseRebuild") in the menu.
Note that the add-on doesn't watch your files, so if you move/add/delete/modify some code, you'll need
to manually ask for an update.
Afterwards, just right-click on the code to open the interractive menu. (The keyboards shortcuts will be listed in the
menu).

2 bash
Main usage is through 'hh' bash function.
> hh
Will print the lasts lines of your eternal history file.
> hh <string>
Will print the last occurences containing the string from your eternal history file.
Of course you can also just edit your "~/.bash_eternal_history_file" manually.


# todo
- investigate on structure auto-completions
- correct error message on vim if cscope and ctags are not installed

