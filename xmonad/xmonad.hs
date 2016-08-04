import           Data.Monoid
import           System.Exit
import           XMonad
import           XMonad.Util.Run
import           XMonad.Util.Cursor
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageHelpers

import qualified Data.Map        as M
import qualified XMonad.StackSet as W

myTerminal =  "gnome-terminal"  -- terminal

myFocusFollowsMouse :: Bool  -- whether focus follows the mouse pointer
myFocusFollowsMouse =True

myBorderWidth =  1  -- width of the window border in pixels

myModMask = mod4Mask  -- modkey: win

myWorkspaces =["code" ,"irc" ,"web"] -- the number of the workspace is determined by the
          -- length of this list

myNormalBorderColor = "#dddddd"
myFocusedBorderColor = "#646464"

myKeys conf@XConfig{XMonad.modMask = modm} = M.fromList $

  [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal  conf)
  , ((modm,               xK_p     ), spawn "dmenu_run -fn \"Monofur:italic:10\"")
  , ((modm .|. shiftMask, xK_c     ), kill)
  , ((modm,               xK_q     ), spawn "xmonad --recompile; xmonad --restart")
  , ((modm .|. shiftMask ,xK_q) ,io (exitWith ExitSuccess))]

myLogHook = dynamicLog

myStartupHook = do
  setDefaultCursor xC_left_ptr
  spawn "feh --bg-scale ~/something/dark-linux-bird-wallpaper.jpg"

main = xmonad =<< xmobar defaults

defaults = defaultConfig {
       terminal           = myTerminal
     , focusFollowsMouse  = myFocusFollowsMouse
     , borderWidth        = myBorderWidth
     , modMask            = myModMask
     , workspaces         = myWorkspaces
     , normalBorderColor  = myNormalBorderColor
     , focusedBorderColor = myFocusedBorderColor
     , keys               = myKeys
     , logHook            = myLogHook
     , startupHook        = myStartupHook
}
