'use strict';

import {
  NativeEventEmitter,
  NativeModules
} from "react-native"

const { RNBackgroundGeolocationFirebase, RNBackgroundGeolocation } = NativeModules;

const EventEmitter = new NativeEventEmitter(RNBackgroundGeolocationFirebase);

const TAG               = "TSLocationManager";
const PLATFORM_ANDROID  = "android";
const PLATFORM_IOS      = "ios";

const EVENTS = [
  
];

/**
* Native API
*/
export default class NativeModule {
  static get EVENTS() { return EVENTS; }
  /**
  * Core API Methods
  */
  static configure(config) {
    return new Promise((resolve, reject) => {
      let success = (state) => { resolve(state) }
      let failure = (error) => { reject(error) }
      
      RNBackgroundGeolocationFirebase.configure(config, success, failure);
      RNBackgroundGeolocation.registerPlugin('firebaseproxy');
    });
  }
  
}