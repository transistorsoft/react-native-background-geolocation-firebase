//
//  RNBackgroundGeolocationFirebase.h
//  RNBackgroundGeolocationFirebase
//
//  Created by Christopher Scott on 2018-08-03.
//  Copyright © 2018 Christopher Scott. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <React/RCTEventEmitter.h>
#import <React/RCTLog.h>

@interface RNBackgroundGeolocationFirebase : RCTEventEmitter

@property (nonatomic) NSString* locationsCollection;
@property (nonatomic) NSString* geofencesCollection;

@end
