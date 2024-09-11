# Example of the Pybind11 "stack" using Bazel

This example shows how to put together a Bazel workspace for a project that
combines C++ and Python. It uses the following projects (in lexigraphic order) in concert:

* abseil-cpp (com_google_absl)
* pybind11
* pybind11_abseil
* pybind11_bazel
* pybind11_protobuf
* rules_proto
* rules_python

Of note is the small patch we apply to `com_google_protobuf` to get everything
to build in Bazel.

I have not tried getting the whole stack working with bzlmod as rules_python (as of 0.31.0) does not yet have full support.
