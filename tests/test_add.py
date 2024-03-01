
# add.py

import ctypes
import os
import pytest

lib = ctypes.CDLL(os.path.abspath("shared/add.so"))

def test_add():
    result = lib.ft_add(2, 3)
    assert result == 5
