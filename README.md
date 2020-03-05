# Baklava Keyboard Layout with Yummy Layers

i did not make a binding for Escape, because you can do Ctrl-[ to get Escape, or Ctrl-C in vim

This is a shiny new version of QWERKey forked from (https://github.com/MicahElliott/QWERkey)
You might want to read the README.md there because I am only going a mention a few changes here.
![keymap diagram](https://github.com/jganong/QWERkey/blob/master/keyboard-layout.png)

To install this project, install the "xcape" and "xkbset" packages from your package manager,
and put the script "baklava" into any directory in your PATH.

To activate it, run "baklava start".  To deactivate it, run "baklava" with no arguments.

All the keys (except CapsLock and Alt) keep working as they normally do without kb.

If you hold down an Alt keys it does the Control modifier.  If you tap on either Alt key you get Enter.

The CapsLock no longer works to lock the caps. The CapsLock key now does the Alt modifier.
If you tap it, the Alt function is latched, so the next key you press will have Alt applied.
If you double tap it, the Alt mode is locked. Tapping Alt again clears its lock.

Similiarly, the Shift key latches when you tap it, and locks when you double tap it.

When you hold down the Tab key it activates the QRK modifier as before in QWERKey.
All the QWRK symbols have been moved to the right hand, since the left hand is busy doing modifiers.

Shift-QWRK activates the FN-keys layer.

Shift-CHARM activates the numbers layer.

TO SWITCH TO A VIRTUAL CONSOLE

Enable function keys ( Fn-Esc on my thinkpad lights up a green LED on the Fn
key)

ctrl+Alt_L F2      or     space+Alt_L+F2

TO GO BACK TO X11

ctrl+Alt_L+F1      or     space+L+Alt_L+F1

weird thing to note that space+L+Alt_L+F1 works to
get back from the console, because space is mapped
to control in X, so why does it work in console?
i rebooted and it it still works before starting x,
so i guss it is just a feature of the console.
it appears that the console switches on alt-FN so the space key is irrelevant in cosole.

