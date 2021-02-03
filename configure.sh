#!/bin/bash

tag="${1}"
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

case ${tag} in
  "cpu")
    enable_avx
    enable_openmp
    ;;
  "cpu-noopt")
    enable_openmp
    ;;
  "cpu-cv")
    enable_opencv
    enable_avx
    enable_openmp
    ;;
  "cpu-noopt-cv")
    enable_opencv
    enable_openmp
    ;;
  "gpu")
    enable_gpu
    enable_cudnn
    ;;
  "gpu-cv")
    enable_gpu
    enable_cudnn
    enable_opencv
    ;;
  "gpu-cc53")
    enable_gpu
    enable_cudnn
    enable_arch 53
    ;;
  "gpu-cv-cc53")
    enable_gpu
    enable_cudnn
    enable_opencv
    enable_arch 53
    ;;
  "gpu-cc60")
    enable_gpu
    enable_cudnn
    enable_arch 60
    ;;
  "gpu-cv-cc60")
    enable_gpu
    enable_cudnn
    enable_opencv
    enable_arch 60
    ;;
  "gpu-cc61")
    enable_gpu
    enable_cudnn
    enable_arch 61
    ;;
  "gpu-cv-cc61")
    enable_gpu
    enable_cudnn
    enable_opencv
    enable_arch 61
    ;;
  "gpu-cc62")
    enable_gpu
    enable_cudnn
    enable_arch 62
    ;;
  "gpu-cv-cc62")
    enable_gpu
    enable_cudnn
    enable_opencv
    enable_arch 62
    ;;
  "gpu-cc70")
    enable_gpu
    enable_cudnn
    enable_cudnn_half
    enable_arch 70
    ;;
  "gpu-cv-cc70")
    enable_gpu
    enable_cudnn
    enable_cudnn_half
    enable_opencv
    enable_arch 70
    ;;
  "gpu-cc72")
    enable_gpu
    enable_cudnn
    enable_cudnn_half
    enable_arch 72
    ;;
  "gpu-cv-cc72")
    enable_gpu
    enable_cudnn
    enable_cudnn_half
    enable_opencv
    enable_arch 72
    ;;
  "gpu-cc75")
    enable_gpu
    enable_cudnn
    enable_cudnn_half
    enable_arch 75
    ;;
  "gpu-cv-cc75")
    enable_gpu
    enable_cudnn
    enable_cudnn_half
    enable_opencv
    enable_arch 75
    ;;
  "gpu-cc80")
    enable_gpu
    enable_cudnn
    enable_cudnn_half
    enable_arch 80
    ;;
  "gpu-cv-cc80")
    enable_gpu
    enable_cudnn
    enable_cudnn_half
    enable_opencv
    enable_arch 80
    ;;
  "gpu-cc86")
    enable_gpu
    enable_cudnn
    enable_cudnn_half
    enable_arch 86
    ;;
  "gpu-cv-cc86")
    enable_gpu
    enable_cudnn
    enable_cudnn_half
    enable_opencv
    enable_arch 86
    ;;
  *)
    echo "error: $tag is not supported"
    exit 1
    ;;
esac
