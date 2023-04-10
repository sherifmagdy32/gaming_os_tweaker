# Gaming OS Tweaker

> Attempts to debloat, keep low input lag, low latency and have improved performance.

```txt
I am not responsible for any damage the scripts could cause.

Make sure you create a System Restore Point before running any scripts.
```

> Know that if you execute all the scripts, it will make your OS for games only, that is the focus. Dont expect to be usable for your everyday everything.

---

### How to

> If you need to download a fresh OS ISO directly from Microsoft, follow the guide at [WINDOWS_DOWNLOAD_GUIDE](/docs/WINDOWS_DOWNLOAD_GUIDE.md)

- Create a system restore point
- In some scripts from `scripts/tweaks` folder, you might need to fill it the values from your machine manually.
  - It should be `gpu.cmd`, `network.cmd` and `power.cmd`.
  - It's on top of each script.
- Run scripts from `scripts/debloat` folder first
- Run every script as administrator

> After running the scripts, follow some guides from the `docs` folder. [GPU_DRIVER_GUIDE](/docs/GPU_DRIVER_GUIDE.md) and [OTHERS_GUIDE](/docs/OTHERS_GUIDE.md)

---

### Result

From a fresh Windows 10 22H2 install and completely updated, and applying the scripts from this repo, it was reduced to `33` processes, with Nvidia Driver (debloated) in the background.

No additional tools were used.

It's a very clean OS, while being decently functional and being able to make Windows Update(s). You can reapply the scripts after an update. Task scheduler, UAC and Firewall are kept enabled.

In my 5800X3D, the average DPC Latency are at `0.7`. Maybe with a high-end Intel that would be even less. Though latest nvidia drivers are having high dpc issues, and they have recognized and are working on it, when they fix, maybe even with Ryzen will be less in the average. With the CPU idle state disabled, it was able to go to `0.5`, but the average fps in Overwatch 2 for example were less than when enabled.

Good reference:  <https://docs.google.com/document/d/1ILugrwtHfmisYzI1MdCOhSzBPuLJPi5D7xYJgQ4sxDM/edit#heading=h.mjyvqzxoctd0>

To give some perspective on the FPS, before I was on Win11 only with some tweaks and debloat changes. I had to use the nvidia driver optimized for Overwatch 2 to be able to keep consistent 420fps at 1440p with pretty much no dips, but were not possible with other driver versions. Now in Win10 with the scripts from this repo, it never goes below 500fps, stays on 600fps when there is no fights and 540fps~ in mid fights most of the time, and I am using the latest driver from nvidia, not the optimized for Overwatch 2.

![processes](./docs/processes.png)

---

### Why did I built this compilation of scripts?

Mostly, because I wanted a clean OS, with all the optimizations and I didnt trust the modified gaming OS out there. And It didnt feel that the other scripts out there were complete or clean enough.

I dont take credit for the scripts, since I got parts of it from many different places. I didnt kept all the urls and I didnt wanted to give credit to some only, so end up not giving to anyone.

People keep making big youtube videos or articles for very small chunks or single tweak(s), good ones are the minority. Some may even charge for this kind of tweaking.

---

### Why I don't trust gaming modified windows OS?

Simply because as much as people tried to make it transparent by even putting it on github, some don't even do it, they just create a repo saying it's open-source.

Main point is, there is no way to know how the image (ISO) are being built, it's not transparent there, so whoever is responsible could use the opportunity to hide a rootkit in this part of the process, and no one would know, while keeping the argument that it was all open source. So, that's why.

It doesnt mean they arent trustworthy, I don't know them, it just means it's not transparent enough as it is.

<https://www.reddit.com/r/Windows10/comments/w54ign/am_i_out_of_my_mind_or_just_paranoid_ntlite_msmg/>

---

### Anti-Cheats

- Defense Matrix (Overwatch 2) - Working
- Easy Anti-Cheat (Fortnite, Apex Legends) - Working
- Ricochet (Call of Duty) - Working
- Punkbuster (BF4) - Working
- Vanguard (Valorant) - Not Working
  - Game does open, but it requires Exploit Protections and most were disabled, but they can be enabled again, not sure how it would go with no Windows Defender though.
  - <https://support-valorant.riotgames.com/hc/en-us/articles/4406555340179-How-to-Enable-Exploit-Protection-and-Prevent-Error-Code-VAN9002>
- FaceIT (CSGO) - Not Tested
  - But, it seems that might be similar to Vanguard in terms of requirements. I dont play the game to know.
- BattleEye (Escape from Tarkov) - Not Tested

**You can try the `anticheat_fix.cmd` script inside `scripts/optional_helpers/` folder.**

> I didnt have the opportunity to test every game, but most without Anti Cheats should be working, except maybe VR/Mixed Reality. If anyone find any issue, feel free to create an issue and/or PR.

> If you have any suggestions, additions or corrections, feel free to create an issue and/or PR.

---

### Other

- An option, would be to remove services
  - <https://learn.microsoft.com/en-us/dotnet/framework/windows-services/how-to-install-and-uninstall-services>
- RAM usage could be reduced if service drivers were looked into more completely.
  - <https://systeminformer.sourceforge.io/>
  - <https://woshub.com/huge-memory-usage-non-paged-pool-windows/>
  - <https://superuser.com/questions/394430/identifying-root-cause-of-high-ram-usage-in-paged-pool>
- Scheduling Priorities seem to have hard locks done by the OS, there is a way to undo those, but the tool recommended has a lot of red flags related to trojan. Maybe if built manually it would be worth using.
  - <https://www.youtube.com/watch?v=-jYnDuK-vB0>
  - <https://learn.microsoft.com/en-us/windows/win32/procthread/scheduling-priorities>
  - <https://github.com/katlogic/WindowsD>
  - <https://docs.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-setpriorityclass>

- Tools that could be useful
  - <https://msfn.org/board/topic/152688-win6x_registry_tweak/> - To remove apps not possible with powershell
  - <https://github.com/riverar/mach2>
  - <https://github.com/M2Team/NanaRun>
  - <https://www.zeus-software.com/downloads/ntfsaccess>
  - <https://github.com/Chuyu-Team/Dism-Multi-language>
  - <https://github.com/he3als/setSvc>
  - <https://www.snappy-driver-installer.org>
