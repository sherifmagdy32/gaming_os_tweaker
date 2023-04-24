# Tools that help

## Timer Resolution

- Download at <https://www.wagnardsoft.com/forums/viewtopic.php?t=1256>
- I recommend checking BOTH options on the bottom left
- Set `0.0` on Wanted timer resolution and Check `Enable custom timer resolution`
- Press `Start` and you are done

---

## Process Lasso

- Download at <https://bitsum.com/>
- Free version should be enough, It doesn't let or at least diminish so the machine doesnt hang on
heavy processes like games, it help to keep the OS more responsive, but more than that.
- While installing, choose only Core Engine to start at logon. GUI is not necessary.
- (Optional)
  - After Installing, with Process Lasso GUI opened, open YOUR_GAME, in the GUI Right Click YOUR_GAME.exe
    - CPU Priority > Always to High
    - I/O Priority > Always to High
    - CPU Affinity > Uncheck Core 0 in Always
    - Disable Windows dynamic thread priority boosts
  - Set Application Power Profile to Ultimate Performance scheme.
  - Main
    - Disable ProBalance.
  - Induce Performance Mode.
  - Go to More > Disable IdleSaver.
  - CPU Limiter > When CPU is 98% > Reduce by this Many Cores 1 > For a period of 1 > Add Rule
  - Options > Power > Performance Mode
    - Uncheck change power plan when engaged
    - Uninstall Bitsum power plan
- Done

---

## Interrupt Affinity Policy

- Download at <https://www.techpowerup.com/download/microsoft-interrupt-affinity-tool/>
- Alternative <https://github.com/spddl/GoInterruptPolicy>

### Guidelines

```txt
4 Cores 4 Processors: Set Mask for GPU and its PCI Bridge to CPU 2. Set Mask for USB to
CPU 3.
4 Cores 8 Processors: Set Mask for GPU and its PCI Bridge to CPU 4. Set Mask for USB to
CPU 6.
6 Cores 6 Processors: Set Mask for GPU and its PCI Bridge to CPU 2. Set Mask for USB to
CPU 4.
6 Cores 12 Processors: Set Mask for GPU and its PCI Bridge to CPU 4. Set Mask for USB to
CPU 8.
8 Cores 8 Processors: Set Mask for GPU and its PCI Bridge to CPU 2. Set Mask for USB to
CPU 4.
8 Cores 16 Processors: Set Mask for GPU and its PCI Bridge to CPU 4. Set Mask for USB to
CPU 8.
```

Run `intPolicy_x64.exe` and use Device Manager, set View > Devices by Connection, Find the GPU and PCI-to-PCI Bridge and set to the same CPU, you can find the one if you go to Properties and Location in the General tab.

For USB, if you do not know, go to Properties in the parent device, Details > Device description, that is the name, use the same Location. And follow the instructions.

For USB Mouse, it has been HID-compliant mouse. Add all if more than one.

You don't want to set the generic set that holds many values.

---
