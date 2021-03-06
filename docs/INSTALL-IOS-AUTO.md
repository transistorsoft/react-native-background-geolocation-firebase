# iOS Auto-linking Instructions

### `react-native >= 0.60`

### With `yarn`

```shell
$ yarn add react-native-background-geolocation-firebase
```

### With `npm`

```shell
$ npm install --save react-native-background-geolocation-firebase
```

To open your project in XCode, use the file `YourProject.xcworkspace` (**not** `YourProject.xcodeproj`)

### `pod install`

```bash
$ cd ios
$ pod install
```

### :open_file_folder: **`AppDelegate.m`**

:warning: **NOTE:**  If you've already installed `react-native-firebase`, this step will already have been performed.

```diff
#import "AppDelegate.h"
.
.
.
+#import <Firebase/Firebase.h>

@implementation AppDelegate

 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  NSURL *jsCodeLocation;

  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];

  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"FirebaseFoo"
                                               initialProperties:nil
                                                   launchOptions:launchOptions];
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
+ [FIRApp configure];
  return YES;
}

```

### **`Google-Services-Info.plist`**

:warning: **NOTE:** If you've already installed `react-native-firebase`, this step will already have been performed.

From your **Firebase Console**, copy your downloaded `Google-Services-Info.plist` file into your application:

![](https://dl.dropboxusercontent.com/s/4s7kfa6quusqk7i/Google-Services.plist.png?dl=1)

### :x: **`Issues?`**

```shell
Undefined symbols for architecture armv7: “_OBJC_CLASS_$_FIRApp”
```
During pod installation, you may see warnings related to `OTHER_LDFLAGS` or other flags. To fix the issue, select the target of your project and add `$(inherited)` flag in `Build Settings`. You can reference this [Stack Overflow issue](https://stackoverflow.com/questions/37344676/undefined-symbols-for-architecture-armv7-objc-class-firapp) for more details.