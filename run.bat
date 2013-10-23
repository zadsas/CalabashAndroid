@echo off
set APK_FILE=%CD%\TVMovieAndroid.apk
call calabash-android resign %APK_FILE%
cd calabash_project
call calabash-android run %APK_FILE%
cd ..