# Peripherals

## General

- If you dont have a external PCIe USB card, you want to use the best controller in the motherboard. One from CPU is faster, and from Chipset is slower. It would be better to have Mouse, Keyboard and Controller on the fast one. You can check the controllers available with USB Tree View. It seems that the first controller in the list is usually the best one. <https://www.uwe-sieber.de/usbtreeview_e.html> - <https://www.youtube.com/watch?v=82K3Pb0178g>

- (At your own risk), you can disable xCHI Interrupt Moderation for USB, mainly to benefit mouses. <https://github.com/BoringBoredom/PC-Optimization-Hub/blob/main/content/xhci%20imod/xhci%20imod.md>
  - Recently I built a script that does it automatically at `optional_helpers/interrupt_moderation_usb.ps1`

- Convert games or DPI sensitivity by using <https://www.mouse-sensitivity.com/>

- Keyboard measurements <https://github.com/mat1jaczyyy/Keyboard-Inspector> and <https://blog.seethis.link/scan-rate-estimator/>

## Mouse

- Best solution for mouse acceleration <https://github.com/a1xd/rawaccel>
- (Optional) <https://www.highrez.co.uk/downloads/xmousebuttoncontrol.htm> In Settings > Advanced
  - (Check) De-bounce (ignore) rapid mouse button clicks to 1ms
  - (Check) Fixup (debounce) tilt wheel auto-repeat - Repeat tilt rate to 1ms
  - CPU Priority to Realtime
- (At your own risk) You can overclock the USB mouse hz by following this tutorial <https://www.overclock.net/threads/usb-mouse-hard-overclocking-2000-hz.1589644/>
  - It should help reduce input lag / make it more responsive at some extent. <https://www.youtube.com/watch?v=x0wcJM4FtXQ> - <https://www.youtube.com/watch?v=ahsO5bhBUtk>
  - If you dont want to overclock, in some devices like controllers, you can at least reduce the input delay, by setting what will make bInterval to 1. <https://www.youtube.com/watch?v=_Sqgy95iAwE>

### Logitech

- If you have a Logitech mouse, sometimes might be better to not have their software running in the background.
- You can download their portable solution at <https://support.logi.com/hc/en-us/articles/360059641133>
