# Darknet Docker Images

Docker images for Darknet Yolo v3 & v2. [AlexeyAB/darknet](https://github.com/AlexeyAB/darknet "AlexeyAB/darknet")

## Base Image Tags

All of Darknet's images are based on Ubuntu 18.04. ``gpu-`` images are based on [10.0-cudnn7-devel-ubuntu18.04](https://hub.docker.com/r/nvidia/cuda/ "nvidia/cuda").

Tags means options in the Makefile when darknet binary was built. You can check options [here](https://github.com/AlexeyAB/darknet#how-to-compile-on-linux "How to compile on Linux").

* ``cpu`` tag means images are built with `AVX=1` and `OPENMP=1`.
* ``cv`` tag means images are built with `OPENCV=1`
* ``gpu`` tag means images are built with ``GPU=1`` and ``CUDNN=1``
    - ``cc**`` tag means compute compability of GPU. Images with this tag are optimized for GPU architecture. You can check compute compability of your GPU [here](https://developer.nvidia.com/cuda-gpus "CUDA GPUs"). If compute compability is greater than or equal to 7.0, images are built with ``CUDNN_HALF=1``.

## Running docker container

```sh
$ docker run --rm -v $PWD:/workspace -w /workspace \
        daisukekobayashi/darknet:cpu darknet ...
```

Start a Darknet cpu container.

---

```sh
$ docker run --runtime=nvidia --rm -v $PWD:/workspace -w /workspace \
        daisukekobayashi/darknet:gpu darknet ...
```

You need to specify nvidia runtime when you use Darknet gpu container.

---

```sh
$ git clone https://github.com/AlexeyAB/darknet.git
$ cd darknet/build/x64
$ curl -L -O https://pjreddie.com/media/files/yolov3.weights
$ docker run --runtime=nvidia --rm -v $PWD:/workspace -w /workspace daisukekobayashi/darknet:gpu \
        darknet detector test data/coco.data yolov3.cfg yolov3.weights -i 0 -thresh 0.25 dog.jpg -ext_output
```

This is example to test yolov3 using Darknet gpu container.

---

```sh
$ docker run --rm -it daisukekobayashi/darinet:cpu bash -c 'echo "$SOURCE_BRANCH" && echo "$SOURCE_COMMIT"'
```

Check darknet version.
