
# multiply.py

import ctypes
import os
import pytest

lib = ctypes.CDLL(os.path.abspath("shared/multiply.so"))

def test_multiply():
    result = lib.ft_multiply(2, 3)
    assert result == 7
