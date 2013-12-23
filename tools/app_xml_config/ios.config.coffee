module.exports = exports =
  dev:
    hoge: null
  rel:
    Entitlements: '''
		              <key>get-task-allow</key><false/>
		              <key>aps-environment</key><string>production</string>
		              <key>application-identifier</key><string>xxxxxxxxxxxxxxxxxx.__id__</string>
		              <key>keychain-access-groups</key>
		              <array>
		                <string>xxxxxxxxxxxxxxxxxx.__id__</string>
		              </array>
		              '''


  device:
    addExtensions: [
      'com.adobe.Vibration'
    ]

  base:
    ios: true
    initialWindow:
      renderMode: 'gpu'

    icons:
      image29x29: 'icons/29.png'
      image57x57: 'icons/57.png'
      image58x58: 'icons/58.png'
      image114x114: 'icons/114.png'

    extensions: [
      'pl.mateuszmackowiak.nativeANE.NativeDialogs'
      'jp.itoz.air.mobile.extensions.NetworkStatus'
      'com.juankpro.ane.LocalNotification'
      'com.freshplanet.ane.AirDeviceId'
    ]
    Entitlements: '''
		              <key>get-task-allow</key><true/>
		              <key>aps-environment</key><string>development</string>
		              '''

    InfoAdditions: '''
		               <key>UIDeviceFamily</key><array><string>1</string></array>
		               <key>UIRequiredDeviceCapabilities</key><array><string>armv7</string><string>opengles-2</string></array>
		               <key>UIApplicationExitsOnSuspend</key><false/>
		               <key>UIPrerenderedIcon</key><true/>
		               <key>MinimumOSVersion</key><string>5.1</string>
		               <key>CFBundleURLTypes</key>
                       <array>
                           <dict>
                               <key>CFBundleURLSchemes</key>
                               <array>
                                   <string>appname</string>
                               </array>
                               <key>CFBundleURLName</key>
                               <string>me.unko.appname</string>
                           </dict>
                       </array>
		               '''
