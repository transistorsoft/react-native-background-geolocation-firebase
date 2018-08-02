react-native-background-geolocation-firebase &middot; [![npm](https://img.shields.io/npm/dm/react-native-background-geolocation-firebase.svg)]() [![npm](https://img.shields.io/npm/v/react-native-background-geolocation-firebase.svg)]()
============================================================================

[![](https://dl.dropboxusercontent.com/s/nm4s5ltlug63vv8/logo-150-print.png?dl=1)](https://www.transistorsoft.com)

-------------------------------------------------------------------------------

Firebase Proxy for React Native Background Geolocation

----------------------------------------------------------------------------

The **[Android module](http://www.transistorsoft.com/shop/products/react-native-background-geolocation)** requires [purchasing a license](http://www.transistorsoft.com/shop/products/react-native-background-geolocation).  However, it *will* work for **DEBUG** builds.  It will **not** work with **RELEASE** builds [without purchasing a license](http://www.transistorsoft.com/shop/products/react-native-background-geolocation).

(2018) This plugin is supported **full-time** and field-tested **daily** since 2013.

----------------------------------------------------------------------------

## :large_blue_diamond: Installing the Plugin

### From npm

```
$ npm install react-native-background-geolocation-firebase --save
```

### Latest from Github

```
$ npm install git+https://git@github.com:transistorsoft/react-native-background-geolocation-firebase.git --save

```

## :large_blue_diamond: Setup Guides

### iOS
- [`react-native link` Setup](docs/INSTALL-IOS-RNPM.md)
- [Cocoapods](docs/INSTALL-IOS-COCOAPODS.md)
- [Manual Setup](docs/INSTALL-IOS.md)

### Android
* [`react-native link` Setup](docs/INSTALL-ANDROID-RNPM.md)
* [Manual Setup](docs/INSTALL-ANDROID.md)

## :large_blue_diamond: Configure your license

1. Login to Customer Dashboard to generate an application key:
[www.transistorsoft.com/shop/customers](http://www.transistorsoft.com/shop/customers)
![](https://gallery.mailchimp.com/e932ea68a1cb31b9ce2608656/images/b2696718-a77e-4f50-96a8-0b61d8019bac.png)

2. Add your license-key to `android/app/src/main/AndroidManifest.xml`:

```diff
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.transistorsoft.backgroundgeolocation.react">

  <application
    android:name=".MainApplication"
    android:allowBackup="true"
    android:label="@string/app_name"
    android:icon="@mipmap/ic_launcher"
    android:theme="@style/AppTheme">

    <!-- react-native-background-geolocation-firebase licence -->
+     <meta-data android:name="com.transistorsoft.firebaseproxy.license" android:value="YOUR_LICENCE_KEY_HERE" />
    .
    .
    .
  </application>
</manifest>
```

## :large_blue_diamond: Using the plugin ##

```javascript
import BackgroundGeolocationFirebase from "react-native-background-geolocation-firebase";
```

## :large_blue_diamond: Example

```javascript

import BackgroundGeolocationFirebase from "react-native-background-geolocation-firebase";

export default class App extends Component {
  componentWillMount() {
    ////
    // 1. configure BackgroundGeolocationFirebase
    //
    BackgroundGeolocationFirebase.configure({
      locationsCollection: "locations",
      geofencesCollection: "geofences"
    });

    ////
    // 2.  Configure BackgroundGeolocation as usual.
    //
    BackgroundGeolocation.ready({
      ...
    }, (state) => {
      console.log("- BackgroundGeolocation is configured and ready");
    });
  }  
}

```

## Firebase Functions

BackgroundGeolocation will post JSON to firebase using the default [Location Data Schema]().  

```json
{
  "location":"<JSON>",
  "params": "<JSON>"
}
```

You should implement your own [Firebase Functions]() to re-assemble the data in your collection as desired.  For example:

```typescript
import * as functions from 'firebase-functions';

exports.createLocation = functions.firestore
  .document('locations/{locationId}')
  .onCreate((snap, context) => {
    const record = snap.data();
    
    const location = JSON.parse(record.location);
    const params = JSON.parse(record.params);
  
    console.log('[location] - ', location);
    console.log('[params] - ', params);
    
    return snap.ref.set({
      uuid: location.uuid,
      timestamp: location.timestamp,
      is_moving: location.is_moving,
      latitude: location.coords.latitude,
      longitude: location.coords.longitude,
      speed: location.coords.speed,
      heading: location.coords.heading,
      altitude: location.coords.altitude,      
      event: location.event,
      battery_is_charging: location.battery.is_charging,
      battery_level: location.battery.level,
      activity_type: location.activity.type,
      activity_confidence: location.activity.confidence,
      extras: location.extras,
      device: params.device
    });
});


exports.createGeofence = functions.firestore
  .document('geofences/{geofenceId}')
  .onCreate((snap, context) => {
    const record = snap.data();
    
    const location = JSON.parse(record.location);
    const params = JSON.parse(record.params);
  
    console.log('[location] - ', location);
    console.log('[params] - ', params);
    
    return snap.ref.set({
      uuid: location.uuid,
      identifier: location.geofence.identifier,
      action: location.geofence.action,
      timestamp: location.timestamp,      
      latitude: location.coords.latitude,
      longitude: location.coords.longitude,
      extras: location.extras,
      device: params.device
    });
});

```


# License

The MIT License (MIT)

Copyright (c) 2018 Chris Scott, Transistor Software

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


