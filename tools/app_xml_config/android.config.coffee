module.exports = exports =
  dev:
    id: 'me.unko.appname.dev'
    splash:
      id: 'me.unko.appname.dev'
  rel:
    hoge: null

  device:
    addExtensions: [
      'com.adobe.Vibration'
      'com.freshplanet.AirPushNotification'
    ]


  base:
    ios: false
  #<!-- @see http://developer.android.com/guide/practices/ui_guidelines/icon_design_launcher.html -->
    icons:
      image36x36: 'icons/36.png'
      image48x48: 'icons/48.png'
      image72x72: 'icons/72.png'

    extensions: [
      'pl.mateuszmackowiak.nativeANE.NativeDialogs'
      'jp.itoz.air.mobile.extensions.NetworkStatus'
      'com.juankpro.ane.LocalNotification'
      'com.freshplanet.ane.AirDeviceId'
      'com.riaspace.c2dm'
    ]

    manifest: """
              <manifest android:installLocation="auto">
              <uses-permission android:name="android.permission.INTERNET"/>
              <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
              <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
              <uses-permission android:name="android.permission.GET_ACCOUNTS"/>
              <uses-permission android:name="android.permission.WAKE_LOCK"/>
              <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
              <uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>
              <uses-permission android:name="android.permission.VIBRATE"/>
              <uses-permission android:name="android.permission.READ_LOGS"/>
              <uses-permission android:name="android.permission.RECORD_AUDIO" />
              <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>

              <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>

              <!-- c2dm settings http://www.techdoctranslator.com/code-google-com/android-c2dm#manifest -->
              <permission android:protectionLevel="signature" android:name="air.__id__.permission.C2D_MESSAGE" />
              <uses-permission android:name="air.__id__.permission.C2D_MESSAGE" />
              <uses-permission android:name="com.google.android.c2dm.permission.RECEIVE" />


              <!-- <uses-feature android:required="false" android:name="android.hardware.wifi"/>
              <supports-screens android:normalScreens="true"/>
              <supports-screens android:largeScreens="true"/>
              <supports-screens android:xlargeScreens="true"/> -->



              <application>
                  <!--<service android:name="com.afterisk.shared.android.gcm.GCMIntentService" />-->
                  <receiver android:name="com.freshplanet.nativeExtensions.C2DMBroadcastReceiver" android:permission="com.google.android.c2dm.permission.SEND">
                      <!--<receiver android:name="com.afterisk.shared.android.gcm.AfteriskGCMBroadcastReceiver" android:permission="com.google.android.c2dm.permission.SEND">-->
                      <intent-filter>
                      <action android:name="com.google.android.c2dm.intent.RECEIVE" />
                      <action android:name="com.google.android.c2dm.intent.REGISTRATION" />
                      <category android:name="air.__id__" />
                      </intent-filter>
                  </receiver>
                  <service android:name="com.freshplanet.nativeExtensions.LocalNotificationService"/>
                  <receiver android:name="com.freshplanet.nativeExtensions.LocalBroadcastReceiver" android:process=":remote"></receiver>

                  <activity android:name="com.freshplanet.nativeExtensions.NotificationActivity"></activity>
                      <!--<activity android:excludeFromRecents="false">
                      <intent-filter>
                          <action android:name="android.intent.action.MAIN"/>
                          <category android:name="android.intent.category.LAUNCHER"/>
                      </intent-filter>
                  </activity>-->



                  <!-- com.juankpro.ane.localnotif -->
                  <service android:name="com.juankpro.ane.localnotif.LocalNotificationIntentService"/>
                  <receiver android:name="com.juankpro.ane.localnotif.AlarmIntentService" />
                  <receiver android:name="com.juankpro.ane.localnotif.AlarmRestoreOnBoot" >
                      <intent-filter>
                      <action android:name="android.intent.action.BOOT_COMPLETED" />
                      </intent-filter>
                  </receiver>
              </application>

              </manifest>
              """