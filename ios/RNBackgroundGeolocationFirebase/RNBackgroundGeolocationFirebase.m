//
//  RNBackgroundGeolocationFirebase.m
//  RNBackgroundGeolocationFirebase
//
//  Created by Christopher Scott on 2018-08-03.
//  Copyright © 2018 Christopher Scott. All rights reserved.
//

#import "RNBackgroundGeolocationFirebase.h"

#import <React/RCTEventDispatcher.h>

#import "Firebase.h"

static NSString *const PERSIST_EVENT                = @"TSLocationManager:PersistEvent";

static NSString *const FIELD_LOCATIONS_COLLECTION = @"locationsCollection";
static NSString *const FIELD_GEOFENCES_COLLECTION = @"geofencesCollection";
static NSString *const FIELD_UPDATE_SINGLE_DOCUMENT = @"updateSingleDocument";

static NSString *const DEFAULT_LOCATIONS_COLLECTION = @"locations";
static NSString *const DEFAULT_GEOFENCES_COLLECTION = @"geofences";

@implementation RNBackgroundGeolocationFirebase {
    BOOL isRegistered;
}

RCT_EXPORT_MODULE();

+ (BOOL)requiresMainQueueSetup
{
    return NO;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        isRegistered = NO;
        _locationsCollection = DEFAULT_LOCATIONS_COLLECTION;
        _geofencesCollection = DEFAULT_GEOFENCES_COLLECTION;
        _updateSingleDocument = NO;
    }
    return self;
}

- (NSArray<NSString *> *)supportedEvents {
    return @[];
}


RCT_EXPORT_METHOD(configure:(NSDictionary*)config success:(RCTResponseSenderBlock)success failure:(RCTResponseSenderBlock)failure) {
    if (config[FIELD_LOCATIONS_COLLECTION]) {
        _locationsCollection = config[FIELD_LOCATIONS_COLLECTION];
    }
    if (config[FIELD_GEOFENCES_COLLECTION]) {
        _geofencesCollection = config[FIELD_GEOFENCES_COLLECTION];
    }
    if (config[FIELD_UPDATE_SINGLE_DOCUMENT]) {
        _updateSingleDocument = [config[FIELD_UPDATE_SINGLE_DOCUMENT] boolValue];
    }
    if (!isRegistered) {
        isRegistered = YES;

        // TODO make configurable.
        FIRFirestore *db = [FIRFirestore firestore];
        FIRFirestoreSettings *settings = [db settings];
        settings.timestampsInSnapshotsEnabled = YES;
        [db setSettings:settings];

        [[NSNotificationCenter defaultCenter] addObserver:self
            selector:@selector(onPersist:)
            name:PERSIST_EVENT
            object:nil];
    }
    success(@[]);
}

-(void) onPersist:(NSNotification*)notification {
    NSDictionary *data = notification.object;
    NSString *collectionName = (data[@"location"][@"geofence"]) ? _geofencesCollection : _locationsCollection;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        FIRFirestore *db = [FIRFirestore firestore];
        // Add a new document with a generated ID
        if (!self.updateSingleDocument) {
            __block FIRDocumentReference *ref = [[db collectionWithPath:collectionName] addDocumentWithData:notification.object completion:^(NSError * _Nullable error) {
                if (error != nil) {
                    NSLog(@"Error adding document: %@", error);
                } else {
                    NSLog(@"Document added with ID: %@", ref.documentID);
                }
            }];
        } else {
            [[db documentWithPath:collectionName] setData:notification.object completion:^(NSError * _Nullable error) {
                if (error != nil) {
                    NSLog(@"Error writing document: %@", error);
                } else {
                    NSLog(@"Document successfully written");
                }
            }];
        }
    });
}

-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
