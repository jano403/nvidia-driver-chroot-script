# setup chroot
sudo debootstrap oldoldstable /chroot/debian/ http://deb.debian.org/debian

# go into chroot
sudo chroot /chroot/debian/

# set up non free repos
echo "deb http://deb.debian.org/debian oldoldstable main non-free contrib" > /etc/apt/sources.list
apt update

# install driver dependencies
apt install xserver-xorg -y

# install wget
apt install wget -y

wget https://raw.githubusercontent.com/jano403/nvidia-driver-chroot-script/refs/heads/main/installComponents.sh

cd /home/

# IMPORTANT!!!! DRIVER MUST BE EXACTLY SAME AS HOST!!!
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/560.35.03/NVIDIA-Linux-x86_64-560.35.03.run
sh NVIDIA-Linux-x86_64-560.35.03.run -x

cd NVIDIA-Linux-x86_64-560.35.03

mv /installComponents.sh ./


################# OUTSIDE OF CHROOT!!!!

sudo mkdir -p  /chroot/debian/dev/
sudo mkdir -p /chroot/debian/dev/pts/
sudo mkdir -p /chroot/debian/proc/
sudo mkdir -p /chroot/debian/sys
sudo mkdir -p /chroot/debian/dev/shm/
sudo mkdir -p /chroot/debian/var/lib/dbus



sudo mount --bind /dev /chroot/debian/dev/
sudo mount --bind /dev/pts/ /chroot/debian/dev/pts/
sudo mount --bind /proc/ /chroot/debian/proc/
sudo mount --bind /sys/ /chroot/debian/sys


sudo mount --bind /dev/shm/ /chroot/debian/dev/shm/

sudo mount --bind  /var/lib/dbus /chroot/debian/var/lib/dbus
sudo mkdir -p /chroot/debian/run/user/1000/pulse
sudo mount --bind /run/user/1000/pulse /chroot/debian/run/user/1000/pulse


#sudo mkdir -p /chroot/debian/run/dbus/

#sudo mount --bind /run/dbus/ /chroot/debian/run/dbus/


sudo mkdir -p /chroot/debian/run/user/1000/pulse

# Set correct ownership
sudo chown -R 1000:1000 /chroot/debian/run/user/1000
sudo chown -R 1000:1000 /chroot/debian/run/user/1000/pulse

# Set correct permissions
sudo chmod 700 /chroot/debian/run/user/1000
sudo chmod 700 /chroot/debian/run/user/1000/pulse

sudo mount --bind /run/user/1000/pulse /chroot/debian/run/user/1000/pulse
##################################################################

# now we continue
# install some more deps
apt install x11-xserver-utils -y
apt install sudo mesa-utils -y
# installing driver 
chmod +x installComponents.sh
./installComponents.sh

# install deps for cuda
apt install gcc make g++

cd /home/

wget https://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_440.33.01_linux.run
sh cuda_10.2.89_440.33.01_linux.run --librarypath=/usr/local/cuda-10.2



# i dont know why this is necessary nor do i want to test more why, might be because of xauthority or because you change user and exit and shit idenno man
useradd -m john
COPY .Xauthority from HOST's /home/USER_HOST to CHROOT's /home/john/

su john
glxgears
nvidia-smi
exit

sh cuda_10.2.89_440.33.01_linux.run --librarypath=/usr/local/cuda-10.2


#DO IT LIKE THIS

┌──────────────────────────────────────────────────────────────────────────────┐
│ CUDA Installer                                                                
│ - [ ] Driver                                                                 │
│      [ ] 440.33.01                                                           │
│ - [X] CUDA Toolkit 10.2                                                      │
│    - [X] CUDA Tools 10.2                                                     │
│       + [X] CUDA Command Line Tools 10.2                                     │
│       + [ ] CUDA Visual Tools 10.2                                           │
│    + [X] CUDA Libraries 10.2                                                 │
│    + [X] CUDA Compiler 10.2                                                  │
│      [X] CUDA Misc Headers 10.2                                              │
│   [ ] CUDA Samples 10.2                                                      │
│   [ ] CUDA Demo Suite 10.2                                                   │
│   [ ] CUDA Documentation 10.2                                                │
│   Options                                                                    │
│   Install                                                                    │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│ Up/Down: Move | Left/Right: Expand | 'Enter': Select | 'A': Advanced options  

#(disable Driver, CUDA Visual Tools 10.2, CUDA Samples 10.2, CUDA Demo Suite 10.2, CUDA Documentation 10.2)
#Install!

echo "export PATH=\"/usr/local/cuda-10.2/bin:$PATH\"" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=\"/usr/local/cuda-10.2/lib64:$LD_LIBRARY_PATH\"" >> ~/.bashrc
source ~/.bashrc


cd /home/john/


# clone llama.cpp
apt install git -y
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp/

# patching llama.cpp
git checkout 527e57cfd8a9a26bf622c0510c21c2508a24be26
nano Makefile
ctrl + w [-arch=native] (search this) and replace with -arch=compute_30
nano ggml-cuda.cu
ctrl + w [CUBLAS_TF32_TENSOR_OP_MATH] replace the second one (inside the code, not inside the #define shit) with CUBLAS_TENSOR_OP_MATH


LLAMA_CUBLAS=1 make -j12

./main -s 0 -p "Hello I am" --model pygmalion-2-7b.Q2_K.gguf -n 10 -ngl 35
NOW YOU WAIT UNTIL IT GIVES RESPONSE!  other models can be tired aswell. fuark yes
