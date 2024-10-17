# Android Auto-linking Installation

### `react-native >= 0.60`

### With `yarn`

```shell
$ yarn add react-native-background-geolocation-firebase
```

### With `npm`

```shell
$ npm install --save react-native-background-geolocation-firebase
```

## Gradle Configuration

### :open_file_folder: **`android/build.gradle`**

```diff
buildscript {    
    ext {        
        minSdkVersion = 16
        compileSdkVersion = 34
        targetSdkVersion = 34
        googlePlayServicesLocationVersion = "21.3.0"
+       FirebaseSDKVersion  = "33.4.0"          // or as desired.

    }
}

allprojects {
    repositories {
        // Required for react-native-background-geolocation
        maven { url("${project(':react-native-background-geolocation').projectDir}/libs") }
        maven { url 'https://developer.huawei.com/repo/' }
        // Required for react-native-background-fetch
        maven { url("${project(':react-native-background-fetch').projectDir}/libs") }

+       // Required react-native-background-geolocation-firebase
+       maven { url("${project(':react-native-background-geolocation-firebase').projectDir}/libs") }
    }
}
```

> [!NOTE]  
> the param __`ext.FirebaseSdkVersion`__ controls the imported version of the *Firebase SDK* (`com.google.firebase:firebase-bom`).  Consult the [Firebase Release Notes](https://firebase.google.com/support/release-notes/android?_gl=1*viqpog*_up*MQ..*_ga*MTE1NjI2MDkuMTcyOTA4ODY0MQ..*_ga_CW55HF8NVT*MTcyOTA4ODY0MS4xLjAuMTcyOTA4ODY0MS4wLjAuMA..#latest_sdk_versions) to determine the latest version of the *Firebase* SDK


### :open_file_folder: **`android/settings.gradle`**
- Add the `google-services` plugin (if you haven't already):
- Add the following `repositories` to the `pluginManagement` block.

```gradle
pluginManagement { 
    includeBuild("../node_modules/@react-native/gradle-plugin")
+    repositories {
+        google()
+        mavenCentral()
+    }
}

plugins { 
    id("com.facebook.react.settings") 
+   id 'com.google.gms.google-services' version '4.3.15' apply false    // Or any desired version.
}
```

### :open_file_folder: **`android/app/build.gradle`**
- If you don't see a __`plugins`__ block, add it to the __top of the file__.
- Add the `google-services` plugin (if you haven't already):

```diff
plugins {   // <-- Add plugins block if you don't have one.
+   id "com.google.gms.google-services"
}
```

### :open_file_folder: **`google-services.json`**

> [!NOTE]  
> If you've installed `react-native-firebase`, you should already have performed this step.

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

