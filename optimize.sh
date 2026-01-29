#!/bin/bash
# AxManager - Ultra Gaming & WiFi Booster (V3)

# ค้นหาเลข Port อัตโนมัติ
SERIAL=$(adb devices | grep -v "emulator" | grep "device$" | awk '{print $1}' | head -n 1)

if [ -z "$SERIAL" ]; then
    echo "Error: ไม่พบการเชื่อมต่อ ADB กรุณาต่อ Wireless Debugging ก่อนครับ"
    exit 1
fi

echo "--- AxManager: Start Ultra Optimization for $SERIAL ---"

# 1. ปรับความเร็ว UI
echo "[1/5] Increasing Speed..."
adb -s $SERIAL shell settings put global window_animation_scale 0.5
adb -s $SERIAL shell settings put global transition_animation_scale 0.5
adb -s $SERIAL shell settings put global animator_duration_scale 0.5

# 2. กระตุ้น WiFi & Network (ลด Ping)
echo "[2/5] Boosting WiFi & Network..."
# ล้างค่า DNS Cache ในเครื่อง
adb -s $SERIAL shell cmd wifi force-low-latency-mode enabled
adb -s $SERIAL shell settings put global wifi_sleep_policy 2
adb -s $SERIAL shell settings put global wifi_scan_always_enabled 0
echo "Done: WiFi Low Latency Enabled."

# 3. ล้างไฟล์ขยะ
echo "[3/5] Cleaning Junk Files..."
adb -s $SERIAL shell pm trim-caches 999G
echo "Done: Cleaned caches."

# 4. สั่งปิดแอปที่กินทรัพยากรเบื้องหลัง
echo "[4/5] Killing Background Apps..."
APPS=("com.facebook.katana" "com.facebook.orca" "com.instagram.android" "com.ss.android.ugc.trill" "com.google.android.youtube")
for app in "${APPS[@]}"; do
    adb -s $SERIAL shell am force-stop $app
done
echo "Done: Background apps stopped."

# 5. จัดการ RAM
echo "[5/5] Final RAM Boost..."
adb -s $SERIAL shell dumpsys meminfo --trim

echo "--- All Done! WiFi แรงขึ้น เครื่องลื่นขึ้นแล้วครับ Mixcnx ---"
