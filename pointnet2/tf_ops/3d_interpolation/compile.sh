TF_CFLAGS=$(python3 -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_compile_flags()))')
TF_LFLAGS=$(python3 -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_link_flags()))')
  
g++ -std=c++11 tf_interpolate.cpp -o tf_interpolate_so.so -shared -fPIC -shared -fPIC ${TF_CFLAGS} ${TF_LFLAGS} -O2
