CMAKE_ROOT=$(pwd)

clean_dir(){
  DIR=$1
  if [ ! -d ${DIR} ]; then
    mkdir -p ${DIR}
  fi

  rm -rf ${DIR}/*
}

build_mac(){
  BUILD_ROOT=$1
  BUILD_SHARED=$2
  ARCH=$3

  BUILD_DIR=${BUILD_ROOT}/temp
  clean_dir ${BUILD_DIR}

  cd ${BUILD_DIR}

  cmake -DBUILD_MAC=ON \
        -DBUILD_SHARED=${BUILD_SHARED} \
        -DCMAKE_OSX_ARCHITECTURES=${ARCH} \
        -DCMAKE_BUILD_TYPE=RELEASE \
        ${CMAKE_ROOT}

  make clean
  make VERBOSE=1 -j8
  make install
}

BUILD_ROOT=${CMAKE_ROOT}/build/mac
clean_dir ${BUILD_ROOT}

build_mac ${BUILD_ROOT} ON "x86_64"

build_mac ${BUILD_ROOT} OFF "x86_64"
