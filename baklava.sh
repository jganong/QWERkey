#!/bin/sh

# wip
# Caps_Lock key is now ISO_Level3_Shift
# see example on H key, it can do 6 levels now.
# it works with matlab but not so much with xmonad.
# note the Shift-Tab-J generates one "4" but then goes dead
# not sure if this bug is related to this wip
# we could test it with the previous kb...
# did the test, and failed to reproduce the bug in either 
#
# BONUS! this seems fine to work with matlab -- Caps_Lock when tapped makes enter, and also works as a modifier, unlike ';'
 


case "$1" in
    stop) stop=1 ;;
    start) stop=1 ; start=1 ;;
    restart) stop=1 ; start=1 ;;
    help) help=1 ;;
    *) stop=1 ; start=1 ;;  ### with no args, restart. this is done because /etc/X11/xinit/xinitrc.d runs it with no args.
esac

if [ -n "$stop"  ] ; then
   pkill -x xcape  # don't have multiple xcape running!
   setxkbmap -layout 'us(intl)' # RESET for clean slate!!
fi

if [ -n "$start" ] ; then  


### xkbset -bell -feedback sticky -twokey latchlock
### xkbset exp 64 '=sticky' '=twokey' '=latchlock'


xmodmap - <<hereDoc

! ! ! unmodified shift qwrk Shift-qwrk charm Shift-charm
! ! ! lowercase uppercase printable function keys movement numbers
keycode 23 = Tab BackTab asciitilde NoSymbol NoSymbol NoSymbol
keycode 24 = q Q NoSymbol NoSymbol NoSymbol NoSymbol
keycode 25 = w W NoSymbol NoSymbol NoSymbol NoSymbol
keycode 26 = e E NoSymbol NoSymbol NoSymbol NoSymbol
keycode 27 = r R NoSymbol NoSymbol NoSymbol NoSymbol
keycode 28 = t T NoSymbol NoSymbol NoSymbol NoSymbol
keycode 29 = y Y ampersand NoSymbol NoSymbol 0
keycode 30 = u U NoSymbol F1 NoSymbol 1
keycode 31 = i I asterisk F2 Home 2
keycode 32 = o O asciitilde F3 End 3
keycode 33 = p P plus F10 Insert NoSymbol
keycode 34 = bracketleft braceleft parenleft F11 Delete NoSymbol
keycode 35 = bracketright braceright parenright F12 NoSymbol NoSymbol
keycode 38 = a A NoSymbol NoSymbol NoSymbol NoSymbol
keycode 39 = s S NoSymbol NoSymbol NoSymbol NoSymbol
keycode 40 = d D NoSymbol NoSymbol NoSymbol NoSymbol
keycode 41 = f F NoSymbol NoSymbol NoSymbol NoSymbol
keycode 42 = g G NoSymbol NoSymbol NoSymbol NoSymbol
keycode 43 = h H asciicircum F5 Left 5
keycode 44 = j J at F4 Down 4
keycode 45 = k K equal F5 Up 5
keycode 46 = l L bar F6 Right 6
keycode 48 = apostrophe quotedbl grave NoSymbol NoSymbol NoSymbol
! intl keyboard appears to set this one to deadgrave, which you have to hit twice, yuck
keycode 49 = grave asciitilde
keycode 50 = Shift_L Shift_L NoSymbol NoSymbol NoSymbol NoSymbol
keycode 52 = z Z NoSymbol NoSymbol NoSymbol NoSymbol
keycode 53 = x X NoSymbol NoSymbol NoSymbol NoSymbol
keycode 54 = c C NoSymbol NoSymbol NoSymbol NoSymbol
keycode 55 = v V NoSymbol NoSymbol NoSymbol NoSymbol
keycode 56 = b B NoSymbol NoSymbol NoSymbol NoSymbol
keycode 57 = n N numbersign NoSymbol Prior NoSymbol
keycode 58 = m M dollar F7 Next 7
keycode 59 = comma less asciicircum F8 NoSymbol 8
keycode 60 = period greater exclam F9 NoSymbol 9
keycode 61 = slash question backslash
keycode 62 = Shift_R Shift_R NoSymbol NoSymbol NoSymbol NoSymbol
!keycode 64 = Control_L
keycode 65 = space underscore minus
!keycode 66 = Control_R
!keycode 68 = F2 XF86Switch_VT_2 NoSymbol NoSymbol NoSymbol NoSymbol
keycode 8 = Tab NoSymbol Tab NoSymbol NoSymbol NoSymbol
keycode 47 = semicolon colon percent NoSymbol BackSpace NoSymbol
keycode 108 = Alt_L
remove lock = Caps_Lock 
hereDoc

anykey=255
tapifier() {
    ### this is inspired by the example in man xcape : but it assumes
    modkeysym=$1
    keycode=$2
    modifier=$3
    tapkeysym=$4
    extrakeysyms=$5
    synonymkeycodes=$6

for code in $keycode $synonymkeycodes
do
    xmodmap -e "keycode $code = $modkeysym" || printf "\nerror: tapifier %s\nat step: keycode %s = %s" "$*" "$code" "$modkeysym"

    # rather than being surgical, just try to remove all the modifiers from modkeysym, and ignore the fails
    for mod in shift lock control mod1 mod2 mod3 mod4 mod5 ; do
       xmodmap -e "remove $mod = $modkeysym" 2> /dev/null
    done
    if [ "$modifier" != "" ]
    then
        xmodmap -e "add $modifier = $modkeysym" || printf "\nerror: tapifier %s\nat step: add %s = %s" "$*" "$modifier" "$modkeysym"
    fi

    xmodmap -e "keycode $anykey = $tapkeysym $extrakeysyms"|| printf "\nerror: tapifier %s\nat step: keycode any = %s %s " "$*" "$tapkeysym" "$extrakeysyms"
done
    xcape -e "${modkeysym}=${tapkeysym}"
    anykey=$(( anykey -1 ))
}

tapifier Mode_switch 23 '' Tab 'BackTab'  ### '' is because Mode_switch is a special keysym, not a modifier


### tapifier Hyper_R 61 Shift slash 'question backslash'
### tapifier Shift_L 50 Shift Escape
# physical Shift_R still works as plain shift without next line
# tapifier Shift_R 62 Shift BackSpace
# this allows use of Shiht_R for tilde key
### tapifier Shift_R 49 Shift grave asciitilde

### temporary experimental
### i do not use any layer very much, except the symbol layer
### tapifier ISO_Level3_Shift 66 mod5 Return

xmodmap -e "clear control"
xmodmap -e "clear mod1"
xmodmap -e "add control = Control_L Control_R"
xmodmap -e "add mod1 = Alt_L"

tapifier Control_L 66 control Return ### tapifier defeats sticky somehow, i'll take it!

fi

if [ -n "$help" ] ; then
echo '
usage:
   baklava start # start baklava silently
   baklava restart # stop baklava silently & then start baklava silently
   baklava stop # stop baklava silently
   baklava help # print this message
   baklava # stop baklava, as failsafe if your keyboard is crazy & print help message
' >&2
fi


