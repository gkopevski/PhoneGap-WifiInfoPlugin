#import "WifiInfo.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import <Cordova/CDV.h>

@implementation WifiInfo

- (void)getInfo:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    
    
    CFArrayRef myArray = CNCopySupportedInterfaces();
    CFDictionaryRef myDict = CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(myArray, 0));
    //NSLog(@"Connected at:%@",myDict);
    NSDictionary *myDictionary = (__bridge NSDictionary*)myDict;
    
    NSString * BSSID = [myDictionary objectForKey:@"BSSID"];
    NSString * SSID = [myDictionary objectForKey:@"SSID"];
    
    NSString * response  = [NSString stringWithFormat:@"{ \"BSSID\":\"%@\",\"SSID\":\"%@\" }", BSSID, SSID];
    
    //NSLog(@"RESPONSE: %@",response);
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:response];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
