# GPU

## Nvidia

- You can start with DDU if you have a driver installed
- Download at <https://www.guru3d.com/files-details/display-driver-uninstaller-download.html>
- Select your GPU as Nvidia
- Clean and Restart

After Restart

- Get <https://www.techpowerup.com/download/techpowerup-nvcleanstall/>
- Download the nvidia driver that you want
- Open NVCleanstall and select Use driver files on Disk and select the driver
- Next, I recommend the bare minimum `Display Driver (required)` only
- Next, Disable Installer Telemtry & Advertising + Show Expert Tweaks [Disable driver telemetry + Disable HDCP]
- Next, Install
- Next every step, once you are finished with nividia installer, you can close the nvcleanstall

After

- Get MSI Util v3 at <https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044/>
- Open and set the GPU as High and Apply

After

- Use nvidiaProfileInspector from `scripts/additional_files` or get at <https://github.com/Orbmu2k/nvidiaProfileInspector/releases>
- Import the `scripts/additional_files/low_latency.nip` and apply

**You are done!**

---

## AMD

> I dont have one to do it correctly. But some steps should be similar to nvidia.
