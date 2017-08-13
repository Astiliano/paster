# Paster
*Basic concept Written in October 2013*

*This goes out to Todd from Umatilla*

*I'm sorry I yelled at your dog. Let me make it up to you https://youtu.be/x6QZn9xiuOE*

## Backstory tl;dr
Inventory Management: Turning 5x scans into 1x scan and 4x pastes (time saved increases by item #)

Everything else was added 1 by 1 as I needed them

## Different functions
You can find this if you right click on the taskbar icon under 'Instructions'


### Send Text
**The Idea:**
Selecting a window or application and being able to minimize it
and send text to it rather than Copy, switch window, paste
with this you can select a window, select text and send it.

In order to get used to this use `CTRL + ALT + F12`
(currently no exit key so just select something)

So once you select a window with `CTRL + F12` you will see
a little bubble letting you know "Successful Selection"

So now you can, for example, open a notepad window and 
select it with `CTRL + F12`

Then open Firefox, select text and press `CTRL + ALT + A`
which will send it to notepad even if it's minimized

CURRENTLY there are some issues sending it to the USB KVM software
it will not send characters that require SHIFT, be it capital or
punctuation. So instead of sending ? {Shift /} it will send /

### Windows [ Application Window Manipulation ]
**The Idea:**
First, having the ability to set any window as
"Always on Top" in order to prevent alt-tab spam
and window minimize/maximize wombo combo.

Additionally, solving the problem of using an
application (ex: Cygwin) where you will have
multiple instances running and have difficulty
keeping track of which window is which.

To keep a window on top of all the rest:
Select Window > `CTRL + SPACE`

To rename the title of a window:
Select Window > `ALT + SPACE`

Note:
Renaming a title will only stick as long as
there are no events that would change/refresh it.

Examples -
Putty changing title to username when using ssh

Saving a document (Refreshes name)

### Pasting (Perfect for KVM/ILO/Drac | Multiple clipboards )
**The Idea:**
To be able to select a list of text and be able to paste it
into either an application or window that requires Enter key to be pressed
after each value/string. 

Also this will seperate and create a list from 
text by the following characters:[TAB] [,] [SPACE] [ENTER]

--Send me an email if you want it to seperate additional characters--
This will also remove blanks and extra spaces EXCEPT if first line is blank.

In order to begin you copy normally:

`CTRL + C` or Right Click > Copy

To Start Past+Enter use:

`CTRL + WIN + V`

Which will take something like 1,2,3 and turn it into

1 [Enter Key]
2 [Enter Key]
3 [Enter Key]

During this you can press F1 to pause and ESC to stop. If pasting a Looong 
string and you press F1 it will pause AFTER it completes the string.

Also you can use:  `CTRL + ALT + V`

This will not parse the clipboard and send as-is

As an example, you can copy a script text and literally paste it into
a host "creating" the script by "typing" it out - I have tested this.
This is a great alternative for when `CTRL+V` cuts off in console.

Sometimes the default pasting speed is too fast for certain
uses, adjust the pasting delay by Right clicking and using the 
**Paste Delay** sub menu.

SETTINGS: RightClick Tray Icon > Settings 

To disable completion Beep or Paste Prompt
