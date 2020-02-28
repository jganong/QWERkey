# Baklava Keyboard Layout with Yummy Layers

i did not make a binding for Escape, because you can do Ctrl-[ to get Escape, or Ctrl-C in vim

This is a shiny new version of QWERKey forked from (https://github.com/MicahElliott/QWERkey)
You might want to read the README.md there because I am only going a mention a few changes here.
![keymap diagram](https://github.com/jganong/QWERkey/blob/master/keyboard-layout.png)

To install this project, put the script "kb" into any directory in your PATH.

To activate it, run "baklava start".  To deactivate it, run "baklava" with no arguments.

All the keys (except CapsLock and Alt) keep working as they normally do without kb.

The Alt keys act as Control keys.

The CapsLock no longer works to lock the caps. It now emits Enter when you tap it, and when 
you hold down it down, it activates a new modifier I am calling CHARM.
When CHARM is in effect, it activates a layer where many movement keys are on the right hand.

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

