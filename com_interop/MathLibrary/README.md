# Flutter Platform Channels in Windows
# Checking com interop from C# dll

## MathLibrary
* Make sure to set [assembly: ComVisible(true)] in AssemblyInfo.cs
* under build settings Register for com interop
* Build type choose x64 ('any cpu' fails)

## versions
* Microsoft Visual Studio Community 2019  
* C# Tools 3.5.0-beta4-2015