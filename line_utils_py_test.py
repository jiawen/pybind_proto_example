import py_line_utils
import line_pybind  # Can import the module directly bypassing the py_library.
import unittest


class TestPyLineUtils(unittest.TestCase):

    def test_make_default_wrapper(self):
        line = py_line_utils.make_default_line_wrapper()
        self.assertEqual(line.scale, 5.0)
        self.assertEqual(line.offset, 8.0)

    def test_make_line_with_params_lambda_wrapper(self):
        line = py_line_utils.make_line_with_params_lambda_wrapper(1.0, 2.0)
        self.assertEqual(line.scale, 1.0)
        self.assertEqual(line.offset, 2.0)

    def test_make_line_with_one_more_than_scale_two_less_than_offset(self):
        line = py_line_utils.make_line_with_one_more_than_scale_two_less_than_offset(
            3.0, 11.0)
        self.assertEqual(line.scale, 4.0)
        self.assertEqual(line.offset, 9.0)

    def test_can_use_bindings_without_wrapper(self):
        default_line = line_pybind.make_default_line()
        self.assertEqual(default_line.scale, 5.0)
        self.assertEqual(default_line.offset, 8.0)

        my_line = line_pybind.make_line_with_params_lambda(16.0, 32.0)
        self.assertEqual(my_line.scale, 16.0)
        self.assertEqual(my_line.offset, 32.0)


if __name__ == '__main__':
    unittest.main()
