# Flutter Platform Channels in Windows

This is a simple example in which I have tried to call a platform method from flutter on windows. We send 2 numbers through platform channel and get back the sum of the numbers.

## Flutter version
* Flutter 2.10.1
* Dart 2.16.1

## Files of interest
### Dart Side
The file platform.channel.dart in lib/common folder invokes the platform method. I've seperated this from the homepage so that it will be easier to find it. You don't have to worry about the other files in the homepage.

### Windows side
The file custom_channel.cpp in windows/runner folder handles the call. We just need to initialize the class in flutter_window.cpp file.   

**NOTE:** We can add all the functions in flutter_window.cpp itself.

## References
* https://stackoverflow.com/questions/67460070/flutter-desktop-windows-how-to-call-native-code-via-method-channel-make-api-c
* https://medium.com/flutter-community/using-flutter-method-channels-on-linux-2f6ae3e99653
* https://github.com/google/flutter-desktop-embedding/blob/master/plugins/window_size/windows/window_size_plugin.cpp
* https://www.dynamsoft.com/codepool/writing-cpp-flutter-barcode-plugin-windows.html