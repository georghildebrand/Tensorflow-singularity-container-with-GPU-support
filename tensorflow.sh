driver_version=352.93
cuda="cuda_7.5.18_linux.run"
cudnn="cudnn-7.5-linux-x64-v5.1.tgz"
TF_GPU_PKG="https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.10.0-cp27-none-linux_x86_64.whl"

sh /mnt/NVIDIA-Linux-x86_64-$driver_version.run -x
mv NVIDIA-Linux-x86_64-$driver_version /usr/local/
sh /mnt/links.sh $driver_version

sh /mnt/$cuda --toolkit --silent
tar xvf /mnt/$cudnn -C /usr/local

driver_path=/usr/local/NVIDIA-Linux-x86_64-$driver_version
echo "LD_LIBRARY_PATH=/usr/local/cuda/lib64:$driver_path:$LD_LIBRARY_PATH" >> /environment
echo "PATH=$driver_path:\$PATH" >> /environment
echo "export PATH LD_LIBRARY_PATH" >> /environment

pip install --upgrade pip
pip install matplotlib
pip install --upgrade $TF_GPU_PKG
