# SwipeColor – Release Credentials and Store Assets

This folder contains everything needed to build and publish SwipeColor to the Google Play Store.

## Keystore and Signing

- **Keystore file**: `swipecolor-release.jks`  
  A copy is also in `android/app/swipecolor-release.jks` for local release builds.

- **Credentials** (keep private):
  - Store password: `swipecolor123`
  - Key password: `swipecolor123`
  - Key alias: `swipecolor`

**CRITICAL**: Back up the keystore and these credentials securely. If you lose them, you cannot update the app on the Play Store.

## key.properties (Android)

For release builds, `android/key.properties` should contain:

```properties
storePassword=swipecolor123
keyPassword=swipecolor123
keyAlias=swipecolor
storeFile=swipecolor-release.jks
```

`storeFile` is resolved from `android/app/`, so the JKS file must be at `android/app/swipecolor-release.jks` when building.

## Store Listing

- **Play Store copy**: `play_store_listing.txt` (short and full description)
- **Privacy policy**: `privacy_policy.md` – host at https://swipecolor.app/privacy-policy
- **Feature graphic**: Create 1024x500 and save as `featured_graphic_swipecolor.png`
- **Screenshots**: Add phone screenshots in `screenshots/`

## Build Commands

```bash
# Generate launcher icons and splash
flutter pub get
flutter pub run flutter_launcher_icons
flutter pub run flutter_native_splash:create

# Release app bundle (Play Store)
flutter build appbundle
```

Output: `build/app/outputs/bundle/release/app-release.aab`

## Contact

- Support: support@swipecolor.app  
- Privacy policy: https://swipecolor.app/privacy-policy
