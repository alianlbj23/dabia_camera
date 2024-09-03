#!/bin/bash



# 初始化 device 参数
device_options=""
if [ -e /dev/video0 ]; then
    device_options+=" --device=/dev/video0"
fi

if [ -e /dev/video1 ]; then
    device_options+=" --device=/dev/video1"
fi

if [ -e /dev/imu_usb ]; then
    device_options+=" --device=/dev/imu_usb"
fi

# 构建完整指令
docker run -it --rm \
    -v "$(pwd)/src:/workspaces/src" \
    --device /dev/bus/usb:/dev/bus/usb \
    --network scripts_my_bridge_network \
    $device_options \
    ghcr.io/otischung/pros_ai_image:develop \
    /bin/bash -c "source /opt/ros/humble/setup.bash && ros2 launch orbbec_camera dabai_dcw.launch.py & wait"