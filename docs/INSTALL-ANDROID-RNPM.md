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
        classpath 'com.android.tools.build:gradle:3.1.4'
+        // NOTE:  If you've installed react-native-firebase, you should already have this included.
+       classpath 'com.google.gms:google-services:4.2.0'
    }
    ext {
        buildToolsVersion = "28.0.3"
        minSdkVersion = 16
        compileSdkVersion = 28
        targetSdkVersion = 28
        supportLibVersion = "28.0.0"
+       firebaseCoreVersion = "16.0.9"
+       firebaseFirestoreVersion = "19.0.0"

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
+           url "$rootDir/../node_modules/react-native-background-geolocation-firebase/android/libs"
+       }
    }
}
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
