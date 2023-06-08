CMAKE_ROOT=$(pwd)

clean_dir(){
  DIR=$1
  if [ ! -d ${DIR} ]; then
    mkdir -p ${DIR}
  fi

  rm -rf ${DIR}/*
}

build_linux(){
  BUILD_ROOT=$1
  BUILD_SHARED=$2

  BUILD_DIR=${BUILD_ROOT}/temp
  clean_dir ${BUILD_DIR}

  cd ${BUILD_DIR}

  cmake -DBUILD_LINUX=ON \
        -DBUILD_SHARED=${BUILD_SHARED} \
        -DCMAKE_BUILD_TYPE=RELEASE \
        ${CMAKE_ROOT}

  make clean
  make VERBOSE=1 -j8
  make install
}

BUILD_ROOT=${CMAKE_ROOT}/build/linux
clean_dir ${BUILD_ROOT}

build_linux ${BUILD_ROOT} ON
cd ${BUILD_ROOT}/shared
patchelf --set-rpath ./ xxx.so

build_linux ${BUILD_ROOT} OFF
cd ${BUILD_ROOT}/static
