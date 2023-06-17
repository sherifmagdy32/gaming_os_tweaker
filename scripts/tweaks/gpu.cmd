for /f "delims=" %%a in ('powershell -noprofile -c "Get-CimInstance -ClassName Win32_PnPEntity | where-object {$_.PNPClass -match 'Display'} | ForEach-Object { ($_ | Invoke-CimMethod -MethodName GetDeviceProperties).deviceProperties.where({$_.KeyName -EQ 'DEVPKEY_Device_Driver'}).data }"') do set "GPU_DEVICE_CLASS_GUID_WITH_KEY=%%a"

:: Both below are optional related to Monitor bits and scaling setup. Both can be easily configured in Nvidia Control Panel.
:: Open regedit > HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm\State\DisplayDatabase > Find your display name
:: SET "YOUR_DISPLAY_NAME=SAM105CH4ZR100198_05_07E5_3D"

:: Open regedit > HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Configuration > Find your display setup name
:: SET "YOUR_CURRENT_DISPLAY_SETUP=SAM105CH4ZR100198_05_07E5_3D+MSI3FA4102_02_07E2_85^B9F3AD2D02BBA69506A76D84134F5234"

:: ====================================================================================================================================

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v Affinity /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Background Only" /t REG_SZ /d True /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v BackgroundPriority /t REG_DWORD /d 18 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Clock Rate" /t REG_DWORD /d 10000 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "GPU Priority" /t REG_DWORD /d 12 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v Priority /t REG_DWORD /d 8 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Scheduling Category" /t REG_SZ /d High /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "SFIO Priority" /t REG_SZ /d High /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Latency Sensitive" /t REG_SZ /d True /f

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Affinity /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d False /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d 10000 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 12 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d 6 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d High /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d High /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Latency Sensitive" /t REG_SZ /d True /f

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v Affinity /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Background Only" /t REG_SZ /d False /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Clock Rate" /t REG_DWORD /d 10000 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "GPU Priority" /t REG_DWORD /d 12 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v Priority /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Scheduling Category" /t REG_SZ /d High /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "SFIO Priority" /t REG_SZ /d High /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Latency Sensitive" /t REG_SZ /d True /f

:: Disable nvidia tray icon
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\NvTray" /v StartOnLogin /t REG_DWORD /d 0 /f

:: Use advanced 3d image settings
REG ADD "HKEY_CURRENT_USER\Software\NVIDIA Corporation\Global\NVTweak" /v Gestalt /t REG_DWORD /d 2 /f

:: Do not display power saving in nvidia
REG ADD "HKEY_CURRENT_USER\Software\NVIDIA Corporation\Global\NVTweak" /v DisplayPowerSaving /t REG_DWORD /d 0 /f

:: Disable HDCP
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMHdcpKeyglobZero /t "REG_DWORD" /d 1 /f

:: DirectX tweaks
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D" /v DisableVidMemVBs /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D\Drivers" /v SoftwareOnly /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Direct3D\ReferenceDevice" /v AllowAsync /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectDraw" /v EmulationOnly /t REG_DWORD /d 0 /f

:: Disable hardware acceleration for debug and test
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Avalon.Graphics" /v DisableHWAcceleration /t REG_DWORD /d 1 /f

:: Enable hardware accelerated scheduling
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 2 /f

:: Before driver 451.48 was working, had less fps but snappier feeling on the input
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\nvlddmkm" /v DisableWriteCombining /t REG_DWORD /d 1 /f

:: Show low latency mode options in NVCP. Or did.
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\nvlddmkm\FTS" /v EnableRID73779 /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\nvlddmkm\FTS" /v EnableRID73780 /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\nvlddmkm\FTS" /v EnableRID74361 /t REG_DWORD /d 1 /f

:: Hide power saving
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v DisplayPowerSaving /t REG_DWORD /d 0 /f

:: Change to nvidia old sharpening filter
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\nvlddmkm\FTS" /v EnableGR535 /t REG_DWORD /d 0 /f

:: Unlock SILK Smoothness in older nvidia drivers
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v EnableRID61684 /t REG_DWORD /d 1 /f

:: Graphics Driver scheduler tweaks
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v VsyncIdleTimeout /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v EnablePreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v ForceFlipTrueImmediateMode /t REG_DWORD /d 1 /f

