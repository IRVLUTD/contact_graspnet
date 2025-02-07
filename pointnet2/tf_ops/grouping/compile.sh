CUDA_INCLUDE=' -I/usr/local/cuda/include/'
CUDA_LIB=' -L/usr/local/cuda/lib64/'
TF_CFLAGS=$(python3 -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_compile_flags()))')
TF_LFLAGS=$(python3 -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_link_flags()))')

nvcc -std=c++11 -c -o tf_grouping_g.cu.o tf_grouping_g.cu \
 ${CUDA_INCLUDE} ${TF_CFLAGS} -D GOOGLE_CUDA=1 -x cu -Xcompiler -fPIC

g++ -std=c++11 -shared -o tf_grouping_so.so tf_grouping.cpp \
 tf_grouping_g.cu.o ${CUDA_INCLUDE} ${TF_CFLAGS} -fPIC -lcudart ${TF_LFLAGS} ${CUDA_LIB}

