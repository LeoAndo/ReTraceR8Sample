# My Application-START

# retrace setting.
-keepattributes LineNumberTable,SourceFile

# remove log
-assumenosideeffects class android.util.Log {
    public static int v(...);
    public static int d(...);
    public static int i(...);
    public static int w(...);
    public static int e(...);
}
-keep class com.example.retracer8sample.R$* { *; }

# TODO jsonパースで使うobjectやプリファレンスのモデルなどは暗号化対象外にする
#noinspection ShrinkerUnresolvedReference
-keep class com.example.retracer8sample.model.** { *; }

# enum
# https://stackoverflow.com/questions/46102906/kotlin-proguard-rule-for-enum
-keepclassmembers enum * {
    public *;
}

# serializable
# https://www.guardsquare.com/en/products/proguard/manual/examples#serializable
-keepnames class * implements java.io.Serializable
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    !static !transient <fields>;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# https://github.com/krschultz/android-proguard-snippets/blob/master/libraries/proguard-parceler.pro
# Parceler rules
# Source: https://github.com/johncarl81/parceler#configuring-proguard
-keep class * implements android.os.Parcelable {
#noinspection ShrinkerUnresolvedReference
    public static final android.os.Parcelable$Creator *;
}
-keep class org.parceler.Parceler$$Parcels
# My Application-END


# Android X-START
#noinspection ShrinkerUnresolvedReference
-dontwarn androidx.**
-keep class androidx.** { *; }
-keep interface androidx.** { *; }
# Android X-END