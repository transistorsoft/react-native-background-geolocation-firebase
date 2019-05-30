# CHANGELOG

## [0.2.0] -- 2019-05-30
- [Fixed] Android bug in using `geofencesCollection`.
- [Fixed] Update Android Gradle config to use `implementation` instead of `compile`.
- [Changed] Changed Android `ext` defaults to latest values.
```
def DEFAULT_COMPILE_SDK_VERSION     = 28
def DEFAULT_BUILD_TOOLS_VERSION     = "28.0.3"
def DEFAULT_TARGET_SDK_VERSION      = 28

def DEFAULT_FIREBASE_CORE_VERSION    = "16.0.9"
def DEFAULT_FIREBASE_FIRESTORE_VERSION = "19.0.0"
```

## [0.1.0] -- 2019-01-15
- Update setup docs with Gradle config vars firebaseCoreVersion, firebaseFirestoreVersion
- Add Typescript definitions

## [0.0.1]
- Initial version

