docker run -it --rm=false --name sim2real_drone_racing --network host \
	-e DISPLAY=$DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
    sim2real_drone_racing:latest