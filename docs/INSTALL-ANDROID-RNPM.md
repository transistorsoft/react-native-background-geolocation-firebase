# Android Installation with `react-native link`

```shell
$ npm install --save react-native-background-geolocation-firebase
$ react-native link react-native-background-geolocation-firebase
```

## Gradle Configuration

RNPM does a nice job, but we need to do a bit of manual setup.

### :open_file_folder: **`android/build.gradle`**

```diff
buildscript {
    dependencies {
        classpath 'com.android.tools.build:gradle:2.3.3'
+        // NOTE:  If you've installed react-native-firebase, you should already have this included.
+        classpath 'com.google.gms:google-services:4.0.1'        
    }
}
allprojects {
    repositories {
        mavenLocal()
        jcenter()
        maven {
            // All of React Native (JS, Obj-C sources, Android binaries) is installed from npm
            url "$rootDir/../node_modules/react-native/android"
        }
        // Google now hosts their latest API dependencies on their own maven  server.  
        // React Native will eventually add this to their app template.
+       maven {
+           url 'https://maven.google.com'
+       }
+       maven {
+           url "$rootDir/../node_modules/react-native-background-geolocation-firebase/android/libs"
+       }
    }
}

/**
-* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-* !!! THE FOLLOWING IS OPTIONAL BUT HIGHLY RECOMMENDED FOR YOUR SANITY !!!
-* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
*
* Do you hate Gradle conflicts where other plugin require some particular
* version of play-services or define a compileSdkVersion, buildToolsVersion
* which conflicts with that of your app?  Me too!
*
* If you define these key gradle configuration variables globally, the 
* background-geolocation plugin (and any other "wise" plugins you've installed) 
* can align themselves to YOUR desired versions!  You should define these variables 
* as desired according to current values in your app/build.gradle
*
* You'll find that more and more plugins are beginning to wise up to checking 
* for the presense of global gradle variables like this.
*
* BackgroundGeolocation is aware of the following variables:
*/
+ext {
+    compileSdkVersion   = 26
+    targetSdkVersion    = 26
+    buildToolsVersion   = "26.0.2"
+    supportLibVersion   = "26.1.0"
+    googlePlayServicesVersion = "15.0.1" 
+}
```

### :open_file_folder: **`android/app/build.gradle`**

```diff

dependencies {
    .
    .
    .
}

// Run this once to be able to run the application with BUCK
// puts all compile dependencies into folder libs for BUCK to use
task copyDownloadableDepsToLibs(type: Copy) {
    from configurations.compile
    into 'libs'
}

+ // NOTE:  If you've installed react-native-firebase, you'll already have this added.
+ apply plugin: 'com.google.gms.google-services'
```

### :open_file_folder: **`google-services.json`**

:warning:  If you've installed `react-native-firebase`, you should already have performed this step.

Download your `google-services.json` from the *Firebase Console*.  Copy the file to your `android/app` folder.

## AndroidManifest.xml

:open_file_folder: **`android/app/src/main/AndroidManifest.xml`**

```diff
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.transistorsoft.backgroundgeolocation.react">

  <application
    android:name=".MainApplication"
    android:allowBackup="true"
    android:label="@string/app_name"
    android:icon="@mipmap/ic_launcher"
    android:theme="@style/AppTheme">

    <!-- react-native-background-geolocation licence -->
+   <meta-data android:name="com.transistorsoft.firebaseproxy.license" android:value="YOUR_LICENCE_KEY_HERE" />
    .
    .
    .
  </application>
</manifest>

```

:information_source: [Purchase a License](http://www.transistorsoft.com/shop/products/react-native-background-geolocation)
