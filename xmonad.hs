import XMonad
import XMonad.Util.Run(spawnPipe, runInTerm)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.FadeInactive
import XMonad.Actions.CycleWS
import qualified XMonad.StackSet as W
import System.IO
import qualified Data.Map as Map

myModMask = mod4Mask
lightBlue = "#073642"
orange = "#cb4b16"
red = "#dc322f"

myManageHook = gimpHook <+> manageDocks <+> manageHook defaultConfig
  where role = stringProperty "WM_WINDOW_ROLE"
        gimpHook = composeAll [(role =? "gimp-toolbox" <||> role =? "gimp-image-window") --> (ask >>= doF . W.sink)]

main = do
  xproc <- spawnPipe "xmobar ~/.xmobarrc"
  xmonad $ withUrgencyHook NoUrgencyHook defaultConfig
    { manageHook = myManageHook
    , layoutHook = avoidStruts $ layoutHook defaultConfig
    , modMask = myModMask
    , logHook = do
        fadeInactiveLogHook 0.85
        dynamicLogWithPP xmobarPP
          { ppOutput = hPutStrLn xproc
          , ppTitle = xmobarColor orange "" . shorten 100
          , ppUrgent = xmobarColor lightBlue orange . wrap ">" "<"
          }
    , focusFollowsMouse = False
    , keys = newKeys $ keys defaultConfig
    , borderWidth = 0
    , terminal = "terminator"
    }

xK_fnLeft = 0x1008ff11
xK_fnRight = 0x1008ff13
xK_fnDown = 0x1008ff03
xK_fnUp = 0x1008ff02

newKeys :: (XConfig Layout -> Map.Map (ButtonMask, KeySym) (X ()))
        -> (XConfig Layout -> Map.Map (ButtonMask, KeySym) (X ()))
newKeys x = \y -> Map.union (Map.fromList
  [ ((myModMask, xK_p), (spawn "dmenu_run  -fn \"-adobe-helvetica-medium-r-*-*-30-*-*-*-*-*-*-*\""))
  , ((0, xK_fnRight), (spawn "amixer sset Master 1%+"))
  , ((0, xK_fnLeft), (spawn "amixer sset Master 1%-"))
  , ((myModMask, xK_Down), (spawn "amixer sset Master toggle"))
  , ((controlMask .|. myModMask, xK_Left), (prevWS))
  , ((controlMask .|. myModMask, xK_Right), (nextWS))
  , ((controlMask .|. myModMask, xK_h), (prevWS))
  , ((controlMask .|. myModMask, xK_l), (nextWS))
  --, ((controlMask .|. myModMask, xK_Up), (XMonad.workspaces 1))
  --, ((controlMask .|. myModMask, xK_Down), (XMonad.workspaces 9))
  , ((myModMask, xK_x), (spawn "xlock -mode random -erasemode no_fade -echokeys"))
  , ((0, xK_fnUp), spawn "xbacklight +10")
  , ((0, xK_fnDown), spawn "xbacklight -10")
  ]) (x y)
