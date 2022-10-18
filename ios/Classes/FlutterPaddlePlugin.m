#import "FlutterPaddlePlugin.h"
#if __has_include(<flutter_paddle/flutter_paddle-Swift.h>)
#import <flutter_paddle/flutter_paddle-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_paddle-Swift.h"
#endif

@implementation FlutterPaddlePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterPaddlePlugin registerWithRegistrar:registrar];
}
@end
