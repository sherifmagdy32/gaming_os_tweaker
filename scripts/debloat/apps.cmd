echo "Started debloat apps"

:: ====================================================================================================================================

:: Remove apps from windows
powershell "Get-AppxPackage -Allusers *Microsoft.BingWeather* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Getstarted* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *OfficeHub* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.BioEnrollment* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.MicrosoftEdgeDevToolsClient* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Windows.ParentalControls* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.XboxGameOverlay* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.XboxIdentityProvider* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.XboxGamingOverlay* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.XboxApp* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Xbox.TCUI* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.People* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.PeopleExperienceHost* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.SkypeApp* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Windows.Photos* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.WindowsAlarms* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.WindowsCamera* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *microsoft.windowscommunicationsapps* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.WindowsMaps* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *WindowsPhone* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Xbox* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.ZuneVideo* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.StorePurchaseApp* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *3DBuilder* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.YourPhone* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *StickyNotes* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *OneCalendar* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *OneConnect* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *ACG* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *CandyCrush* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *Facebook* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *Plex* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *Spotify* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *Twitter* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *Viber* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *3d* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *Reader* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.GetHelp* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.MixedReality.Portal* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Wallet* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Windows.NarratorQuickStart* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.XboxGameCallableUI* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Todos* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *OneDrive* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Microsoft3DViewer* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Windows.CallingShellApp* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.549981C3F5F10* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Minecraft* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.MicrosoftEdge* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.MicrosoftEdge.Stable* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *sway* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *holographic* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Office.OneNote* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *WebExperience* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.ScreenSketch* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *PowerAutomateDesktop* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Appconnector* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *CommsPhone* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *ConnectivityStore* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Messaging* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *MicrosoftPowerBIForWindows* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *NetworkSpeedTest* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.MSPaint* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Print3D* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Whiteboard* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *WindowsReadingList* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Clipchamp.Clipchamp* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *MicrosoftWindows.Client.WebExperience* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Windows.CBSPreview* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *MicrosoftTeams* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.WindowsFeedback* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Windows.ContactSupport* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.WindowsStore* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *SpotifyMusic* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.ZuneVideo* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *ACGMediaPlayer* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *ActiproSoftwareLLC* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *AdobePhotoshopExpress* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Amazon.com.Amazon* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Asphalt8Airborne* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *AutodeskSketchBook* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *BubbleWitch3Saga* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *CaesarsSlotsFreeCasino* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *COOKINGFEVER* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *CyberLinkMediaSuiteEssentials* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *DisneyMagicKingdoms* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Disney* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Dolby* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *DrawboardPDF* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Duolingo-LearnLanguagesforFree* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *EclipseManager* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *FarmVille2CountryEscape* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *FitbitCoach* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Flipboard* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *HiddenCity* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Hulu* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *iHeartRadio* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Keeper* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *LinkedInforWindows* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *MarchofEmpires* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Netflix* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *NYTCrossword* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *PandoraMediaInc* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *PhototasticCollage* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *PicsArt-PhotoStudio* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Plex* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *PolarrPhotoEditorAcademicEdition* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *RoyalRevolt* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Shazam* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Sidia.LiveWallpaper* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *SlingTV* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Speed Test* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *TuneInRadio* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *WinZipUniversal* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Wunderlist* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *XING* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *SAMSUNGELECTRONICSCO* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Advertising.Xaml* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.PrintDialog* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.WindowsCalculator* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.WebpImageExtension* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.WebMediaExtensions* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.VP9VideoExtensions* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.HEIFImageExtension* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Windows.CBSPreview* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Windows.ContentDeliveryManager* | Remove-AppxPackage"

:: Do not remove this, to install packages outside MS Store
:: powershell "Get-AppxPackage "Microsoft.DesktopAppInstaller" | Remove-AppxPackage -ErrorAction SilentlyContinue"

powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.ScreenSketch* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.MicrosoftStickyNotes* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.GetHelp* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.WindowsFeedbackHub* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *MicrosoftWindows.Client.WebExperience* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.YourPhone* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.XboxGameOverlay* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.BingWeather* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.Getstarted* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.Microsoft3DViewer* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.MicrosoftEdge.Stable* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.MicrosoftOfficeHub* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.549981C3F5F10* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.MicrosoftStickyNotes* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.MixedReality.Portal* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.MSPaint* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.Office.OneNote* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.People* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.StorePurchaseApp* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.SkypeApp* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.Wallet* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.Windows.Photos* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.WindowsAlarms* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.WindowsCamera* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *microsoft.windowscommunicationsapps* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.WindowsSoundRecorder* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.WindowsStore* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.Xbox.TCUI* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.XboxApp* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.XboxGameOverlay* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.XboxIdentityProvider* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.ZuneMusic* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.ZuneVideo* | Remove-AppxProvisionedPackage -online"

powershell "Get-WindowsPackage -Online | Where PackageName -like *QuickAssist* | Remove-WindowsPackage -Online -NoRestart"
powershell "Get-WindowsPackage -Online | Where PackageName -like *Hello-Face* | Remove-WindowsPackage -Online -NoRestart"

powershell "Get-WindowsOptionalFeature -Online | Where FeatureName -eq *WindowsMediaPlayer* | Disable-WindowsOptionalFeature -Online -NoRestart -WarningAction SilentlyContinue | Out-Null"
powershell "Get-WindowsOptionalFeature -Online | Where FeatureName -eq *WorkFolders-Client* | Disable-WindowsOptionalFeature -Online -NoRestart -WarningAction SilentlyContinue | Out-Null"
powershell "Get-WindowsOptionalFeature -Online | Where FeatureName -eq *Printing-XPSServices-Features* | Disable-WindowsOptionalFeature -Online -NoRestart -WarningAction SilentlyContinue | Out-Null"
powershell "Get-WindowsOptionalFeature -Online | Where FeatureName -eq *FaxServicesClientPackage* | Disable-WindowsOptionalFeature -Online -NoRestart -WarningAction SilentlyContinue | Out-Null"

powershell "Remove-Printer -Name "Fax" -ErrorAction SilentlyContinue"

powershell "Get-WindowsCapability -Online | Where Name -like *Media.WindowsMediaPlayer* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *MathRecognizer* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *Hello.Face* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *OpenSSH.Client* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *OpenSSH.Server* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *Print.Fax.Scan* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *Print.Management.Console* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *Microsoft.Windows.WordPad* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *App.StepsRecorder* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *OneCoreUAP.OneSync* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *Microsoft.Windows.PowerShell.ISE* | Remove-WindowsCapability -Online | Out-Null"
:: powershell "Get-WindowsCapability -Online | Where Name -like *Microsoft.Windows.MSPaint* | Remove-WindowsCapability -Online | Out-Null"
:: powershell "Get-WindowsCapability -Online | Where Name -like *Microsoft.Windows.Notepad* | Remove-WindowsCapability -Online | Out-Null"

powershell "Get-AppPackage -Allusers *MicrosoftWindows.Client.CBS* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Microsoft.Windows.SecureAssessmentBrowser* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Microsoft.CredDialogHost* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Microsoft.Windows.ParentalControls* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Microsoft.XboxGameCallableUI* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Microsoft.MicrosoftEdgeDevToolsClient* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Microsoft.Windows.PeopleExperienceHost* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Microsoft.Windows.NarratorQuickStart* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Microsoft.Win32WebViewHost* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Microsoft.Windows.XGpuEjectDialog* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Windows.PrintDialog* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Microsoft.MicrosoftEdge* | Remove-AppPackage"

:: ==============================================================================================================

