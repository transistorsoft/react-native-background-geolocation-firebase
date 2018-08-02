package com.transistorsoft.rnbackgroundgeolocation.firebase;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;

import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.transistorsoft.tsfirebaseproxy.TSFirebaseProxy;

/**
 * Created by chris on 2015-10-30.
 */
public class RNBackgroundGeolocationFirebaseModule extends ReactContextBaseJavaModule {

    private static final String TAG = "TSLocationManager";
    
    public RNBackgroundGeolocationFirebaseModule(ReactApplicationContext reactContext) {
        super(reactContext);        
    }

    @Override
    public void initialize() {
        // do nothing
    }
    @Override
    public String getName() {
        return "RNBackgroundGeolocationFirebase";
    }

    @ReactMethod
    public void configure(ReadableMap params, final Callback success, final Callback failure){
        
        TSFirebaseProxy proxy = TSFirebaseProxy.getInstance(getReactApplicationContext());
        if (params.hasKey("locationsCollection")) {
            proxy.setLocationsCollection(params.getString("locationsCollection"));
        }
        if (params.hasKey("geofencesCollection")) {
            proxy.setGeofencesCollection(params.getString("geofencesCollection"));
        }
        proxy.register(getReactApplicationContext());

        success.invoke();
    }
}
