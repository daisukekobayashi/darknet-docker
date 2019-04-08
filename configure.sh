#!/bin/bash

option="${1}"
makefile="Makefile"

function enable_gpu() {
  echo "enable GPU flag"
  sed -i -e 's/GPU=0/GPU=1/g' $makefile
}

function enable_cudnn() {
  echo "enable CUDNN flag"
  sed -i -e 's/CUDNN=0/CUDNN=1/g' $makefile
}

function enable_cudnn_half() {
  echo "enable CUDNN_HALF flag"
  sed -i -e 's/CUDNN_HALF=0/CUDNN_HALF=1/g' $makefile
}

function enable_opencv() {
  echo "enable OPENCV flag"
  sed -i -e 's/OPENCV=0/OPENCV=1/g' $makefile
}

function enable_avx() {
  echo "enable AVX flag"
  sed -i -e 's/AVX=0/AVX=1/g' $makefile
}

function enable_openmp() {
  echo "enable OPENMP flag"
  sed -i -e 's/OPENMP=0/OPENMP=1/g' $makefile
}

function enable_libso() {
  echo "enable LIBSO flag"
  sed -i -e 's/LIBSO=0/LIBSO=1/g' $makefile
}

function enable_zed_camera() {
  echo "enable ZED_CAMERA flag"
  sed -i -e 's/ZED_CAMERA=0/ZED_CAMERA=1/g' $makefile
}

function enable_debug() {
  echo "enable DEBUG flag"
  sed -i -e 's/DEBUG=0/DEBUG=1/g' $makefile
}

function enable_arch() {
  echo "enable ARCH= -gencode arch=compute_$1,code[sm_$1,compute_$1"
  sed -i -e "s/# ARCH= -gencode arch=compute_$1/ARCH= -gencode arch=compute_$1/g" $makefile
}

case ${option} in
  "cpu")
    enable_opencv
    enable_avx
    enable_openmp
    ;;
  "gpu")
    enable_gpu
    enable_cudnn
    enable_opencv
    ;;
  "gpu_cc53")
    enable_gpu
    enable_cudnn
    enable_opencv
    enable_arch 53
    ;;
  "gpu_cc60")
    enable_gpu
    enable_cudnn
    enable_opencv
    enable_arch 60
    ;;
  "gpu_cc61")
    enable_gpu
    enable_cudnn
    enable_opencv
    enable_arch 61
    ;;
  "gpu_cc62")
    enable_gpu
    enable_cudnn
    enable_opencv
    enable_arch 62
    ;;
  "gpu_cc70")
    enable_gpu
    enable_cudnn
    enable_cudnn_half
    enable_opencv
    enable_arch 70
    ;;
  "gpu_cc72")
    enable_gpu
    enable_cudnn
    enable_cudnn_half
    enable_opencv
    enable_arch 72
    ;;
  "gpu_cc75")
    enable_gpu
    enable_cudnn
    enable_cudnn_half
    enable_opencv
    enable_arch 75
    ;;
  *)
    echo "error"
    ;;
esac
