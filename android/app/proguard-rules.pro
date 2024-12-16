# Flutter specific rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-dontwarn io.flutter.embedding.**

# ExoPlayer specific rules
-keep class com.google.android.exoplayer2.** { *; }
-dontwarn com.google.android.exoplayer2.**
-keepclassmembers class com.google.android.exoplayer2.** { *; }
-keepclasseswithmembers class com.google.android.exoplayer2.source.dash.manifest.** { *; }

# Kotlin specific rules
-keep class kotlin.** { *; }
-keep class kotlin.Metadata { *; }
-dontwarn kotlin.**
-keepclassmembers class **$WhenMappings {
    <fields>;
}
-keepclassmembers class kotlin.Metadata {
    public <methods>;
}

# Keep custom plugin implementation
-keep class ai.spects.drive2.** { *; }
-keep class com.bbflight.background_downloader.** { *; }
-keep class dev.fluttercommunity.plus.device_info.** { *; }

# XML related rules for ExoPlayer
-keepclassmembers class * extends org.xmlpull.v1.XmlPullParser { *; }
-dontwarn org.xmlpull.v1.**
-keep class org.xmlpull.** { *; }
-keepclassmembers class org.xmlpull.** { *; }