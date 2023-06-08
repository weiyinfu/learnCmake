CMAKE_ROOT=$(pwd)

clean_dir(){
  DIR=$1
  if [ ! -d ${DIR} ]; then
    mkdir -p ${DIR}
  fi

  rm -rf ${DIR}/*
}

build_ios(){
  BUILD_ROOT=$1
  BUILD_SHARED=$2
  BUILD_PLATFORM=$3

  BUILD_DIR=${BUILD_ROOT}/temp/${BUILD_PLATFORM}
  clean_dir ${BUILD_DIR}

  cd ${BUILD_DIR}

  cmake -DBUILD_IOS=ON \
        -DBUILD_SHARED=${BUILD_SHARED} \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -G Xcode \
        -DCMAKE_TOOLCHAIN_FILE=${CMAKE_ROOT}/cmake/ios.toolchain.cmake \
        -DPLATFORM=${BUILD_PLATFORM} \
        ${CMAKE_ROOT}
  cmake --build . --config Release --target install
}

BUILD_ROOT=${CMAKE_ROOT}/build/ios
clean_dir ${BUILD_ROOT}
build_ios ${BUILD_ROOT} ON OS64
