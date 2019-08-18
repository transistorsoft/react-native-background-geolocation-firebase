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
    dependencies {
        classpath 'com.android.tools.build:gradle:3.1.4'
+        // NOTE:  If you've installed react-native-firebase, you should already have this included.
+       classpath 'com.google.gms:google-services:4.3.0'
    }
    ext {
        buildToolsVersion = "28.0.3"
        minSdkVersion = 16
        compileSdkVersion = 28
        targetSdkVersion = 28
        supportLibVersion = "28.0.0"
        appCompatVersion = "1.0.2"
        googlePlayServicesLocationVersion = "17.0.0"
+       firebaseCoreVersion = "17.1.0"
+       firebaseFirestoreVersion = "21.0.0"

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

