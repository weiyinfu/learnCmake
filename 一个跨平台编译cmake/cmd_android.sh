if [ -z "$ANDROID_NDK_HOME" ]; then
    ANDROID_NDK_HOME="/Users/admin/Library/Android/sdk/ndk/android-ndk-r21b"
fi

CMAKE_ROOT=$(pwd)

clean_dir(){
  DIR=$1
  if [ ! -d ${DIR} ]; then
    mkdir -p ${DIR}
  fi

  rm -rf ${DIR}/*
}

build_android(){
  BUILD_ROOT=$1
  BUILD_SHARED=$2
  ANDROID_ABI=$3
  CMAKE_PATH=$4
  CMAKE_TOOLCHAIN_FILE=$5/build/cmake/android.toolchain.cmake
  ANDROID_PLATFORM=$6

  if [ ! -f ${CMAKE_TOOLCHAIN_FILE} ]; then
    echo "${CMAKE_TOOLCHAIN_FILE} not exists"
    exit 1
  fi

  BUILD_DIR=${BUILD_ROOT}/temp/${ANDROID_ABI}
  clean_dir ${BUILD_DIR}

  cd ${BUILD_DIR}

  cmake -DBUILD_ANDROID=ON \
        -DBUILD_SHARED=${BUILD_SHARED} \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE} \
        -DANDROID_NDK=${ANDROID_NDK_HOME} \
        -DANDROID_ABI=${ANDROID_ABI} \
        -DANDROID_STL=c++_shared \
        -DANDROID_TOOLCHAIN=clang \
        -DANDROID_PLATFORM=${ANDROID_PLATFORM} \
        ${CMAKE_ROOT}

  make clean
  make VERBOSE=1 -j8
  make install
}

BUILD_ROOT=${CMAKE_ROOT}/build/android
clean_dir ${BUILD_ROOT}
build_android ${BUILD_ROOT} ON arm64-v8a cmake ${ANDROID_NDK_HOME} "android-21"
build_android ${BUILD_ROOT} OFF arm64-v8a cmake ${ANDROID_NDK_HOME} "android-21"
build_android ${BUILD_ROOT} ON armeabi-v7a cmake ${ANDROID_NDK_HOME} "android-16"
build_android ${BUILD_ROOT} OFF armeabi-v7a cmake ${ANDROID_NDK_HOME} "android-16"