:: Graphics drivers tweaks
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DpiMapIommuContiguous /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrLevel /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrDelay /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrDebugMode /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrDdiDelay /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrDodPresentDelay /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrDodVSyncDelay /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrLimitCount /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrLimitTime /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v UseGpuTimer /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v RmGpsPsEnablePerCpuCoreDpc /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v PowerSavingTweaks /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DisableWriteCombining /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v EnableRuntimePowerManagement /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v PrimaryPushBufferSize /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v F1TransitionLatency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v D3PCLatency /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v RMDeepL1EntryLatencyUsec /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v PciLatencyTimerControl /t REG_DWORD /d 20 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v Node3DLowLatency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v LOWLATENCY /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v RmDisableRegistryCaching /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v RMDisablePostL2Compression /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v AdaptiveVsyncEnable /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v AllowDeepCStates /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v BuffersInFlight /t REG_DWORD /d 4096 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v ComputePreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v ComputePreemptionLevel /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v Disable_OverlayDSQualityEnhancement /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DisableAsyncPstates /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DisableCudaContextPreemption /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DisableDynamicPstate /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DisableGDIAcceleration /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DisableKmRender /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DisableKmRenderBoost /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DisableOverclockedPstates /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DisablePFonDP /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DisablePreemption /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DisablePreemptionOnS3S4 /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v EnableAggressivePStateBoost /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v EnableAggressivePStateOnly /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v EnableAsyncMidBufferPreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v EnableCEPreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v EnableDirectFlip /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v EnableIndependentFlip /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v EnableMidBufferPreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v EnableMidBufferPreemptionForHighTdrTimeout /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v EnableMidGfxPreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v EnableMidGfxPreemptionVGPU /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v EnablePerformanceMode /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v EnablePreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v EnableSCGMidBufferPreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v FlTransitionLatency /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v GPUPreemptionLevel /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v MonitorRefreshLatencyTolerance /t REG_DWORD /d 2710 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v PerfAnalyzeMidBufferPreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v PreferSystemMemoryContiguous /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v RmClkPowerOffDramPllWhenUnused /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v RMDeepLlEntryLatencyUsec /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v RmFbsrPagedDMA /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DefaultD3TransitionLatencyActivelyUsed /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DefaultD3TransitionLatencyIdleNoContext /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DefaultLatencyToleranceIdle0 /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DefaultLatencyToleranceNoContext /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DefaultLatencyToleranceTimerPeriod /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DisableOverlays /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v EnableWDDM23Synchronization /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v ForceDirectFlip /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v MonitorLatencyTolerance /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v MonitorRefreshLatencyTolerance /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v UnsupportedMonitorModesAllowed /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v UseXPModel /t REG_DWORD /d 0 /f
:: Reported to make drivers crash
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v PlatformSupportMiracast /t REG_DWORD /d 0 /f

:: Graphics driver power tweaks
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultD3TransitionLatencyActivelyUsed /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultD3TransitionLatencyIdleLongTime /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultD3TransitionLatencyIdleMonitorOff /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultD3TransitionLatencyIdleShortTime /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultD3TransitionLatencyIdleVeryLongTime /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultD3TransitionLatencyIdleNoContext /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultLatencyToleranceIdle0 /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultLatencyToleranceIdle0MonitorOff /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultLatencyToleranceIdle1 /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultLatencyToleranceIdle1MonitorOff /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultLatencyToleranceMemory /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultLatencyToleranceNoContext /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultLatencyToleranceNoContextMonitorOff /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultLatencyToleranceMemoryNoContext /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultLatencyToleranceOther /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultLatencyToleranceTimerPeriod /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultMemoryRefreshLatencyToleranceActivelyUsed /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultMemoryRefreshLatencyToleranceMonitorOff /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultMemoryRefreshLatencyToleranceNoContext /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v Latency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v MaxIAverageGraphicsLatencyInOneBucket /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v MiracastPerfTrackGraphicsLatency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v MonitorLatencyTolerance /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v MonitorRefreshLatencyTolerance /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v TransitionLatency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v UseGpuTimer /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v RmGpsPsEnablePerCpuCoreDpc /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v PowerSavingTweaks /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DisableWriteCombining /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v EnableRuntimePowerManagement /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v PrimaryPushBufferSize /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v F1TransitionLatency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v FlTransitionLatency /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v D3PCLatency /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v RMDeepLlEntryLatencyUsec /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v RMDeepL1EntryLatencyUsec /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v PciLatencyTimerControl /t REG_DWORD /d 20 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v Node3DLowLatency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v LOWLATENCY /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v RmDisableRegistryCaching /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v RMDisablePostL2Compression /t REG_DWORD /d 1 /f

