#include "line_utils.h"
#include "pybind11/pybind11.h"
#include "pybind11_protobuf/native_proto_caster.h"

namespace py = ::pybind11;

namespace example {
namespace {

// The first argument is the module name. It has to match the name of the .so
// being built. The second argument is an instance of py::module_.

void setBindings(py::module_ &m) {
  m.def("make_default_line", &makeDefaultLine);
  m.def("make_line_with_params_lambda", [](float scale, float offset) {
    Line line;
    line.set_scale(scale);
    line.set_offset(offset);
    return line;
  });
}

PYBIND11_MODULE(line_pybind, m) { setBindings(m); }

} // namespace
} // namespace example
