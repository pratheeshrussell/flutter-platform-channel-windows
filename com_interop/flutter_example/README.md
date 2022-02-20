# Flutter Platform Channels in Windows
# Checking com interop from C# dll

In this example I have called a C# function via com interop using platform channel.

## Flutter version
* Flutter 2.10.1
* Dart 2.16.1

## Files of interest
### Dart Side
The file platform.channel.dart in lib/common folder invokes the platform method. The multiply method calls the platform method of interest

### Windows side
The file custom_channel.cpp in windows/runner folder handles the call. We just need to initialize the class in flutter_window.cpp file.   

I have shown 3 methods to connect to the com interface. Use the one that is suitable.

**NOTE:** I have added the MathLibrary.tlb from the C# build to windows/runner/bin folder

## References
Check out the basic_example before trying the com interop