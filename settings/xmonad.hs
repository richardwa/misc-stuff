import XMonad
import XMonad.Core
import XMonad.Layout.NoBorders
import Graphics.X11.ExtraTypes.XF86
import Data.Map (fromList)
import Data.Monoid (mappend)
 
startup :: X()
startup = do
--  spawn "feh ~/.background.jpg"
--  spawn "xcompmgr -c &"
 return ()
volume x = spawn $ "amixer -q set Master " ++ x
backlight x = spawn $ "xbacklight " ++ x

myModMask = mod1Mask
myKeys = keys defaultConfig `mappend` 
  \c -> fromList [
     ((0, xF86XK_AudioMute ), volume "toggle" >> return ())
     , ((0, xF86XK_AudioLowerVolume ), volume "unmute" >> volume "4%-" >> return ())
     , ((0, xF86XK_AudioRaiseVolume ), volume "unmute" >> volume "4%+"  >> return ())
     , ((myModMask , xK_F10 ), volume "toggle" >> return ())
     , ((myModMask , xK_F11 ), volume "unmute" >> volume "4%-" >> return ())
     , ((myModMask , xK_F12 ), volume "unmute" >> volume "4%+"  >> return ())
     , ((myModMask , xK_F5 ), backlight "-5" >> return ())
     , ((myModMask , xK_F6 ), backlight "+5" >> return ())
  ]

main = do
  xmonad $ defaultConfig
    { terminal = "urxvt"
      , modMask = myModMask
      , startupHook = startup
      , layoutHook = smartBorders $ layoutHook defaultConfig
      , normalBorderColor = "#000000"
      , focusedBorderColor = "#0000ff"
      , keys = myKeys
    }

