:: To help identify causes of BSOD
:: Use WinDBG, download the SDK and install only Debugging Tools for Windows -  https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/debugger-download-tools
:: After having enabled and BSOD have happend, you should find the dump at %SystemRoot%\Minidump or %SystemRoot%\MEMORY.DMP
wmic RECOVEROS set DebugInfoType = 1