:: To help identify causes of BSOD
:: Use WinDBG, download the SDK and install only Debugging Tools for Windows -  https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/debugger-download-tools
:: After having enabled and BSOD have happend, you should find the dump at %SystemRoot%\Minidump or %SystemRoot%\MEMORY.DMP
:: Alternatively, visualize through this tool - https://www.nirsoft.net/utils/blue_screen_view.html

wmic recoveros set DebugInfoType = 3
wmic recoveros set AutoReboot = True
wmic recoveros set WriteToSystemLog = True
