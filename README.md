# Gaming OS Tweaker

> Attempts to debloat, keep low input lag, low latency and have improved performance.

```txt
I dont take responsability for any damage the scripts could cause.
Make sure you create a System Restore Point before running any scripts.
```

> Know that if you execute all the scripts, it will make your OS for games only, that is the focus. Dont expect to be usable for your everyday everything.

---

### How to

> If you need to download a fresh OS ISO directly from Microsoft, follow the guide at [WINDOWS_DOWNLOAD_GUIDE](/docs/WINDOWS_DOWNLOAD_GUIDE.md)

- Create a system restore point
- If you want apps instalation to be automated, install winget manually <https://github.com/microsoft/winget-cli/releases/> In Assets, Download `.msixbundle` and install it. You can improve the `apps/install.cmd` for yourself.
- In some scripts from `scripts/tweaks` folder, you might need to fill it up manually. All should be on top of each script. It should be `gpu.cmd`, `network.cmd` and `power.cmd`
- Run scripts from `scripts/debloat` folder first
- Run every script as administrator

> After running the scripts, follow some guides in `docs` folder. [GPU_DRIVER_GUIDE](/docs/GPU_DRIVER_GUIDE.md) and [OTHERS_GUIDE](/docs/OTHERS_GUIDE.md)

---

### Notes

- `scripts/apps` are optional helpers
- `scripts/additional_files` contain files like configurations

---

### Result

From a fresh Windows 10 22H2 install and completely updated, and applying all debloat and tweaks scripts, it was able to keep `41` processes, with Process Lasso and Nvidia Driver in the background, so it would be less than `40` if it were bare.

No additional tools were used.

It's a very clean OS, while being decently functional and being able to make Windows Update. You can reapply the scripts after an update. Task scheduler is also enabled.

---

### Why did I built this compilation of scripts?

Mostly, because I wanted a clean OS, with all the optimizations and I didnt trust the modified gaming OS out there. And It didnt feel that the other scripts out there were complete or clean enough.
People keep making big youtube videos or useless articles for very small parts of it, here you may get every part of what is possible. It doesnt mean it has everything and done, but it should be very close.

I dont take credit for the scripts, since I got parts of it from many different places. I didnt kept all the urls and I didnt wanted to give credit to some only, so end up not giving to anyone.

---

### Why I don't trust gaming modified windows OS?

Simply because as much as people tried to make it transparent by even putting it on github, some don't even do it, they just created a repo saying it's open-source.

Main point is, there is no way to know how the image (ISO) are being built, it's not transparent there, so whoever is responsible could use the opportunity to hide a rootkit in this part of the process, and no one would know, while keeping the argument that it was all open source. So, that's why.

It doesnt mean they arent trustworthy, I don't know them, it just means it's not transparent enough as it is.

<https://www.reddit.com/r/Windows10/comments/w54ign/am_i_out_of_my_mind_or_just_paranoid_ntlite_msmg/>

---

> I didnt have the opportunity to test every game. But if anyone find any issue, feel free to create an issue and/or PR.

> If you have any suggestions, additions or correction, feel free to create an issue and/or PR.

---

### Other

- An option, would be to remove services <https://learn.microsoft.com/en-us/dotnet/framework/windows-services/how-to-install-and-uninstall-services>
- Could be useful <https://github.com/riverar/mach2>
- RAM usage could be reduced if service drivers were looked into more completely. <https://processhacker.sourceforge.io/> and also doing more tweaks to kernel and memory management. <https://woshub.com/huge-memory-usage-non-paged-pool-windows/> <https://superuser.com/questions/394430/identifying-root-cause-of-high-ram-usage-in-paged-pool>