:: Disable features from windows
DISM /Online /Disable-Feature /featurename:SNMP /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WMISnmpProvider /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Windows-Identity-Foundation /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:DirectoryServices-ADAM-Client /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-WebServerRole /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-WebServer /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-CommonHttpFeatures /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-HttpErrors /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-HttpRedirect /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ApplicationDevelopment /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-NetFxExtensibility /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-NetFxExtensibility45 /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-HealthAndDiagnostics /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-HttpLogging /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-LoggingLibraries /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-RequestMonitor /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-HttpTracing  /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-Security /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-URLAuthorization /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-RequestFiltering /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-IPSecurity /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-Performance /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-HttpCompressionDynamic /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-WebServerManagementTools /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ManagementScriptingTools /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-IIS6ManagementCompatibility /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-Metabase /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WAS-WindowsActivationService /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WAS-ProcessModel /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WAS-ConfigurationAPI /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-HostableWebCore /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-CertProvider /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-WindowsAuthentication /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-DigestAuthentication /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ClientCertificateMappingAuthentication /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-IISCertificateMappingAuthentication /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ODBCLogging /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-StaticContent /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-DefaultDocument /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-DirectoryBrowsing /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-WebDAV /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-WebSockets /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ApplicationInit /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ASPNET /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ASPNET45 /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ASP /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-CGI /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ISAPIExtensions /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ISAPIFilter /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ServerSideIncludes /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-CustomLogging /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-BasicAuthentication /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-HttpCompressionStatic /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ManagementConsole /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-ManagementService /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-WMICompatibility /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-LegacyScripts /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-LegacySnapIn /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-FTPServer /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-FTPSvc /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:IIS-FTPExtensibility /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MSMQ-Container /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MSMQ-Server /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MSMQ-Triggers /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MSMQ-ADIntegration /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MSMQ-HTTP /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MSMQ-Multicast /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MSMQ-DCOMProxy /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WCF-HTTP-Activation45 /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WCF-TCP-Activation45 /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WCF-Pipe-Activation45 /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WCF-MSMQ-Activation45 /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WCF-HTTP-Activation /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WCF-NonHTTP-Activation /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Microsoft-Windows-MobilePC-Client-Premium-Package-net /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Printing-XPSServices-Features /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:RasCMAK /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:RasRip /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MSRDC-Infrastructure /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:TelnetClient /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:TelnetServer /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:TFTP /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:TIFFIFilter /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:WorkFolders-Client /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:SMB1Protocol /Remove /NoRestart
DISM /Online /Disable-Feature /FeatureName:SMB1Protocol-Client /Remove /NoRestart
DISM /Online /Disable-Feature /FeatureName:SMB1Protocol-Server /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:SMB2Protocol /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Microsoft-Hyper-V-All /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Microsoft-Hyper-V-Tools-All /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Microsoft-Hyper-V /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Microsoft-Hyper-V-Management-Clients /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Microsoft-Hyper-V-Management-PowerShell /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MFaxServicesClientPackage /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:MediaPlayback /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:LegacyComponents /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Printing-PrintToPDFServices-Features /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Printing-Foundation-Features /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:Printing-Foundation-InternetPrinting-Client /Remove /NoRestart
DISM /Online /Disable-Feature /featurename:SmbDirect /Remove /NoRestart

:: ==============================================================================================================

:: It seems that even unrelated packages removal can cause other important softwares to stop working.
:: Disregard the list below
:: Ref1: https://forums.mydigitallife.net/threads/completely-eradicate-telemetry-defender-one-drive-cortana-and-other-things.63734/page-14#post-1304549

:: List all packages
:: install_wim_tweak.exe /o /l

:: Remove packages
:: install_wim_tweak.exe /o /c Microsoft-Windows-Internet-Browser-Package /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-ContactSupport /r
:: install_wim_tweak.exe /o /c Microsoft-PPIProjection-Package /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-ContentDeliveryManager /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-Store /r
:: install_wim_tweak.exe /o /c Windows-Defender /r