:: Nvidia GPU tweaks
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PreferSystemMemoryContiguous /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v D3PCLatency /t REG_DWORD /d 1  /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v F1TransitionLatency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v LOWLATENCY /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v Node3DLowLatency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PciLatencyTimerControl /t REG_BINARY /d 20 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMDeepL1EntryLatencyUsec /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmGspcMaxFtuS /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmGspcMinFtuS /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmGspcPerioduS /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMLpwrEiIdleThresholdUs /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMLpwrGrIdleThresholdUs /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMLpwrGrRgIdleThresholdUs /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMLpwrMsIdleThresholdUs /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v VRDirectFlipDPCDelayUs /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v VRDirectFlipTimingMarginUs /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v VRDirectJITFlipMsHybridFlipDelayUs /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v vrrCursorMarginUs /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v vrrDeflickerMarginUs /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v vrrDeflickerMaxUs /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v NoFastLinkTrainingForeDP /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisablePFonDP /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v AdaptiveVsyncEnable /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v AllowDeepCStates /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v BuffersInFlight /t REG_DWORD /d 4096 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v ComputePreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v ComputePreemptionLevel /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableAcpPowerGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableAllClockGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableAsyncPstates /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableBlockWrite /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableCpPowerGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableCudaContextPreemption /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableDMACopy /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableDrmdmaPowerGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableDynamicPstate /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableGDIAcceleration /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableGDSPowerGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableGfxCGPowerGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableGfxClockGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableGFXPipelinePowerGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableGmcPowerGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableHdpClockPowerGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableHdpMGClockGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableKmRender /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableKmRenderBoost /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableOverclockedPstates /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisablePowerGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisablePreemption /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisablePreemptionOnS3S4 /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableSamuClockGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableSysClockGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableUVDPowerGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableVceClockGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableWriteCombining /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableXdmaPowerGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableXdmaSclkGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v Disable_OverlayDSQualityEnhancement /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DpiMapIommuContiguous /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableAggressivePStateBoost /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableAggressivePStateOnly /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableAsyncMidBufferPreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableCEPreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableDirectFlip /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableIndependentFlip /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableMidBufferPreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableMidBufferPreemptionForHighTdrTimeout /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableMidGfxPreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableMidGfxPreemptionVGPU /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnablePerformanceMode /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnablePreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableRuntimePowerManagement /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableSCGMidBufferPreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableUlps /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableVCNPreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v FlTransitionLatency /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v GPUPreemptionLevel /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v KMD_EnableComputePreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v KMD_EnableGfxMidCmdPreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v KMD_EnablePreemptionLogging /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v KMD_EnableSDMAPreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v KMD_PreemptionLevelLimit /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v MonitorLatencyTolerance /t REG_DWORD /d 1000 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v MonitorRefreshLatencyTolerance /t REG_DWORD /d 2710 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PerfAnalyzeMidBufferPreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PowerSavingTweaks /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PP_SclkDeepSleepDisable /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PP_ThermalAutoThrottlingEnable /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PrimaryPushBufferSize /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmClkPowerOffDramPllWhenUnused /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMDeepLlEntryLatencyUsec /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMDisablePostL2Compression /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmDisableRegistryCaching /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmFbsrPagedDMA /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmGpsPsEnablePerCpuCoreDpc /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v StutterMode /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v UseGpuTimer /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableOverlay /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableSystemMemoryTiling /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableTiledDisplay /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v ENABLE_OCA_LOGGING /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PCIEPowerControl /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PCIEPowerControl_8086191f50001458 /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMClkSlowDown /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMDisableGpuASPMFlags /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmDisableHdcp22 /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMEnableASPMAtLoad /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMEnableASPMDT /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmMIONoPowerOff /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmPerfRatedTdpLimit /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMSkipHdcp22Init /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmWotHdcpEnable /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v F1TransitionLatency /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMDeepL1EntryLatencyUsec /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableCoreSlowdown /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableMClkSlowdown /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableNVClkSlowdown /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RmDisableHwFaultBuffer /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v KMD_EnableGDIAcceleration /t REG_DWORD /d 1 /f
:: Keep k-boost limitation break disabled, otherwise it runs the GPU at full power even when idle
:: If one were to enable k-boost, the PerfLevelSrc value would need to be 2222, as it would keep clocks freq at fixed maximum
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PerfLevelSrc /t REG_DWORD /d 8738 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PowerMizerEnable /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PowerMizerLevel /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PowerMizerLevelAC /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v TCCSupported /t REG_DWORD /d 0 /f

