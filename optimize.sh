cat << 'EOF' > optimize.sh
#!/bin/bash
# AxManager - Gaming Optimization Script
# Target: Low latency, No lag

echo "Optimizing performance..."

# Clear background cache
echo 3 > /proc/sys/vm/drop_caches

# Set CPU Governor to Performance (if possible)
# Note: Some non-root devices may have restrictions
settings put global window_animation_scale 0.5
settings put global transition_animation_scale 0.5
settings put global animator_duration_scale 0.5

echo "Done! Device is ready for gaming."
EOF

# ทำให้ไฟล์รันได้
chmod +x optimize.sh