:: One said that removing Cortana through here will break Windows Search and may need to reinstall Windows, I havent tested, but maybe an optional package like Open-Shell will be enough to work.
:: install_wim_tweak.exe /o /c Microsoft-Windows-Cortana /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-Search2 /r

:: install_wim_tweak.exe /o /c Microsoft-Windows-SearchEngine /r
:: install_wim_tweak.exe /o /c Adobe-Flash /r
:: install_wim_tweak.exe /o /c Microsoft-Xbox /r
:: install_wim_tweak.exe /o /c Microsoft-Xbox-GameCallableUI /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-Backup /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-RetailDemo /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-InsiderHub /r
:: install_wim_tweak.exe /o /c Microsoft-OneCore-TroubleShooting /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-TroubleShooting /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-LanguageFeatures /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-Legacy /r
:: install_wim_tweak.exe /o /c Microsoft-OneCore-SpeechComponents /r
:: install_wim_tweak.exe /o /c Microsoft-OneCore-Gaming /r
:: install_wim_tweak.exe /o /c Microsoft-OneCore-Indexer /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-BioEnrollment /r
:: install_wim_tweak.exe /o /c Microsoft-OneCore-Biometrics /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-Printing-XPSServices /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-Xps /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-Geolocation /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-Compression /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-BusinessScanning /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-MediaPlayer /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-WindowsMediaPlayer /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-VirtualPC /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-VirtualXP /r
:: install_wim_tweak.exe /o /c Microsoft-Windows-OneDrive /r
:: install_wim_tweak.exe /o /c Microsoft-OneCore-AllowTelemetry /r

:: ==============================================================================================================

