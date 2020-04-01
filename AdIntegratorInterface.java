package com.buildbox.adapter;

import android.app.Activity;

import java.lang.ref.WeakReference;
import java.util.HashMap;

public interface AdIntegratorInterface {
    void initAds(HashMap<String, String> initValues, WeakReference<Activity> activity);

    void initBanner();

    void initInterstitial();

    void initRewardedVideo();

    void showBanner();

    void hideBanner();

    void showInterstitial();

    void showRewardedVideo();

    boolean isBannerVisible();

    boolean isRewardedVideoAvailable();

    void setUserConsent(boolean consentGiven);

    void interstitialClosed();

    void rewardedVideoDidReward(boolean value);

    void rewardedVideoDidEnd(boolean value);

    void networkLoaded();

    void bannerLoaded();

    void interstitialLoaded();

    void rewardedVideoLoaded();

    void networkFailed();

    void bannerFailed();

    void interstitialFailed();

    void rewardedVideoFailed();

    void onActivityCreated(Activity activity);

    void onActivityStarted(Activity activity);

    void onActivityResumed(Activity activity);

    void onActivityPaused(Activity activity);

    void onActivityStopped(Activity activity);

    void onActivityDestroyed(Activity activity);
}
