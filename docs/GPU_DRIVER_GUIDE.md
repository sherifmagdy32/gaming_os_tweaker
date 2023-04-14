# GPU

## Nvidia

- You can start with DDU if you have a driver installed
- Download at <https://www.guru3d.com/files-details/display-driver-uninstaller-download.html>
- Select your GPU as Nvidia
- Clean and Restart

After Restart

- Download at <https://www.techpowerup.com/download/techpowerup-nvcleanstall/>
- Download the nvidia driver that you want
- Open NVCleanstall and select Use driver files on Disk > Select the driver
- Next, I recommend the bare minimum `Display Driver (required)` only
- Next, 
 - Disable Installer Telemetry & Advertising 
 - Show Expert Tweaks [Disable driver telemetry + Disable HDCP]
- Next, Install
- Next every step, once you are finished with nividia installer, you can close the nvcleanstall

After

- Use nvidiaProfileInspector from `scripts/tools` or get at <https://github.com/Orbmu2k/nvidiaProfileInspector/releases>
- Import the `scripts/config/apps/low_latency.nip` and apply
- (Optional) there is a script that can do this automatically, at `scripts/optional_helpers`

**You are done!**

---

## AMD

> I dont have one to do it correctly. But some steps should be similar to nvidia.
