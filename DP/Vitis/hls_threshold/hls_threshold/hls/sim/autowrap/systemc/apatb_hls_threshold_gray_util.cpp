#include <iostream>
#include "hls_stream.h"
#include "hls_directio.h"

using namespace std;

struct __cosim_T_3__ {char data[3];};
extern "C" void fpga_fifo_push_3(__cosim_T_3__* val, hls::stream<__cosim_T_3__>* fifo) {
  fifo->write(*val);
}
extern "C" void fpga_fifo_pop_3(__cosim_T_3__* val, hls::stream<__cosim_T_3__>* fifo) {
  *val = fifo->read();
}
extern "C" bool fpga_fifo_not_empty_3(hls::stream<__cosim_T_3__>* fifo) {
  return !fifo->empty();
}
extern "C" bool fpga_fifo_exist_3(hls::stream<__cosim_T_3__>* fifo) {
  return fifo->exist();
}
extern "C" bool fpga_direct_valid_3(hls::directio<__cosim_T_3__, 0>* direct) {
  return direct->valid();
}
extern "C" void fpga_direct_load_3(__cosim_T_3__* val, hls::directio<__cosim_T_3__, 0>* direct) {
  *val = direct->read();
}
extern "C" void fpga_direct_store_3(__cosim_T_3__* val, hls::directio<__cosim_T_3__, 0>* direct) {
  direct->write(*val);
}
