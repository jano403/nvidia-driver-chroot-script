#!/bin/bash
mkdir -p /usr/lib/xorg/modules/drivers/
cp nvidia_drv.so /usr/lib/xorg/modules/drivers/

mkdir -p /usr/lib/xorg/modules/extensions/
cp libglxserver_nvidia.so.560.35.03 /usr/lib/xorg/modules/extensions/

cp libEGL.so.1.1.0 /usr/lib/x86_64-linux-gnu/
cp libGLESv1_CM_nvidia.so.560.35.03 /usr/lib/x86_64-linux-gnu/
cp libEGL_nvidia.so.560.35.03 /usr/lib/x86_64-linux-gnu/

cp libnvidia-egl-wayland.so.1.1.13 /usr/lib/x86_64-linux-gnu/
mkdir -p /usr/share/egl/egl_external_platform.d/
cp 10_nvidia_wayland.json /usr/share/egl/egl_external_platform.d/

cp libnvidia-egl-gbm.so.1.1.1 /usr/lib/x86_64-linux-gnu/
mkdir -p /usr/share/egl/egl_external_platform.d/
cp 15_nvidia_gbm.json /usr/share/egl/egl_external_platform.d/

cp libOpenGL.so.0 /usr/lib/x86_64-linux-gnu/
cp libGLX.so.0 /usr/lib/x86_64-linux-gnu/
cp libGLdispatch.so.0 /usr/lib/x86_64-linux-gnu/

cp libGLX_nvidia.so.560.35.03 /usr/lib/x86_64-linux-gnu/
cp libEGL_nvidia.so.560.35.03 /usr/lib/x86_64-linux-gnu/
mkdir -p /etc/vulkan/icd.d/
cp nvidia_icd.json /etc/vulkan/icd.d/
mkdir -p /etc/vulkan/implicit_layer.d
cp nvidia_layers.json /etc/vulkan/implicit_layer.d

cp libGL.so.1.7.0 /usr/lib/x86_64-linux-gnu/

cp libnvidia-cfg.so.560.35.03 /usr/lib/x86_64-linux-gnu/
cp libnvidia-eglcore.so.560.35.03 /usr/lib/x86_64-linux-gnu/
cp libnvidia-glcore.so.560.35.03 /usr/lib/x86_64-linux-gnu/
cp libnvidia-glsi.so.560.35.03 /usr/lib/x86_64-linux-gnu/
cp libnvidia-glvkspirv.so.560.35.03 /usr/lib/x86_64-linux-gnu/
cp libnvidia-gpucomp.so.560.35.03 /usr/lib/x86_64-linux-gnu/
cp libnvidia-rtcore.so.560.35.03 /usr/lib/x86_64-linux-gnu/
cp libnvidia-allocator.so.560.35.03 /usr/lib/x86_64-linux-gnu/

mkdir -p /usr/lib/x86_64-linux-gnu/vdpau/
cp libvdpau_nvidia.so.560.35.03 /usr/lib/x86_64-linux-gnu/vdpau/

cp libcuda.so.560.35.03 /usr/lib/x86_64-linux-gnu/
cp libcudadebugger.so.560.35.03 /usr/lib/x86_64-linux-gnu/

cp libnvidia-pkcs11.so.560.35.03 /usr/lib/x86_64-linux-gnu/
cp libnvidia-pkcs11-openssl3.so.560.35.03 /usr/lib/x86_64-linux-gnu/

cp libnvidia-ptxjitcompiler.so.560.35.03 /usr/lib/x86_64-linux-gnu/

cp libnvidia-nvvm.so.560.35.03 /usr/lib/x86_64-linux-gnu/

cp libOpenCL.so.1.0.0 /usr/lib/x86_64-linux-gnu/
cp libnvidia-opencl.so.560.35.03 /usr/lib/x86_64-linux-gnu/
mkdir -p /etc/OpenCL/vendors/
cp nvidia.icd /etc/OpenCL/vendors/

cp nvidia-cuda-mps-control /usr/bin/
cp nvidia-cuda-mps-server /usr/bin/

