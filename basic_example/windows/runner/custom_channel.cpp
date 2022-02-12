#include "flutter_window.h"
#include "flutter/generated_plugin_registrant.h"
#include <string>

#include <flutter/binary_messenger.h>
#include <flutter/standard_method_codec.h>
#include <flutter/method_channel.h>
#include <flutter/method_result_functions.h>
#include <flutter/encodable_value.h>
#include <../standard_codec.cc>

namespace custom_channels {
    class createChannelCalc {
        public:
        createChannelCalc(flutter::FlutterEngine *engine){initialize(engine);}
        // Takes care of the initial channel creation and registering the callback function
        void initialize(flutter::FlutterEngine *FlEngine){
            const static std::string channel_name("calc_channel");
            // We need to create codec, binary messenger and channel
            flutter::BinaryMessenger *messenger = FlEngine->messenger();
            const flutter::StandardMethodCodec *codec = &flutter::StandardMethodCodec::GetInstance();
            auto channel = std::make_unique<flutter::MethodChannel<>>(messenger ,channel_name ,codec);
            // Set a method handler this will be executed whenever we invoke MethodChannel from dart
            channel->SetMethodCallHandler(
            [&](const flutter::MethodCall<>& call, std::unique_ptr<flutter::MethodResult<>> result) {
                AddMethodHandlers(call,&result);
             }); 
        }
        // Handle the call
        void AddMethodHandlers(const flutter::MethodCall<>& call, std::unique_ptr<flutter::MethodResult<>> *result){
            // When a method has been invoked
            // Just identify the method requested & handover control to the function that handles it
            //
            // check the name of the method requested
            if (call.method_name().compare("add") == 0) {
               try {
                 // The add method has been called 
                 handleAdd(call,result);
               }catch (...) {
                 (*result)->Error("An error was caught");
               } 
            }
            // handle other else if conditions
            else {
                //If unknown method send NotImplemented() result
                (*result)->NotImplemented();
            }
       
        }

        // ADD FUNCTIONS THAT ACTUALLY HANDLE THE REQUESTED METHODS
        // Function to handle add method
        void handleAdd(const flutter::MethodCall<>& call, std::unique_ptr<flutter::MethodResult<>> *resPointer){
               // convert arguments passed to EncodableMap ;)
               const flutter::EncodableMap *argsList = std::get_if<flutter::EncodableMap>(call.arguments()); 
               //we will get values in pairs ie., first::"a" second::10.
               //we get the second part
               auto a_it = (argsList->find(flutter::EncodableValue("a")))->second;    
               auto b_it = (argsList->find(flutter::EncodableValue("b")))->second; 
               // Just converting it to int
               int a = static_cast<int>(std::get<int>((a_it)));
               int b = static_cast<int>(std::get<int>((b_it)));
               
               flutter::EncodableValue res ; // final result variable
               if(a && b){
                 // convert to string since we send back the result as string
                 std::string c = std::to_string(a+b);
                 res = flutter::EncodableValue("Sum is: " + c);
                // send positive result
                 (*resPointer)->Success(res);
               }else{
                // if not send error
                 (*resPointer)->Error("Error occured");
               }
        }
    };

}