# Created by Ankit at 20/03/26
*** Variables ***
${REMOTE_URL}           http://127.0.0.1:4723
${PLATFORM_NAME}        Android
${AUTOMATION_NAME}      UiAutomator2
${APP}                  ${EXECDIR}/../TestEntropy/TestEntropyMobile/APKs/General-Store.apk
${APP_PACKAGE}          com.androidsample.generalstore

# =========================
# Device selection
# =========================
# Choose one: "emulator" or "real"
${DEVICE_TYPE}          real

# =========================
# Emulator settings (dynamic)
# =========================
# ${DEVICE_NAME} and AVD will be picked dynamically by your existing common file
# ${UDID} is empty for emulator
${DEVICE_NAME}          Android Emulator
${UDID}                 ${EMPTY}   
${AVD}                  ${EMPTY}

# =========================
# Real device settings
# =========================
# Uncomment below lines to run on real device
${DEVICE_NAME}        RealmePhone
${UDID}               Q49XLNNVQGSWDMJZ  # replace with `adb devices` output
${AVD}                ${EMPTY}