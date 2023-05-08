:: Only use this script and pow if you are unable to use or dont have it in your machine anymore.
:: All good settings if you have the plan activated already, are in another file, command per command. Not integrated into the file.
pushd "%~dp0"
pushd ..\configs\apps
powercfg -import "Ultimate Performance.pow" e9a42b02-d5df-448d-aa00-03f14749eb61