:: AMD GPU tweaks
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v LTRSnoopL1Latency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v LTRSnoopL0Latency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v LTRNoSnoopL1Latency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v LTRMaxNoSnoopLatency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v KMD_RpmComputeLatency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DalUrgentLatencyNs /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v memClockSwitchLatency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PP_RTPMComputeF1Latency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PP_DGBMMMaxTransitionLatencyUvd /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PP_DGBPMMaxTransitionLatencyGfx /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DalNBLatencyForUnderFlow /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v BGM_LTRSnoopL1Latency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v BGM_LTRSnoopL0Latency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v BGM_LTRNoSnoopL1Latency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v BGM_LTRNoSnoopL0Latency /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v BGM_LTRMaxSnoopLatencyValue /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v BGM_LTRMaxNoSnoopLatencyValue /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v 3D_Refresh_Rate_Override_DEF /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v 3to2Pulldown_NA /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v AAF_NA /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v Adaptive De-interlacing /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v AllowRSOverlay /t REG_SZ /d "false" /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v AllowSkins /t REG_SZ /d "false" /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v AllowSnapshot /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v AllowSubscription /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v AntiAlias_NA /t REG_SZ /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v AreaAniso_NA /t REG_SZ /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v ASTT_NA /t REG_SZ /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v AutoColorDepthReduction_NA /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableSAMUPowerGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableUVDPowerGatingDynamic /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableVCEPowerGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableAspmL0s /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableAspmL1 /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableUlps /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableUlps_NA /t REG_SZ /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v KMD_DeLagEnabled /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v KMD_FRTEnabled /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableDMACopy /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableBlockWrite /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v StutterMode /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v EnableUlps /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PP_SclkDeepSleepDisable /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v PP_ThermalAutoThrottlingEnable /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v DisableDrmdmaPowerGating /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v KMD_EnableComputePreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v KMD_EnableReBarForLegacyASIC /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v KMD_RebarControlMode /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v KMD_RebarControlSupport /t REG_DWORD /d 1 /f

:: Force PCIe GEN3
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%" /v RMPcieLinkSpeed /t REG_DWORD /d 4 /f

:: Nvidia HD audio tweaks
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%\PowerSettings" /v ConservationIdleTime /t REG_DWORD /d 00000000 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%\PowerSettings" /v IdlePowerState /t REG_DWORD /d 00000000 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\%GPU_DEVICE_CLASS_GUID_WITH_KEY%\PowerSettings" /v PerformanceIdleTime /t REG_DWORD /d 00000000 /f

:: Setup bit from monitor
:: echo HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm\State\DisplayDatabase\%YOUR_DISPLAY_NAME% [3] >permissions.txt
:: REGINI permissions.txt
:: del permissions.txt
:: USE BASED IN YOUR MONITOR - Below is 8-bit Temporal and 10-bit Temporal is db010000101010204f4000000
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm\State\DisplayDatabase\%YOUR_DISPLAY_NAME%" /v DitherRegistryKey /t REG_BINARY /d db010000101010104f3000000 /f

:: Set scaling to No Scaling in Nvidia Control Panel
:: TODO: Find a way to automate this
:: https://docs.google.com/spreadsheets/d/1ZWQFycOWdODkUOuYZCxm5lTp08V2m7gjZQSCjywAsl8/edit#gid=168557452 - Another good tweak to have would be "Override the scaling mode"
:: REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Configuration\%YOUR_CURRENT_DISPLAY_SETUP%\00\00" /v Scaling /t REG_DWORD /d 2 /f

:: Disable display scaling
for /f %%i in ('REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /s /f Scaling') do set "str=%%i" & if "!str!" neq "!str:Configuration\=!" (
	REG ADD "%%i" /v Scaling /t REG_DWORD /d 1 /f
)

:: Tweak nvidia service
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v PerfAnalyzeMidBufferPreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v EnableMidBufferPreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v EnableAsyncMidBufferPreemption /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v DisablePreemption /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v DisableCudaContextPreemption /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v ComputePreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v EnableCEPreemption /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v RmGpsPsEnablePerCpuCoreDpc /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v NVFBCEnable /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v AllowMaxPerf /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v EnableMemoryTiling /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v EnableSystemMemoryTiling /t REG_DWORD /d 0 /f

:: Tweak directx driver service
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v MonitorLatencyTolerance /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v MonitorRefreshLatencyTolerance /t REG_DWORD /d 1 /f

:: Disable Variable refresh rate / Optimizations for windowed games (optional)
:: REG ADD "HKEY_CURRENT_USER\Software\Microsoft\DirectX\UserGpuPreferences" /v DirectXUserGlobalSettings /t REG_SZ /d "AutoHDREnable=0;VRROptimizeEnable=0;SwapEffectUpgradeEnable=0;" /f
:: REG ADD "HKEY_CURRENT_USER\Software\Microsoft\DirectX\GraphicsSettings" /v SwapEffectUpgradeCache /t REG_DWORD /d 0 /f