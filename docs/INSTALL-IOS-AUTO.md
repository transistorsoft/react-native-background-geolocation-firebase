# iOS Auto-linking Instructions

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

### :open_file_folder: **`AppDelegate.mm`** (or __`AppDelegate.m`__):

> [!NOTE]  
> If you've already installed `react-native-firebase`, this step will already have been performed.

```diff
#import "AppDelegate.h"
.
.
.
+#import <FirebaseCore/FirebaseCore.h>

@implementation AppDelegate

 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.moduleName = @"example";
  // You can add your custom initial props in the dictionary below.
  // They will be passed down to the ViewController used by React Native.
  self.initialProps = @{};
  
+ [FIRApp configure];
  
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

```

### **`Google-Services-Info.plist`**

From your **Firebase Console**, copy your downloaded `Google-Services-Info.plist` file into your application:

![](https://dl.dropboxusercontent.com/s/4s7kfa6quusqk7i/Google-Services.plist.png?dl=1)

