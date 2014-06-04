#import "WiFiInfo.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import <Cordova/CDV.h>

@implementation WiFiInfo

- (void)getInfo:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    CFArrayRef myArray = CNCopySupportedInterfaces();
    CFDictionaryRef myDict = CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(myArray, 0));
    NSLog(@"Connected at:%@",myDict);
    NSDictionary *myDictionary = (__bridge_transfer NSDictionary*)myDict;
    NSString * BSSID = [myDictionary objectForKey:@"BSSID"];
    NSLog(@"bssid is %@",BSSID);
    
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:BSSID];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end