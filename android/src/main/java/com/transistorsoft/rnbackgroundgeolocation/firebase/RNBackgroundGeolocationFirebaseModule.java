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

    private boolean isRegistered;
    
    public RNBackgroundGeolocationFirebaseModule(ReactApplicationContext reactContext) {
        super(reactContext);
        isRegistered = false;
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
        if (params.hasKey("updateSingleDocument")) {
            proxy.setUpdateSingleDocument(params.getBoolean("updateSingleDocument"));
        }
        proxy.save(getReactApplicationContext());

        if (!isRegistered) {
            isRegistered = true;
            proxy.register(getReactApplicationContext());
        }
        success.invoke();
    }
}
