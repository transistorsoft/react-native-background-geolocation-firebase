'use strict'

import {  
  Platform,
  AppRegistry
} from "react-native"

import NativeModule from './NativeModule';

const TAG = "BackgroundGeolocationFirebase";

class BackgroundGeolocationFirebase {
  /**
  * Perform initial configuration of plugin.  Reset config to default before applying supplied configuration
  */
  static configure(config, success, failure) {
    if (arguments.length == 1) {
      return NativeModule.configure(config);
    } else {
      NativeModule.configure(config).then(success).catch(failure);
    }
  }
}

export default BackgroundGeolocationFirebase;


