#!/bin/bash
# AxManager - Auto Port Detection for Mixcnx

# ค้นหา Serial ของเครื่องที่เชื่อมต่ออยู่โดยอัตโนมัติ (ข้าม emulator)
SERIAL=$(adb devices | grep -v "emulator" | grep "device$" | awk '{print $1}' | head -n 1)

if [ -z "$SERIAL" ]; then
    echo "Error: No ADB device connected. Please run 'adb connect' first."
    exit 1
fi

echo "Optimizing performance for: $SERIAL"

# สั่งการระบบเพื่อลดความหน่วง
adb -s $SERIAL shell settings put global window_animation_scale 0.5
adb -s $SERIAL shell settings put global transition_animation_scale 0.5
adb -s $SERIAL shell settings put global animator_duration_scale 0.5

echo "Done! Optimization applied to $SERIAL"
