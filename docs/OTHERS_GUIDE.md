# Tools that help

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
    - It's also recommended to Uncheck the Core that you assigned to GPU in Interrupt Affinity, it helps with Frame Pacing. <https://github.com/amitxv/PC-Tuning/blob/main/docs/post-install.md#final-thoughts-and-tips>
  - Set Application Power Profile to Ultimate Performance scheme.
  - Main
    - Disable ProBalance.
  - Induce Performance Mode.
  - Go to More > Disable IdleSaver.
  - (Optional) CPU Limiter > When CPU is 98% > Reduce by this Many Cores 1 > For a period of 1 > Add Rule
  - Options > Power > Performance Mode
    - Uncheck change power plan when engaged
    - Uninstall Bitsum power plan
      - (Because it should use the Ultimate Performance plan only)
  - Options > Tools > System Timer Resolution > Set to 0.5 and check Set a every boot.
  - Options > Memory > SmartTrim Options
    - Enable SmartTrim
    - Enable Trim Working Sets
    - Enable Purge standby list and system file cache
    - Disable Only purge while in performance mode
    - Leave all values as default or customize on what works for you
- Done

---

## Interrupt Affinity Auto

I have built this script that can automatically assign cores to device and parent devices to all 3 main categories of devices, that is, Mouse, GPU and LAN.

It's also made to replace Interrupt affinity policy tool and MSI tool, or at least automate what you would do with them.

You can run with powershell and will ask to run as administrator.

Script can be found at [interrupt_affinity_auto.ps1](../scripts/optional_helpers/interrupt_affinity_auto.ps1)

---

## Interrupt Affinity Policy

- Download at <https://www.techpowerup.com/download/microsoft-interrupt-affinity-tool/>
- Alternative <https://github.com/spddl/GoInterruptPolicy>
- (Optional) You can find the best core to assign the GPU affinity with <https://github.com/amitxv/AutoGpuAffinity> or <https://github.com/spddl/AutoGpuAffinity>

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

> Before you read the rest, I found that PCI Bridge is not the best option at least for USB devices. Instead use AMD USB 3.10 extensible host controller. Goes by the name USB xHCI Compliant Host Controller. I didnt test to know that is correct or not.

> ~~I have been using the Core + Thread instead of just Core, since my CPU has Hyperthreading, and I dont know if that is the reason, the DPC avg are still the same, but the total DPC count are much lower.~~

> You can do with any devices you want, I particularly do with GPU, Mouse and Network.

Run `intPolicy_x64.exe` and use Device Manager, set View > Devices by Connection, Find the GPU and PCI-to-PCI Bridge and set to the same CPU, you can find the one if you go to Properties and Location in the General tab.

(Optional): You can also use Physical Device Object Name from Details and compare with DevObj Name from the tool.

For USB, if you do not know, go to Properties in the parent device, Details > Device description, that is the name, use the same Location. And follow the instructions.

For USB Mouse, it has been HID-compliant mouse. Add all if more than one.

You don't want to set the generic set that holds many values, like the PCI root.

---

## MSI tool

- Download v3 at <https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044/>
- If you applied my tweaks, all devices that support MSI will be enabled by default and all priority should be Undefined
- However accordingly to this person, not using MSI (but LineBased) for certain devices is beneficial, as well as setting the priority. <https://www.youtube.com/watch?v=6CB8P0-hJRQ> and <https://www.overclock.net/threads/msi-mode-disabled-for-network-adapter-works-much-better-than-enabled.1801132/>
- Particularly
  - I left all with MSI enabled except from the device from the Mouse and Ethernet
  - I set Mouse USB and Ethernet priority to High, rest I left as Undefined

---

## Timer Resolution / ISLC

> Optional, if you use Process Lasso, recently they added support for Timer Resolution, and they already have SmartTrim Options that does exactly the same as this tool, so no point in using this.

- Download at <https://www.wagnardsoft.com/forums/viewtopic.php?t=1256>
- I recommend checking BOTH options on the bottom left
- Set `0.0` on Wanted timer resolution and Check `Enable custom timer resolution` -
- Press `Start` and you are done

---

## A way to know your latency sensitivity

<https://www.youtube.com/watch?v=fE-P_7-YiVM>

---

## LAN Card option

A decent option if you have a LAN problem.

<https://www.asus.com/networking-iot-servers/wired-networking/all-series/xg-c100c/>

---

## NVME

### Samsung

If you have Samsung NVME, install the driver, it may bring speed improvements <https://www.guru3d.com/files-details/samsung-nvme-ssd-driver-download.html>

---

## Electromagnetic Interference or EMI

Another one that seems to affect input lag and how snappy the mouse and camera move feels, is interference in electricity or EMI. <https://forums.blurbusters.com/viewtopic.php?t=6498>

You can try buying a Line EMI Meter to measure Noise Voltage and AC Voltage. Also a EMF Meter to identify potential electromagnetic radiation. All to help you identify if there is a problem in your place.

---
