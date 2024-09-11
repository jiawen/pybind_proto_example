import line_pybind

def make_default_line_wrapper():
    return line_pybind.make_default_line()

def make_line_with_params_lambda_wrapper(scale, offset):
    return line_pybind.make_line_with_params_lambda(scale, offset)

def make_line_with_one_more_than_scale_two_less_than_offset(scale, offset):
    return line_pybind.make_line_with_params_lambda(scale + 1.0, offset - 2.0)
