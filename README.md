# Baklava Keyboard Layout with Yummy Layers

This is a shiny new version of QWERKey forked from (https://github.com/MicahElliott/QWERkey)
You might want to read the README.md there because I am only going a mention a few changes here.
![keymap diagram](https://github.com/jganong/QWERkey/blob/master/keyboard-layout.png)

To install this project, put the script "kb" into any directory in your PATH.

To activate it, run "baklava start".  To deactivate it, run "baklava" with no arguments.

All the keys (except CapsLock) keep working as they normally do without kb,
plus have some additional capabilities:

The spacebar acts as a Control key when you hold it down.

The CapsLock no longer works to lock the caps. It now emits Enter when you tap it, and when 
you hold down it down, it activates a new modifier I am calling CHARM.
When CHARM is in effect, it activates a layer where many movement keys are on the right hand.

When you hold down the Tab key it activates the QRK modifier as before in QWERKey.
All the QWRK symbols have been moved to the right hand, since the left hand is busy doing modifiers.

Shift-QWRK activates the FN-keys layer.

Shift-CHARM activates the numbers layer.

