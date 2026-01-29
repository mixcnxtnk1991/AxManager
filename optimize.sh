#!/bin/bash
# AxManager - Fix for Multiple Devices
SERIAL="192.168.1.16:43915"

echo "Optimizing via ADB for $SERIAL..."

# ระบุ -s เพื่อเลือกเครื่องที่เชื่อมต่ออยู่
adb -s $SERIAL shell settings put global window_animation_scale 0.5
adb -s $SERIAL shell settings put global transition_animation_scale 0.5
adb -s $SERIAL shell settings put global animator_duration_scale 0.5

echo "Optimization applied to $SERIAL successfully!"
