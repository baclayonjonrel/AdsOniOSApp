# AdsOniOSApp

`AdsOniOSApp` is an iOS application built using UIKit and AdMob. The app integrates various ad formats to enhance user experience and monetization opportunities. The supported ad formats include App Open Ads, Interstitial Ads, and Rewarded Video Ads.

## Features

- **App Open Ad**: Displayed when the app is opened to encourage user engagement.
- **Interstitial Ad**: Shown at specific points during app navigation to maximize ad revenue.
- **Rewarded Video Ad**: Offers users rewards for watching video ads, providing an incentive for ad engagement.

## Installation

To set up and run this application, follow these steps:

1. **Clone the Repository**:

    ```bash
    git clone https://github.com/yourusername/AdsOniOSApp.git
    cd AdsOniOSApp
    ```

2. **Open the Project**:

    Open the project using Xcode:

    ```bash
    open AdsOniOSApp.xcodeproj
    ```

3. **Install Dependencies**:

    Ensure that you have the Google Mobile Ads SDK integrated. You can use CocoaPods to manage dependencies:

    ```bash
    pod install
    ```

4. **Configure AdMob**:

    - Sign in to the [Google AdMob Console](https://apps.admob.com/) and create ad units.
    - Replace the placeholder ad unit IDs in the code with your actual ad unit IDs.

## Usage

### Displaying Ads

- **App Open Ad**: Automatically shown when the app becomes active.

  ```swift
  func applicationDidBecomeActive(_ application: UIApplication) {
      let rootViewController = application.windows.first(where: { $0.isKeyWindow })?.rootViewController
      if let rootViewController = rootViewController {
          if !(rootViewController is SplashViewController) {
              AppOpenAdManager.shared.showAdIfAvailable(viewController: rootViewController)
          }
      }
  }

## Interstitial Ad: Displayed when the user taps a button.
```swift
@IBAction func showAdButtonClick(_ sender: Any) {
    if let interstitial = interstitial {
        interstitial.present(fromRootViewController: self)
    } else {
        print("Interstitial ad wasn't ready")
        loadInterstitialAd()
    }
}
```
## Rewarded Video Ad: Shown when the user taps a button to watch a video ad.
```swift
@IBAction func playVideoAdClick(_ sender: Any) {
    if let rewardedAd = rewardedAd {
        rewardedAd.present(fromRootViewController: self) {
            // Handle reward here if applicable
            print("User earned reward")
        }
    } else {
        print("Rewarded ad wasn't ready")
        loadRewardedAd()
    }
}
```
# AdMob Integration
## Add AdMob SDK:

###Ensure you have added the Google Mobile Ads SDK to your project. If using CocoaPods, ensure your Podfile includes:

```bash
pod 'Google-Mobile-Ads-SDK'
```
###Initialize AdMob:

###Initialize the AdMob SDK in your AppDelegate:
```bash
import GoogleMobileAds
```
```swift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }
}
```
##Troubleshooting
###Ad Unit Doesn't Match Format: Ensure you are using the correct ad unit ID for the ad format you are trying to display.

###Ad Not Ready: Verify that the ad unit IDs are correct and that you have implemented the ad loading and presentation logic properly.

##License
###This project is licensed under the [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0).

## Contact

If you have any questions, feel free to reach out:

- Email: [baclayonjonrel@gmail.com](mailto:baclayonjonrel@gmail.com)
- GitHub: [baclayonjonrel](https://github.com/baclayonjonrel)





