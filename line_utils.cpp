#include "line_utils.h"

namespace example {

Line makeDefaultLine() {
  Line line;
  line.set_scale(5.0f);
  line.set_offset(8.0f);
  return line;
}

} // namespace example
