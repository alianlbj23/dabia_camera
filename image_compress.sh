#!/bin/bash

docker run -it --rm \
    -v "$(pwd)/ros2_yolov8:/workspaces" \
    --network scripts_my_bridge_network \
    --gpus all \
    --runtime nvidia \
    yolo_image:1.0 \
    /bin/bash -c "cd /workspaces && \
    source /opt/ros/humble/setup.bash && \
    colcon build && \
    . ./install/setup.bash && \
    ros2 run yolo_pkg compressed_node"