mkdir -p /lib/modules/6.1.0-30-amd64/kernel/drivers/video/
#cp nvidia-modeset.ko /lib/modules/6.1.0-30-amd64/kernel/drivers/video/

mkdir -p /lib/modules/6.1.0-30-amd64/kernel/drivers/video/
#cp nvidia.ko /lib/modules/6.1.0-30-amd64/kernel/drivers/video/

#cp nvidia-uvm.ko /lib/modules/6.1.0-30-amd64/kernel/drivers/video/

cp libnvidia-tls.so.560.35.03 /usr/lib/x86_64-linux-gnu/
cp libnvidia-ml.so.560.35.03 /usr/lib/x86_64-linux-gnu/

cp nvidia-installer /usr/bin/

cp nvidia-modprobe /usr/bin/

cp nvidia-xconfig /usr/bin/

cp nvidia-settings /usr/bin/

cp libnvidia-gtk2.so.560.35.03 /usr/lib/x86_64-linux-gnu/
cp libnvidia-gtk3.so.560.35.03 /usr/lib/x86_64-linux-gnu/

cp nvidia-smi /usr/bin/

cp nvidia-debugdump /usr/bin/
cp nvidia-bug-report.sh /usr/bin/

cp nvidia-persistenced /usr/bin/

cp libnvcuvid.so.560.35.03 /usr/lib/x86_64-linux-gnu/

cp libnvidia-encode.so.560.35.03 /usr/lib/x86_64-linux-gnu/

cp libnvidia-api.so.1 /usr/lib/x86_64-linux-gnu/

cp libnvidia-fbc.so.560.35.03 /usr/lib/x86_64-linux-gnu/

mkdir -p /usr/share/X11/xorg.conf.d/
cp nvidia-drm-outputclass.conf /usr/share/X11/xorg.conf.d/

mkdir -p /usr/share/nvidia
cp nvidia-application-profiles-560.35.03-rc /usr/share/nvidia/
cp nvidia-application-profiles-560.35.03-key-documentation /usr/share/nvidia/

cp libnvoptix.so.560.35.03 /usr/lib/x86_64-linux-gnu/
cp nvoptix.bin /usr/share/nvidia/

cp libnvidia-opticalflow.so.560.35.03 /usr/lib/x86_64-linux-gnu/

cp libnvidia-ngx.so.560.35.03 /usr/lib/x86_64-linux-gnu/
cp nvidia-ngx-updater /usr/bin/

#cp nvidia-peermem.ko /lib/modules/6.1.0-30-amd64/kernel/drivers/video/

mkdir -p /usr/lib/x86_64-linux-gnu/nvidia/wine/
cp nvngx.dll /usr/lib/x86_64-linux-gnu/nvidia/wine/
cp _nvngx.dll /usr/lib/x86_64-linux-gnu/nvidia/wine/

mkdir -p /usr/lib/firmware/nvidia/560.35.03/
cp ./firmware/gsp_tu10x.bin /usr/lib/firmware/nvidia/560.35.03/
cp ./firmware/gsp_ga10x.bin /usr/lib/firmware/nvidia/560.35.03/

cp libnvidia-vksc-core.so.560.35.03 /usr/lib/x86_64-linux-gnu/
cp nvidia-pcc /usr/bin/
mkdir -p /etc/vulkansc/icd.d/
cp nvidia_icd.json /etc/vulkansc/icd.d/
#TODO: .ko perhaps mount --bind
# 919

ln -sf /usr/lib/xorg/modules/extensions/libglxserver_nvidia.so.560.35.03 /usr/lib/xorg/modules/extensions/libglxserver_nvidia.so

ln -sf /usr/lib/x86_64-linux-gnu/libGL.so.1.7.0 /usr/lib/x86_64-linux-gnu/libGL.so.1
ln -sf /usr/lib/x86_64-linux-gnu/libGL.so.1 /usr/lib/x86_64-linux-gnu/libGL.so

ln -sf /usr/lib/x86_64-linux-gnu/libcuda.so.560.35.03 /usr/lib/x86_64-linux-gnu/libcuda.so