:: Disabled scheduled apps tasks
schtasks /delete /tn "Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\ProgramDataUpdater" /f
schtasks /delete /tn "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /f
schtasks /delete /tn "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /f
schtasks /delete /tn "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /f
schtasks /delete /tn "Microsoft\Windows\Shell\FamilySafetyMonitor" /f
schtasks /delete /tn "Microsoft\Windows\Shell\FamilySafetyRefresh" /f
schtasks /delete /tn "Microsoft\Windows\Shell\FamilySafetyUpload" /f
schtasks /delete /tn "Microsoft\Windows\Autochk\Proxy" /f
schtasks /delete /tn "Microsoft\Windows\Maintenance\WinSAT" /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\AitAgent" /f
schtasks /delete /tn "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /f
schtasks /delete /tn "Microsoft\Windows\FileHistory\File History (maintenance mode)" /f
schtasks /delete /tn "Microsoft\Windows\PI\Sqm-Tasks" /f
schtasks /delete /tn "Microsoft\Windows\AppID\SmartScreenSpecific" /f
schtasks /delete /tn "Microsoft\Windows\SettingSync\BackgroundUploadTask" /f
schtasks /delete /tn "Microsoft\Windows\AppID\SmartScreenSpecific" /f
schtasks /delete /tn "Microsoft\Windows\ApplicationData\CleanupTemporaryState" /f
schtasks /delete /tn "Microsoft\Windows\ApplicationData\DsSvcCleanup" /f
schtasks /delete /tn "Microsoft\Windows\ApplicationData\appuriverifierinstall" /f
schtasks /delete /tn "Microsoft\Windows\ApplicationData\appuriverifierdaily" /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\AitAgent" /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\ProgramDataUpdater" /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\StartupAppTask" /f
schtasks /delete /tn "Microsoft\Windows\Application Experience\PcaPatchDbTask" /f
schtasks /delete /tn "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /f
schtasks /delete /tn "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /f
schtasks /delete /tn "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /f
schtasks /delete /tn "Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /f
schtasks /delete /tn "Microsoft\Windows\Customer Experience Improvement Program\HypervisorFlightingTask" /f
schtasks /delete /tn "Microsoft\Windows\Customer Experience Improvement Program\Uploader" /f
schtasks /delete /tn "Microsoft\Windows\Diagnosis\Scheduled" /f
schtasks /delete /tn "Microsoft\Windows\DiskFootprint\Diagnostics" /f
schtasks /delete /tn "Microsoft\Windows\DiskFootprint\StorageSense" /f
schtasks /delete /tn "Microsoft\Windows\ErrorDetails\EnableErrorDetailsUpdate" /f
schtasks /delete /tn "Microsoft\Windows\Feedback\Siuf\DmClient" /f
schtasks /delete /tn "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /f
schtasks /delete /tn "Microsoft\Windows\File Classification Infrastructure\Property Definition Sync" /f
schtasks /delete /tn "Microsoft\Windows\Management\Provisioning\Logon" /f
schtasks /delete /tn "Microsoft\Windows\Maps\MapsToastTask" /f
schtasks /delete /tn "Microsoft\Windows\Maps\MapsUpdateTask" /f
schtasks /delete /tn "Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /f
schtasks /delete /tn "Microsoft\Windows\Multimedia\SystemSoundsService" /f
schtasks /delete /tn "Microsoft\Windows\NlaSvc\WiFiTask" /f
schtasks /delete /tn "Microsoft\Windows\NetCfg\BindingWorkItemQueueHandler" /f
schtasks /delete /tn "Microsoft\Windows\NetTrace\GatherNetworkInfo" /f
schtasks /delete /tn "Microsoft\Windows\Offline Files\Background Synchronization" /f
schtasks /delete /tn "Microsoft\Windows\Offline Files\Logon Synchronization" /f
schtasks /delete /tn "Microsoft\Windows\PI\Sqm-Tasks" /f
schtasks /delete /tn "Microsoft\Windows\Ras\MobilityManager" /f
schtasks /delete /tn "Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /f
schtasks /delete /tn "Microsoft\Windows\Servicing\StartComponentCleanup" /f
schtasks /delete /tn "Microsoft\Windows\Shell\FamilySafetyMonitor" /f
schtasks /delete /tn "Microsoft\Windows\Shell\FamilySafetyRefresh" /f
schtasks /delete /tn "Microsoft\Windows\SpacePort\SpaceAgentTask" /f
schtasks /delete /tn "Microsoft\Windows\SpacePort\SpaceManagerTask" /f
schtasks /delete /tn "Microsoft\Windows\Speech\SpeechModelDownloadTask" /f
schtasks /delete /tn "Microsoft\Windows\User Profile Service\HiveUploadTask" /f
schtasks /delete /tn "Microsoft\Windows\WCM\WiFiTask" /f
schtasks /delete /tn "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /f
schtasks /delete /tn "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /f
schtasks /delete /tn "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /f
schtasks /delete /tn "Microsoft\Windows\Windows Defender\Windows Defender Verification" /f
schtasks /delete /tn "Microsoft\Windows\Windows Error Reporting\QueueReporting" /f
schtasks /delete /tn "Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" /f
schtasks /delete /tn "Microsoft\Windows\Windows Media Sharing\UpdateLibrary" /f
schtasks /delete /tn "Microsoft\Windows\Wininet\CacheTask" /f
schtasks /delete /tn "Microsoft\Windows\Work Folders\Work Folders Logon Synchronization" /f
schtasks /delete /tn "Microsoft\Windows\Work Folders\Work Folders Maintenance Work" /f
schtasks /delete /tn "Microsoft\Windows\Workplace Join\Automatic-Device-Join" /f
schtasks /delete /tn "Microsoft\XblGameSave\XblGameSaveTask" /f
schtasks /delete /tn "Microsoft\XblGameSave\XblGameSaveTaskLogon" /f
schtasks /delete /tn "Driver Easy Scheduled Scan" /f
schtasks /delete /tn "Microsoft\Office\OfficeTelemetryAgentFallBack2016" /f
schtasks /delete /tn "Microsoft\Office\OfficeTelemetryAgentLogOn2016" /f
schtasks /delete /tn "Microsoft\Office\Office ClickToRun Service Monitor" /f
schtasks /delete /tn "Microsoft\Office\OfficeTelemetryAgentLogOn" /f
schtasks /delete /tn "Microsoft\Office\OfficeTelemetryAgentFallBack" /f
schtasks /delete /tn "Microsoft\Office\Office 15 Subscription Heartbeat" /f
schtasks /delete /tn "Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" /f
schtasks /delete /tn "Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" /f
schtasks /delete /tn "Microsoft\Windows\HelloFace\FODCleanupTask" /f
schtasks /delete /tn "Microsoft\Windows\Defrag\ScheduledDefrag" /f
schtasks /delete /tn "Microsoft\Windows\Clip\License Validation" /f
schtasks /delete /tn "Microsoft\Windows\UpdateOrchestrator\Schedule Scan" /f
schtasks /delete /tn "Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task" /f
schtasks /delete /tn "Microsoft\Windows\UpdateOrchestrator\UpdateModelTask" /f
schtasks /delete /tn "Microsoft\Windows\UpdateOrchestrator\USO_UxBroker" /f
schtasks /delete /tn "Microsoft\Windows\WindowsUpdate\Scheduled Start" /f
schtasks /delete /tn "Microsoft\Windows\Device Information\Device" /f
schtasks /delete /tn "Microsoft\Windows\Device Information\Device User" /f
schtasks /delete /tn "Microsoft\Windows\PerfTrack\BackgroundConfigSurveyor" /f
schtasks /delete /tn "Microsoft\Windows\Location\Notifications" /f
schtasks /delete /tn "Microsoft\Windows\Location\WindowsActionDialog" /f
schtasks /delete /tn "Microsoft\Windows\Retail Demo\CleanupOfflineContent" /f
schtasks /delete /tn "Microsoft\Windows\Shell\FamilySafetyRefreshTask" /f
schtasks /delete /tn "Microsoft\Windows\UPnP\UPnPHostConfig" /f
schtasks /delete /tn "Microsoft\Windows\WaaSMedic\PerformRemediation" /f
schtasks /delete /tn "Microsoft\Windows\Time Zone\SynchronizeTimeZone" /f
schtasks /delete /tn "Microsoft\Windows\Time Synchronization\SynchronizeTime" /f
schtasks /delete /tn "Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /f
schtasks /delete /tn "Microsoft\Windows\StateRepository\MaintenanceTasks" /f
schtasks /delete /tn "Microsoft\Windows\SoftwareProtectionPlatform\SvcRestartTaskNetwork" /f
schtasks /delete /tn "Microsoft\Windows\Shell\IndexerAutomaticMaintenance" /f
schtasks /delete /tn "Microsoft\Windows\Registry\RegIdleBackup" /f
schtasks /delete /tn "Microsoft\Windows\PushToInstall\LoginCheck" /f
schtasks /delete /tn "Microsoft\Windows\Printing\EduPrintProv" /f
schtasks /delete /tn "Microsoft\Windows\MUI\LPRemove" /f
schtasks /delete /tn "Microsoft\Windows\Management\Provisioning\Cellular" /f
schtasks /delete /tn "Microsoft\Windows\InstallService\SmartRetry" /f
schtasks /delete /tn "Microsoft\Windows\InstallService\ScanForUpdatesAsUser" /f
schtasks /delete /tn "Microsoft\Windows\InstallService\ScanForUpdates" /f
schtasks /delete /tn "Microsoft\Windows\DiskCleanup\SilentCleanup" /f
schtasks /delete /tn "Microsoft\Windows\Device Setup\Metadata Refresh" /f
schtasks /delete /tn "Microsoft\Windows\BrokerInfrastructure\BgTaskRegistrationMaintenanceTask" /f
schtasks /delete /tn "AMDInstallLauncher" /f
schtasks /delete /tn "AMDLinkUpdate" /f
schtasks /delete /tn "AMDRyzenMasterSDKTask" /f
schtasks /delete /tn "DUpdaterTask" /f
schtasks /delete /tn "ModifyLinkUpdate" /f
schtasks /delete /tn "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319" /f
schtasks /delete /tn "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64" /f
schtasks /delete /tn "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64 Critical" /f
schtasks /delete /tn "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 Critical" /f
schtasks /delete /tn "Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /f
schtasks /delete /tn "Microsoft\Windows\DUSM\dusmtask" /f
schtasks /delete /tn "Microsoft\Windows\EnterpriseMgmt\MDMMaintenenceTask" /f
schtasks /delete /tn "Microsoft\Windows\Flighting\FeatureConfig\ReconcileFeatures" /f
schtasks /delete /tn "Microsoft\Windows\Flighting\FeatureConfig\UsageDataFlushing" /f
schtasks /delete /tn "Microsoft\Windows\Flighting\FeatureConfig\UsageDataReporting" /f
schtasks /delete /tn "Microsoft\Windows\Flighting\OneSettings\RefreshCache" /f
schtasks /delete /tn "Microsoft\Windows\Input\LocalUserSyncDataAvailable" /f
schtasks /delete /tn "Microsoft\Windows\Input\MouseSyncDataAvailable" /f
schtasks /delete /tn "Microsoft\Windows\Input\PenSyncDataAvailable" /f
schtasks /delete /tn "Microsoft\Windows\Input\TouchpadSyncDataAvailable" /f
schtasks /delete /tn "Microsoft\Windows\International\Synchronize Language Settings" /f
schtasks /delete /tn "Microsoft\Windows\LanguageComponentsInstaller\Installation" /f
schtasks /delete /tn "Microsoft\Windows\LanguageComponentsInstaller\ReconcileLanguageResources" /f
schtasks /delete /tn "Microsoft\Windows\LanguageComponentsInstaller\Uninstallation" /f
schtasks /delete /tn "Microsoft\Windows\License Manager\TempSignedLicenseExchange" /f
schtasks /delete /tn "Microsoft\Windows\Printing\PrinterCleanupTask" /f
schtasks /delete /tn "Microsoft\Windows\PushToInstall\Registration" /f
schtasks /delete /tn "Microsoft\Windows\RetailDemo\CleanupOfflineContent" /f
schtasks /delete /tn "Microsoft\Windows\SettingSync\NetworkStateChangeTask" /f
schtasks /delete /tn "Microsoft\Windows\Setup\SetupCleanupTask" /f
schtasks /delete /tn "Microsoft\Windows\Setup\SnapshotCleanupTask" /f
schtasks /delete /tn "Microsoft\Windows\Storage Tiers Management\Storage Tiers Management Initialization" /f
schtasks /delete /tn "Microsoft\Windows\Sysmain\ResPriStaticDbSync" /f
schtasks /delete /tn "Microsoft\Windows\Sysmain\WsSwapAssessmentTask" /f
schtasks /delete /tn "Microsoft\Windows\Task Manager\Interactive" /f
schtasks /delete /tn "Microsoft\Windows\TPM\Tpm-HASCertRetr" /f
schtasks /delete /tn "Microsoft\Windows\TPM\Tpm-Maintenance" /f
schtasks /delete /tn "Microsoft\Windows\WDI\ResolutionHost" /f
schtasks /delete /tn "Microsoft\Windows\WlanSvc\CDSSync" /f
schtasks /delete /tn "Microsoft\Windows\WOF\WIM-Hash-Management" /f
schtasks /delete /tn "Microsoft\Windows\WOF\WIM-Hash-Validation" /f
schtasks /delete /tn "Microsoft\Windows\WwanSvc\NotificationTask" /f
schtasks /delete /tn "Microsoft\Windows\WwanSvc\OobeDiscovery" /f
schtasks /delete /tn "MicrosoftEdgeUpdateTaskMachineUA" /f
schtasks /delete /tn "MicrosoftEdgeUpdateTaskMachineCore" /f
schtasks /delete /tn "Microsoft\Windows\DirectX\DirectXDatabaseUpdater" /f
schtasks /delete /tn "Microsoft\Windows\BitLocker\BitLocker Encrypt All Drives" /f
schtasks /delete /tn "Microsoft\Windows\BitLocker\BitLocker MDM policy Refresh" /f
schtasks /delete /tn "Microsoft\Windows\DirectX\DXGIAdapterCache" /f
schtasks /delete /tn "Microsoft\Windows\USB\Usb-Notifications" /f
schtasks /delete /tn "Microsoft\Windows\DeviceDirectoryClient\IntegrityCheck" /f
schtasks /delete /tn "Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Refresh" /f
schtasks /delete /tn "Microsoft\Windows\Chkdsk\SyspartRepair" /f
schtasks /delete /tn "Microsoft\Windows\AppID\EDPPolicyManager" /f
schtasks /delete /tn "Microsoft\Windows\AppListBackup\Backup" /f
schtasks /delete /tn "Microsoft\Windows\Bluetooth\UninstallDeviceTask" /f
schtasks /delete /tn "Microsoft\Windows\Chkdsk\ProactiveScan" /f
schtasks /delete /tn "Microsoft\Windows\DeviceDirectoryClient\HandleCommand" /f
schtasks /delete /tn "Microsoft\Windows\DeviceDirectoryClient\HandleWnsCommand" /f
schtasks /delete /tn "Microsoft\Windows\DeviceDirectoryClient\LocateCommandUserSession" /f
schtasks /delete /tn "Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceAccountChange" /f
schtasks /delete /tn "Microsoft\Windows\DeviceDirectoryClient\RegisterDevicePolicyChange" /f
schtasks /delete /tn "Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceProtectionStateChanged" /f
schtasks /delete /tn "Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceSettingChange" /f
schtasks /delete /tn "Microsoft\Windows\DeviceDirectoryClient\RegisterUserDevice" /f
schtasks /delete /tn "Microsoft\Windows\CertificateServicesClient\SystemTask" /f
schtasks /delete /tn "Microsoft\Windows\CertificateServicesClient\UserTask" /f
schtasks /delete /tn "Microsoft\Windows\CertificateServicesClient\UserTask-Roam" /f
schtasks /delete /tn "Microsoft\Windows\EDP\EDPAppLaunchTask" /f
schtasks /delete /tn "Microsoft\Windows\EDP\EDPAuthTask" /f
schtasks /delete /tn "Microsoft\Windows\EDP\EDPInaccessibleCredentialsTask" /f
schtasks /delete /tn "Microsoft\Windows\EDP\StorageCardEncryptionTask" /f
schtasks /delete /tn "Microsoft\Windows\Shell\CreateObjectTask" /f
schtasks /delete /tn "Microsoft\Windows\Shell\ThemesSyncedImageDownload" /f
schtasks /delete /tn "Microsoft\Windows\Shell\UpdateUserPictureTask" /f


schtasks /change /tn "CreateExplorerShellUnelevatedTask" /enable
:: schtasks /change /tn "Microsoft\Windows\TextServicsFramework\MsCtfMonitor" /enable :: (keylogger) is required to be able to type within Settings and etc
:: schtasks /change /tn "Microsoft\Windows\RecoveryEnvironment\VerifyWinRE" /enable :: Leave this ON to diagnostic problems on boot


del /F /Q "C:\Windows\System32\Tasks\Microsoft\Windows\SettingSync\*"

:: ==============================================================================================================

:: Remove Windows Store
REG ADD "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsStore" /v RemoveWindowsStore /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsStore" /v DisableStoreApps /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PushToInstall" /v DisablePushToInstall /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SilentInstalledAppsEnabled /t REG_DWORD /d 0 /f
sc delete PushToInstall

:: Disable Text Input
taskkill /im "TextInputHost.exe" /t /f
RENAME "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy" "MicrosoftWindows.Client.CBS_cw5n1h2txyewy.bak"
