FROM osrf/ros:noetic-desktop-full

WORKDIR /home/drone_racing_ws

RUN apt update && \
    apt install -y git python3-catkin-tools python3-vcstool wget python-is-python3 libtool libgoogle-glog-dev libgflags-dev && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean


RUN mkdir src && cd src && \
    git clone https://github.com/Bob-Eric/sim2real_drone_racing.git && \
    vcs-import < sim2real_drone_racing/dependencies.yaml && \
    touch octomap/octovis/CATKIN_IGNORE 

RUN catkin config --extend /opt/ros/noetic && catkin config --merge-devel && \
    catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS=-fdiagnostics-color && \
    catkin build


RUN wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-py37_23.1.0-1-Linux-x86_64.sh && \
    bash Miniconda3-py37_23.1.0-1-Linux-x86_64.sh -p /opt/miniconda -b && rm Miniconda3-py37_23.1.0-1-Linux-x86_64.sh

ENV PATH=/opt/miniconda/bin:${PATH}

RUN conda init && conda env create -f src/sim2real_drone_racing/droneflow.yaml && echo "conda activate droneflow" >> ~/.bashrc

RUN echo "bash" > /home/drone_racing_ws/start.sh && \
    echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc && \
    echo "source /home/drone_racing_ws/devel/setup.bash" >> ~/.bashrc

CMD /home/drone_racing_ws/start.sh