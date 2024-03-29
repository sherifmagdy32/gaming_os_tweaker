# BIOS

## AMD

> Note: My own settings, some will be different depending on your hardware. Some did bring performance/fps improvement.

> Note2: There are even hidden BIOS settings that I currently am not using, if someone want to risk. <https://docs.google.com/document/d/1ILugrwtHfmisYzI1MdCOhSzBPuLJPi5D7xYJgQ4sxDM/edit#heading=h.aas727jxt9fk>

> Note3: Ideally you would want Infinite Fabric Clock (FCLK) and Memory Controller Clock (UCLK) the same as Memory Clock.

> BIOS UPDATE: Use Ez Flash Utility in BIOS setup instead of USB or their software, if you have the option, less potential problems.

- SVM Mode - **Disabled** (I keep Enabled due to using virtualization functionality in another OS)
- CSM - **Disabled**
- Fast Boot - **Disabled**
- Eco Mode - **Disabled**
- Monitor > CPU Fan Speed - **Disabled**
- Curve Optimizer - **All Cores, Negative 25**
- PBO Limits - **PPT 125, TDC 90, EDC 130 or Motherboard Limit** - (Just Auto with new CPU)
- Max CPU Boost Clock Override - **200mhz**
- Global C-State Control - **Disabled**
- Above 4G Decoding - **Enabled**
- Resize BAR Support - **Auto**
- Realtek LAN - **Disabled** (I also have Intel LAN)
- Wifi - **Disabled**
- Bluetooth - **Disabled**
- USB Power (S5) - **Disabled**
- AMD CoolnQuiet function aka (PSS Support) - **Disabled**
- AI Tweaks > AI Overclock Tuner - **DOCP**
- AI Tweaks > Memory Clock - **3800mhz**
- AI Tweaks > FCLK Frequency - **1900mhz** (to keep 1:1 stable)
- Select TPM Device - **Enable Firmware TPM** (if Windows 11)
- Monitor > Q-Fan Configuration > WATER PUMP+ Control and AIO Pump - **Auto**
- AMD CBS > NBIO > SMU > CCPC - **Disabled**
- AMD CBS > NBIO > SMU > Preferred - **Disabled**
- USB > XHCI handoff - **Disabled** (Optional, to turn usb 3.0 into 2.0. Feels less floaty and more responsive. Alternative is a External PCIe USB card)
- USB > Legacy USB Support - **Auto**
- AI Tweaker > Spread Spectrum - **Enabled** (Enable to help prevent/reduce EMI caused issues, like jitter. Check if cause input lag for you)
- AMD CBS > Prefetcher Settings > L1 and L2 Stream - **Enabled**
- NBIO Common Options > SMU Common Options > APBDIS - **1**
- NBIO Common Options > SMU Common Options > SOC P-State - **P0**
- NBIO Common Options > SMU Common Options > DF Cstates - **Disabled**
- NBIO Common Options > SMU Common Options > NBIO LCLK DPM - **Manual and all to 2**
- PEG ASPM - **Disabled**
- PCIe Clock Gating - **Disabled**

## Intel

- No info
