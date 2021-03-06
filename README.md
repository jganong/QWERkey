# Baklava -- Sweet Layered Keyboard Layout with Sticky Keys

This is a keyboard layout for X11, optimized for minimal reach, 
inspired by (https://github.com/MicahElliott/QWERkey) with the additon of sticky keys from xkbset.

![keymap diagram](https://github.com/jganong/QWERkey/blob/master/keyboard-layout.png)

The CapsLock key now serves as the Ctrl key.
All the keys (except CapsLock) work much as they do without baklava,
but with additional superpowers.

There is a variant called ```baklava.sh``` that is intended run automatically from ```/etc/X11/xinit/xinitrc.d/```. It has some different behaviour than traditional ```baklava``` as desribed in this README. 

```baklava.sh``` does not do sticky keys.  sticky keys are confusing unless some visual indicator is added.

```baklava.sh```, when run with no args, restarts rather than stops

One superpower is Sticky keys.

The Alt key and the Shift keys are sticky, which means if you tap and release it,
the next key you press will have modifier applied.
If you double tap, the modifier mode is locked.
Tapping it again clears its lock.

Ctrl would be sticky, but I find that annoying, because it makes the keyboard seem locked,
instead, it is set so that a single tap on Ctrl (labelled CapsLock) generates Enter.

All three of these modifiers (Ctrl, Alt, and Shift) can also
be used the traditional way where you hold down the modifier key & press another key. 

The other superpower is the Symbol modifier.  

Holdng down the Tab key activates the Symbol modifier, while pressing anohter key performs the Symbol modifier,
so you can get type the symbols shown in green in the keyboard map with your right hand,
without reaching far from the home row.  This gives all the symbols on a U.S. keyboard within easy reach of the homerow.

If you do an extremely long keypress on Ctrl or Tab, holding the key down long enough to exceed the xcape timeout,
these keys will latch and lock like Alt and Shift.  Tap them again to clear it.

I did not make a binding for Escape,
because you can do ```Ctrl-[``` to get Escape, or Ctrl-C in vim.

To install this project, install the "xcape" and "xkbset" packages from your package manager,
and put the script "baklava" into any directory in your PATH.
To activate it, run "baklava start".  To deactivate it, run "baklava" with no arguments.

You might want to read the (https://github.com/MicahElliott/QWERkey/README.md) because it motivates baklava.
That author's motivation was that he cannot reach very far with his fingers,
to he remapped his keyboard extensively, so that he can type using only keys that are easy to reach, as shown in this image:
![image of easy reach keys from QWERKey](https://raw.githubusercontent.com/MicahElliott/QWERkey/master/art/real-keyboard.png)
To me, main idea of QWERKey is that you can hack your way around some health issues.
For me, the main physical issue is that I have arthritis in my right elbow and left thumb.
I use Xmonad as my window manager because it is keyboard driven, greatly sparing my elbows from mouse pain.
The problem is that the default keybindngs just transfer the wear and tear to my left thumb.
Xmonad uses stretches like Alt-Shift-6, which was just annoying at first, but
become quite painful after a couple of years of using Xmonad.
This keybinding lets me use might right thumb for Alt, and it is sticky 
so I can press those keys one at a time, thus avoid the stretch.
