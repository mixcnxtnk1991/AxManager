#!/bin/bash
# AxManager - Ultra Gaming Config (V2 - App Killer)

# ค้นหาเลข Port อัตโนมัติ
SERIAL=$(adb devices | grep -v "emulator" | grep "device$" | awk '{print $1}' | head -n 1)

if [ -z "$SERIAL" ]; then
    echo "Error: ไม่พบการเชื่อมต่อ ADB กรุณาต่อ Wireless Debugging ก่อนครับ"
    exit 1
fi

echo "--- AxManager: Start Optimization for $SERIAL ---"

# 1. ปรับความเร็ว UI
echo "[1/4] Increasing Speed..."
adb -s $SERIAL shell settings put global window_animation_scale 0.5
adb -s $SERIAL shell settings put global transition_animation_scale 0.5
adb -s $SERIAL shell settings put global animator_duration_scale 0.5

# 2. ล้างไฟล์ขยะ
echo "[2/4] Cleaning Junk Files..."
adb -s $SERIAL shell pm trim-caches 999G
echo "Done: Cleaned caches."

# 3. สั่งปิดแอปที่กินทรัพยากร (App Killer)
echo "[3/4] Killing Background Apps..."
# รายชื่อแอปที่มักทำให้เครื่องแลค (เพิ่มชื่อแอปอื่นๆ ต่อท้ายได้เลยครับ)
APPS=("com.facebook.katana" "com.facebook.orca" "com.instagram.android" "com.ss.android.ugc.trill" "com.google.android.youtube")

for app in "${APPS[@]}"; do
    adb -s $SERIAL shell am force-stop $app
    echo "Stopped: $app"
done

# 4. จัดการ RAM ขั้นสุดท้าย
echo "[4/4] Final RAM Boost..."
adb -s $SERIAL shell dumpsys meminfo --trim

echo "--- All Done! เครื่องลื่นปรื๊ดพร้อมลุยแล้วครับ Mixcnx ---"
