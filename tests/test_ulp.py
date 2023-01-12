import os
import struct
from ctypes import CDLL, c_float
from queue import Queue

import numpy as np
import pytest

import utils
from analyzers.analysis_functions import AnalysisFunctions


class ULPFunctions:
    def __init__(self):
        so_file = '../C-functions/ulp.so'
        self.ulp_file = CDLL(os.getcwd() + '/' + so_file)
        self.ulp_file.ulp.restype = c_float

    def ulp_c(self, a, b):
        return np.float32(self.ulp_file.ulp(c_float(a), c_float(b)))

    def ulp_python(self, a, b):
        return AnalysisFunctions.compute_ulp(a, b)


d = Queue()


class TestULP:

    # @pytest.mark.parametrize("e", np.random.uniform(np.finfo(np.float32).min, np.finfo(np.float32).max,
    #                                                 (10, 2)).astype(np.float32))
    # def test_ulp_benchmark(self, e, benchmark):
    #     ulp_functions = ULPFunctions()
    #     p_ulp = benchmark(ulp_functions.ulp_python, e[0], e[1])
    #     # c_ulp = benchmark(ulp_functions.ulp_c, e[0], e[1])
    #     # assert c_ulp == p_ulp

    @pytest.mark.parametrize("e", np.random.uniform(np.finfo(np.float32).min, np.finfo(np.float32).max,
                                                    (100_000, 2)).astype(np.float32))
    def test_ulp(self, e):
        ulp_functions = ULPFunctions()
        p_ulp = ulp_functions.ulp_python(e[0], e[1])
        c_ulp = ulp_functions.ulp_c(e[0], e[1])
        # print()
        # print("     C AnalysisFunctions -> " + self._binary_f(c_ulp))
        # print("Python AnalysisFunctions -> " + self._binary_f(c_ulp))
        # print()
        assert c_ulp == p_ulp

    # @pytest.mark.parametrize("e", [['00000000000000000000000000000000', '00000001000010101000001101100010'],
    #                                ['00000001000010101000001101100010', '00000001001111001100100111111010'],
    #                                ['00000001001111001100100111111010', '00000001011011100101001100001010'],
    #                                ['00000001011011100101001100001010', '00000010000001111010000011010111'],
    #                                ['00000010000001111010000011010111', '00000010000010110010000011111101'],
    #                                ['00000010000010110010000011111101', '00000010001010010001000010010010'],
    #                                ['00000010001010010001000010010010', '00000010001011111000000110000010'],
    #                                ['00000010001011111000000110000010', '00000010010010111111101011101101'],
    #                                ['00000010010010111111101011101101', '00000010011011110100010000110100'],
    #                                ['00000010011011110100010000110100', '00000010011101010011010000011110'],
    #                                ['00000010011101010011010000011110', '00000010100111000010001011001110'],
    #                                ['00000010100111000010001011001110', '00000010101100010001010010010111'],
    #                                ['00000010101100010001010010010111', '00000010110001001010101011010100'],
    #                                ['00000010110001001010101011010100', '00000011001001001101100001010000'],
    #                                ['00000011001001001101100001010000', '00000011001001110101011000100110'],
    #                                ['00000011001001110101011000100110', '00000011011100000110110001000011'],
    #                                ['00000011011100000110110001000011', '00000011100010001001100110111000'],
    #                                ['00000011100010001001100110111000', '00000011100011011001010001101011'],
    #                                ['00000011100011011001010001101011', '00000011101001000000111110111011'],
    #                                ['00000011101001000000111110111011', '00000011101011011111101111001101'],
    #                                ['00000011101011011111101111001101', '00000011111000000011101000111110'],
    #                                ['00000011111000000011101000111110', '00000100001001110100010001110111'],
    #                                ['00000100001001110100010001110111', '00000100011100000101110100101111'],
    #                                ['00000100011100000101110100101111', '00000100100000001010011100111000'],
    #                                ['00000100100000001010011100111000', '00000100101010100011010000100001'],
    #                                ['00000100101010100011010000100001', '00000100101110010011010000001101'],
    #                                ['00000100101110010011010000001101', '00000100110100011000100011101101'],
    #                                ['00000100110100011000100011101101', '00000100110110010100000100010000'],
    #                                ['00000100110110010100000100010000', '00000101000110011000001101110101'],
    #                                ['00000101000110011000001101110101', '00000101000111101000110000110111'],
    #                                ['00000101000111101000110000110111', '00000101001000101011110010011100'],
    #                                ['00000101001000101011110010011100', '00000101001011001110011101010110'],
    #                                ['00000101001011001110011101010110', '00000101001111111111100000011100'],
    #                                ['00000101001111111111100000011100', '00000101011000000111010010100100'],
    #                                ['00000101011000000111010010100100', '00000101011101111011010001001110'],
    #                                ['00000101011101111011010001001110', '00000101011110001101011001110010'],
    #                                ['00000101011110001101011001110010', '00000101011111000001010111100111'],
    #                                ['00000101011111000001010111100111', '00000101101111001111101100111000'],
    #                                ['00000101101111001111101100111000', '00000101110000101111001000010000'],
    #                                ['00000101110000101111001000010000', '00000101110000111000111111001000'],
    #                                ['00000101110000111000111111001000', '00000101111111001100000101101100'],
    #                                ['00000101111111001100000101101100', '00000110000010110110101101011101'],
    #                                ['00000110000010110110101101011101', '00000110000100010111000111011000'],
    #                                ['00000110000100010111000111011000', '00000110000101000000111000000010'],
    #                                ['00000110000101000000111000000010', '00000110010110000111000101010111'],
    #                                ['00000110010110000111000101010111', '00000110011101100001101101110110'],
    #                                ['00000110011101100001101101110110', '00000110101000111010010100101110'],
    #                                ['00000110101000111010010100101110', '00000110110110000000010100011001'],
    #                                ['00000110110110000000010100011001', '00000111000010101010101111000011'],
    #                                ['00000111000010101010101111000011', '00000111000011010000010011100111'],
    #                                ['00000111000011010000010011100111', '00000111001101100000011011101100'],
    #                                ['00000111001101100000011011101100', '00000111010011101110110010001100'],
    #                                ['00000111010011101110110010001100', '00000111011101000100111011001100'],
    #                                ['00000111011101000100111011001100', '00000111100010101110010101100001'],
    #                                ['00000111100010101110010101100001', '00000111101001000100011010110000'],
    #                                ['00000111101001000100011010110000', '00000111101110001010101011011110'],
    #                                ['00000111101110001010101011011110', '00000111110000101011001100111111'],
    #                                ['00000111110000101011001100111111', '00000111110010010010100001001010'],
    #                                ['00000111110010010010100001001010', '00000111110101101100100001100000'],
    #                                ['00000111110101101100100001100000', '00001000000000110001011100111001'],
    #                                ['00001000000000110001011100111001', '00001000000011110101111001000000'],
    #                                ['00001000000011110101111001000000', '00001000001001100110111001010101'],
    #                                ['00001000001001100110111001010101', '00001000001010011001001101100110'],
    #                                ['00001000001010011001001101100110', '00001000001011001110011011001101'],
    #                                ['00001000001011001110011011001101', '00001000011001001001111000100100'],
    #                                ['00001000011001001001111000100100', '00001000011011100111011011111000'],
    #                                ['00001000011011100111011011111000', '00001000011111000101000110100111'],
    #                                ['00001000011111000101000110100111', '00001000100001101111100010111110'],
    #                                ['00001000100001101111100010111110', '00001000110111001010010100011101'],
    #                                ['00001000110111001010010100011101', '00001001000001100101011001011010'],
    #                                ['00001001000001100101011001011010', '00001001000011100111100011111111'],
    #                                ['00001001000011100111100011111111', '00001001000100110111111001101011'],
    #                                ['00001001000100110111111001101011', '00001001001001000001110010100011'],
    #                                ['00001001001001000001110010100011', '00001001001100000010001001100110'],
    #                                ['00001001001100000010001001100110', '00001001010111000111010001010010'],
    #                                ['00001001010111000111010001010010', '00001001011101100110011010100000'],
    #                                ['00001001011101100110011010100000', '00001001100000101101010110110001'],
    #                                ['00001001100000101101010110110001', '00001001100100111100100000110111'],
    #                                ['00001001100100111100100000110111', '00001010000011001010110010110110'],
    #                                ['00001010000011001010110010110110', '00001010001000000100001100001000'],
    #                                ['00001010001000000100001100001000', '00001010001111011111101011001111'],
    #                                ['00001010001111011111101011001111', '00001010010101010110001010111110'],
    #                                ['00001010010101010110001010111110', '00001010011010110000110011000011'],
    #                                ['00001010011010110000110011000011', '00001010011101101100101000001111'],
    #                                ['00001010011101101100101000001111', '00001010100010110001101111001000'],
    #                                ['00001010100010110001101111001000', '00001010100011100111010010101101'],
    #                                ['00001010100011100111010010101101', '00001010101010000111100111011010'],
    #                                ['00001010101010000111100111011010', '00001010110011001110100000010110'],
    #                                ['00001010110011001110100000010110', '00001010111000001000000011111001'],
    #                                ['00001010111000001000000011111001', '00001011000101010101010001001100'],
    #                                ['00001011000101010101010001001100', '00001011010010111100101111111011'],
    #                                ['00001011010010111100101111111011', '00001011011100101101110010111111'],
    #                                ['00001011011100101101110010111111', '00001011011111110010011110011001'],
    #                                ['00000000000000000000000000000000', '00000000100000111010100011010110'],
    #                                ['00000000100000111010100011010110', '00000000100001101100000000101110'],
    #                                ['00000000100001101100000000101110', '00000000101101101100111110000111'],
    #                                ['00000000101101101100111110000111', '00000000110001100101011000101110'],
    #                                ['00000000110001100101011000101110', '00000000110100110011111101100111'],
    #                                ['00000000110100110011111101100111', '00000000111010010101000000101100'],
    #                                ['00000000111010010101000000101100', '00000001001111101111111000000001'],
    #                                ['00000001001111101111111000000001', '00000001011011111000111100001000'],
    #                                ['00000001011011111000111100001000', '00000001100001101001001001111101'],
    #                                ['00000001100001101001001001111101', '00000001101111010000100001110100'],
    #                                ['00000001101111010000100001110100', '00000001110000011100111100001011'],
    #                                ['00000001110000011100111100001011', '00000001110001010011111011001101'],
    #                                ['00000001110001010011111011001101', '00000010000110010010100001110011'],
    #                                ['00000010000110010010100001110011', '00000010001010101111001111111100'],
    #                                ['00000010001010101111001111111100', '00000010001011100011101111000010'],
    #                                ['00000010001011100011101111000010', '00000010001110100100010101010001'],
    #                                ['00000010001110100100010101010001', '00000010010001000000110000100000'],
    #                                ['00000010010001000000110000100000', '00000010011001010100011100011010'],
    #                                ['00000010011001010100011100011010', '00000010101110001001101000010111'],
    #                                ['00000010101110001001101000010111', '00000010111010100100111011000000'],
    #                                ['00000010111010100100111011000000', '00000011000001100110010100110011'],
    #                                ['00000011000001100110010100110011', '00000011001101100100000101011111'],
    #                                ['00000011001101100100000101011111', '00000011001111010010111000111110'],
    #                                ['00000011001111010010111000111110', '00000011011000101111111000101111'],
    #                                ['00000011011000101111111000101111', '00000011011001010000111000011101'],
    #                                ['00000011011001010000111000011101', '00000011100011100010110001011101'],
    #                                ['00000011100011100010110001011101', '00000011101001110000001111010000'],
    #                                ['00000011101001110000001111010000', '00000011101011010000101101110110'],
    #                                ['00000011101011010000101101110110', '00000011111011000011100101110111'],
    #                                ['00000011111011000011100101110111', '00000011111111011010110110011001'],
    #                                ['00000011111111011010110110011001', '00000100001001010000001010100100'],
    #                                ['00000100001001010000001010100100', '00000100001010011000000110010111'],
    #                                ['00000100001010011000000110010111', '00000100001111100111010110110110'],
    #                                ['00000100001111100111010110110110', '00000100011000001100011100011010'],
    #                                ['00000100011000001100011100011010', '00000100100010111001110101110100'],
    #                                ['00000100100010111001110101110100', '00000100100011000011010111111011'],
    #                                ['00000100100011000011010111111011', '00000100111001001001111001010010'],
    #                                ['00000100111001001001111001010010', '00000100111010110101100011000101'],
    #                                ['00000100111010110101100011000101', '00000101000001110111001000001000'],
    #                                ['00000101000001110111001000001000', '00000101001001011111110000111011'],
    #                                ['00000101001001011111110000111011', '00000101001001100101111010010110'],
    #                                ['00000101001001100101111010010110', '00000101001011001100110000101010'],
    #                                ['00000101001011001100110000101010', '00000101001011110101101100010001'],
    #                                ['00000101001011110101101100010001', '00000101001101100011000001011100'],
    #                                ['00000101001101100011000001011100', '00000101001110011011000111001001'],
    #                                ['00000101001110011011000111001001', '00000101100011000101111100000000'],
    #                                ['00000101100011000101111100000000', '00000101100111100111101010110001'],
    #                                ['00000101100111100111101010110001', '00000101101000000111000011101011'],
    #                                ['00000101101000000111000011101011', '00000101110110100011001111010000'],
    #                                ['00000101110110100011001111010000', '00000101111011001011101111111010'],
    #                                ['00000101111011001011101111111010', '00000101111101111100111111110011'],
    #                                ['00000101111101111100111111110011', '00000110000010010101100000010111'],
    #                                ['00000110000010010101100000010111', '00000110000101001011111101011001'],
    #                                ['00000110000101001011111101011001', '00000110000111010110100000111010'],
    #                                ['00000110000111010110100000111010', '00000110010000010010110110101010'],
    #                                ['00000110010000010010110110101010', '00000110011111111100010101010001'],
    #                                ['00000110011111111100010101010001', '00000110100000100011001111011011'],
    #                                ['00000110100000100011001111011011', '00000110100011011100011000001111'],
    #                                ['00000110100011011100011000001111', '00000110100011100110110011101100'],
    #                                ['00000110100011100110110011101100', '00000110100101000111011100011011'],
    #                                ['00000110100101000111011100011011', '00000110101000000101101001001011'],
    #                                ['00000110101000000101101001001011', '00000110101110010001000111001000'],
    #                                ['00000110101110010001000111001000', '00000110101111001011011110000110'],
    #                                ['00000110101111001011011110000110', '00000110101111001110100000110001'],
    #                                ['00000110101111001110100000110001', '00000110110101010110101001010001'],
    #                                ['00000110110101010110101001010001', '00000111000011011110011100101110'],
    #                                ['00000111000011011110011100101110', '00000111000110100001010101001100'],
    #                                ['00000111000110100001010101001100', '00000111000111101111011101011010'],
    #                                ['00000111000111101111011101011010', '00000111001001111000000001111110'],
    #                                ['00000111001001111000000001111110', '00000111010001110110001010101011'],
    #                                ['00000111010001110110001010101011', '00000111011001110111111100000000'],
    #                                ['00000111011001110111111100000000', '00000111100000100010101101110101'],
    #                                ['00000111100000100010101101110101', '00000111100011110000101101110100'],
    #                                ['00000111100011110000101101110100', '00000111101101110000010101110110'],
    #                                ['00000111101101110000010101110110', '00000111101101111001110001001100'],
    #                                ['00000111101101111001110001001100', '00000111110011110010110000000100'],
    #                                ['00000111110011110010110000000100', '00000111110100110010011011101000'],
    #                                ['00000111110100110010011011101000', '00001000000110101011000001001010'],
    #                                ['00001000000110101011000001001010', '00001000011010010000010101011000'],
    #                                ['00001000011010010000010101011000', '00001000011100111100110011111110'],
    #                                ['00001000011100111100110011111110', '00001000100001101001101101001110'],
    #                                ['00001000100001101001101101001110', '00001000101010010100001101100101'],
    #                                ['00001000101010010100001101100101', '00001000101100000101011011000011'],
    #                                ['00001000101100000101011011000011', '00001000101101110101010101000001'],
    #                                ['00001000101101110101010101000001', '00001000101110110010001100101001'],
    #                                ['00001000101110110010001100101001', '00001000110001111001111111010101'],
    #                                ['00001000110001111001111111010101', '00001000110100010011001110000011'],
    #                                ['00001000110100010011001110000011', '00001000111000000000011000100001'],
    #                                ['00001000111000000000011000100001', '00001000111011101001111000010101'],
    #                                ['00001000111011101001111000010101', '00001001000011010001001011110001'],
    #                                ['00001001000011010001001011110001', '00001001011101011100000010110010'],
    #                                ['00001001011101011100000010110010', '00001001100010010000001010001100'],
    #                                ['00001001100010010000001010001100', '00001001100011111000111111100111'],
    #                                ['00001001100011111000111111100111', '00001001100100101000000011111111'],
    #                                ['00001001100100101000000011111111', '00001001100110100010001001111100'],
    #                                ['00001001100110100010001001111100', '00001001101000010001010010010111'],
    #                                ['00001001101000010001010010010111', '00001001101010000000011110001010'],
    #                                ['00001001101010000000011110001010', '00001001101110100100011100000100'],
    #                                ['00001001101110100100011100000100', '00001001111000111110110101011000'],
    #                                ['00001001111000111110110101011000', '00001001111100101101000101001011'],
    #                                ['00001001111100101101000101001011', '00001010000010001111111000011000'],
    #                                ['00001010000010001111111000011000', '00001010000101000000100001101101'],
    #                                ['00001010000101000000100001101101', '00001010001001101101101011010011'],
    #                                ['00001010001001101101101011010011', '00001010010010001110010000101001'],
    #                                ['00001010010010001110010000101001', '00001010010111101010001001001011'],
    #                                ['00001010010111101010001001001011', '00001010011101110101111100001010'],
    #                                ['00001010011101110101111100001010', '00001010100000101001111011000001'],
    #                                ['00001010100000101001111011000001', '00001010100000101100000101011011'],
    #                                ['00001010100000101100000101011011', '00001010101000111110100100110010'],
    #                                ['00001010101000111110100100110010', '00001010101001111010000111001010'],
    #                                ['00001010101001111010000111001010', '00001010101100000011011100010000'],
    #                                ['00001010101100000011011100010000', '00001010111011010110100101100010'],
    #                                ['00001010111011010110100101100010', '00001010111011111100101111010100'],
    #                                ['00001010111011111100101111010100', '00001010111100011111000100101010'],
    #                                ['00001010111100011111000100101010', '00001011000010010010110101111101'],
    #                                ['00001011000010010010110101111101', '00001011001101010100100100001111'],
    #                                ['00001011001101010100100100001111', '00001011010000101000101110101001'],
    #                                ['00001011010000101000101110101001', '00001011010001001001010011011110'],
    #                                ['00001011010001001001010011011110', '00001011010100000111010000100000'],
    #                                ['00001011010100000111010000100000', '00001011010100100001100001001001'],
    #                                ['00001011010100100001100001001001', '00001011010101100101101011000011']])
    @pytest.mark.parametrize("e", [['0b00001000101011010101000000101000', '0b11111110100000000000000000000000']])
    def test_ulp_particular_cases(self, e):
        ulp_functions = ULPFunctions()
        p_ulp = ulp_functions.ulp_python(utils.binary_to_float(e[0]), utils.binary_to_float(e[1]))
        c_ulp = ulp_functions.ulp_c(utils.binary_to_float(e[0]), utils.binary_to_float(e[1]))
        print(list(d.queue))
        assert c_ulp == p_ulp


# a = ['01001111011101011000000000000000', '01001111011101011000000000000000', '01001111011101011000000000000000',
#      '01001111011101101000000000000000', '01001111011101101000000000000000', '01001111011101101000000000000000',
#      '01001111011101101000000000000000', '01001111011101101000000000000000', '01001111011101101000000000000000',
#      '01001111011101101000000000000000', '01001111011101110000000000000000', '01001111011101110000000000000000',
#      '01001111011101110000000000000000', '01001111011101111000000000000000', '01001111011101111000000000000000',
#      '01001111011101111000000000000000', '01001111011110000000000000000000', '01001111011110000000000000000000',
#      '01001111011110000000000000000000', '01001111011110000000000000000000', '01001111011110000000000000000000',
#      '01001111011110001000000000000000', '01001111011110001000000000000000', '01001111011110010000000000000000',
#      '01001111011110010000000000000000', '01001111011110010000000000000000', '01001111011110010000000000000000',
#      '01001111011110010000000000000000', '01001111011110011000000000000000', '01001111011110011000000000000000',
#      '01001111011110011000000000000000', '01001111011110011000000000000000', '01001111011110011000000000000000',
#      '01001111011110011000000000000000', '01001111011110011000000000000000', '01001111011110011000000000000000',
#      '01001111011110011000000000000000', '01001111011110100000000000000000', '01001111011110100000000000000000',
#      '01001111011110100000000000000000', '01001111011110100000000000000000', '01001111011110101000000000000000',
#      '01001111011110101000000000000000', '01001111011110101000000000000000', '01001111011110101000000000000000',
#      '01001111011110101000000000000000', '01001111011110110000000000000000', '01001111011110110000000000000000',
#      '01001111011110111000000000000000', '01001111011110111000000000000000', '01001111011110111000000000000000',
#      '01001111011110111000000000000000', '01001111011110111000000000000000', '01001111011111000000000000000000',
#      '01001111011111000000000000000000', '01001111011111000000000000000000', '01001111011111000000000000000000',
#      '01001111011111000000000000000000', '01001111011111000000000000000000', '01001111011111001000000000000000',
#      '01001111011111001000000000000000', '01001111011111001000000000000000', '01001111011111001000000000000000',
#      '01001111011111001000000000000000', '01001111011111001000000000000000', '01001111011111001000000000000000',
#      '01001111011111001000000000000000', '01001111011111010000000000000000', '01001111011111010000000000000000',
#      '01001111011111011000000000000000', '01001111011111011000000000000000', '01001111011111011000000000000000',
#      '01001111011111011000000000000000', '01001111011111011000000000000000', '01001111011111011000000000000000',
#      '01001111011111011000000000000000', '01001111011111100000000000000000', '01001111011111100000000000000000',
#      '01001111011111101000000000000000', '01001111011111101000000000000000', '01001111011111101000000000000000',
#      '01001111011111101000000000000000', '01001111011111101000000000000000', '01001111011111101000000000000000',
#      '01001111011111110000000000000000', '01001111011111110000000000000000', '01001111011111110000000000000000',
#      '01001111011111110000000000000000', '01001111011111110000000000000000', '01001111011111111000000000000000',
#      '01001111011111111000000000000000', '01001111011111111000000000000000', '01001111011111111000000000000000',
#      '01001111011101010000000000000000', '01001111011101010000000000000000', '01001111011101010000000000000000',
#      '01001111011101010000000000000000', '01001111011101010000000000000000', '01001111011101010000000000000000',
#      '01001111011101011000000000000000', '01001111011101011000000000000000', '01001111011101100000000000000000',
#      '01001111011101100000000000000000', '01001111011101100000000000000000', '01001111011101100000000000000000',
#      '01001111011101101000000000000000', '01001111011101101000000000000000', '01001111011101101000000000000000',
#      '01001111011101101000000000000000', '01001111011101101000000000000000', '01001111011101101000000000000000',
#      '01001111011101110000000000000000', '01001111011101110000000000000000', '01001111011101111000000000000000',
#      '01001111011101111000000000000000', '01001111011101111000000000000000', '01001111011101111000000000000000',
#      '01001111011101111000000000000000', '01001111011110000000000000000000', '01001111011110000000000000000000',
#      '01001111011110000000000000000000', '01001111011110000000000000000000', '01001111011110000000000000000000',
#      '01001111011110001000000000000000', '01001111011110001000000000000000', '01001111011110001000000000000000',
#      '01001111011110001000000000000000', '01001111011110010000000000000000', '01001111011110010000000000000000',
#      '01001111011110010000000000000000', '01001111011110010000000000000000', '01001111011110011000000000000000',
#      '01001111011110011000000000000000', '01001111011110011000000000000000', '01001111011110011000000000000000',
#      '01001111011110011000000000000000', '01001111011110011000000000000000', '01001111011110011000000000000000',
#      '01001111011110100000000000000000', '01001111011110100000000000000000', '01001111011110100000000000000000',
#      '01001111011110100000000000000000', '01001111011110100000000000000000', '01001111011110100000000000000000',
#      '01001111011110101000000000000000', '01001111011110101000000000000000', '01001111011110101000000000000000',
#      '01001111011110101000000000000000', '01001111011110101000000000000000', '01001111011110110000000000000000',
#      '01001111011110110000000000000000', '01001111011110110000000000000000', '01001111011110110000000000000000',
#      '01001111011110110000000000000000', '01001111011110110000000000000000', '01001111011110110000000000000000',
#      '01001111011110110000000000000000', '01001111011110110000000000000000', '01001111011110111000000000000000',
#      '01001111011110111000000000000000', '01001111011110111000000000000000', '01001111011110111000000000000000',
#      '01001111011110111000000000000000', '01001111011110111000000000000000', '01001111011111000000000000000000',
#      '01001111011111000000000000000000', '01001111011111000000000000000000', '01001111011111000000000000000000',
#      '01001111011111000000000000000000', '01001111011111000000000000000000', '01001111011111001000000000000000',
#      '01001111011111001000000000000000', '01001111011111001000000000000000', '01001111011111010000000000000000',
#      '01001111011111010000000000000000', '01001111011111010000000000000000', '01001111011111010000000000000000',
#      '01001111011111010000000000000000', '01001111011111010000000000000000', '01001111011111010000000000000000',
#      '01001111011111010000000000000000', '01001111011111010000000000000000', '01001111011111011000000000000000',
#      '01001111011111011000000000000000', '01001111011111100000000000000000', '01001111011111100000000000000000',
#      '01001111011111100000000000000000', '01001111011111100000000000000000', '01001111011111100000000000000000',
#      '01001111011111100000000000000000', '01001111011111100000000000000000', '01001111011111100000000000000000',
#      '01001111011111100000000000000000', '01001111011111101000000000000000', '01001111011111101000000000000000',
#      '01001111011111101000000000000000', '01001111011111101000000000000000', '01001111011111101000000000000000',
#      '01001111011111101000000000000000', '01001111011111110000000000000000', '01001111011111110000000000000000',
#      '01001111011111110000000000000000', '01001111011111110000000000000000', '01001111011111110000000000000000',
#      '01001111011111110000000000000000', '01001111011111110000000000000000', '01001111011111110000000000000000',
#      '01001111011111111000000000000000', '01001111011111111000000000000000', '01001111011111111000000000000000',
#      '01001111011111111000000000000000', '01001111011111111000000000000000', '01001111011111111000000000000000',
#      '01001111011111111000000000000000']
#
# b = [4118806500.0, 4118806500.0, 4118806500.0, 4135583700.0, 4135583700.0, 4135583700.0, 4135583700.0, 4135583700.0,
#      4135583700.0, 4135583700.0, 4143972400.0, 4143972400.0, 4143972400.0, 4152361000.0, 4152361000.0, 4152361000.0,
#      4160749600.0, 4160749600.0, 4160749600.0, 4160749600.0, 4160749600.0, 4169138200.0, 4169138200.0, 4177526800.0,
#      4177526800.0, 4177526800.0, 4177526800.0, 4177526800.0, 4185915400.0, 4185915400.0, 4185915400.0, 4185915400.0,
#      4185915400.0, 4185915400.0, 4185915400.0, 4185915400.0, 4185915400.0, 4194304000.0, 4194304000.0, 4194304000.0,
#      4194304000.0, 4202692600.0, 4202692600.0, 4202692600.0, 4202692600.0, 4202692600.0, 4211081200.0, 4211081200.0,
#      4219469800.0, 4219469800.0, 4219469800.0, 4219469800.0, 4219469800.0, 4227858400.0, 4227858400.0, 4227858400.0,
#      4227858400.0, 4227858400.0, 4227858400.0, 4236247000.0, 4236247000.0, 4236247000.0, 4236247000.0, 4236247000.0,
#      4236247000.0, 4236247000.0, 4236247000.0, 4244635600.0, 4244635600.0, 4253024300.0, 4253024300.0, 4253024300.0,
#      4253024300.0, 4253024300.0, 4253024300.0, 4253024300.0, 4261412900.0, 4261412900.0, 4269801500.0, 4269801500.0,
#      4269801500.0, 4269801500.0, 4269801500.0, 4269801500.0, 4278190000.0, 4278190000.0, 4278190000.0, 4278190000.0,
#      4278190000.0, 4286578700.0, 4286578700.0, 4286578700.0, 4286578700.0, 4110418000.0, 4110418000.0, 4110418000.0,
#      4110418000.0, 4110418000.0, 4110418000.0, 4118806500.0, 4118806500.0, 4127195100.0, 4127195100.0, 4127195100.0,
#      4127195100.0, 4135583700.0, 4135583700.0, 4135583700.0, 4135583700.0, 4135583700.0, 4135583700.0, 4143972400.0,
#      4143972400.0, 4152361000.0, 4152361000.0, 4152361000.0, 4152361000.0, 4152361000.0, 4160749600.0, 4160749600.0,
#      4160749600.0, 4160749600.0, 4160749600.0, 4169138200.0, 4169138200.0, 4169138200.0, 4169138200.0, 4177526800.0,
#      4177526800.0, 4177526800.0, 4177526800.0, 4185915400.0, 4185915400.0, 4185915400.0, 4185915400.0, 4185915400.0,
#      4185915400.0, 4185915400.0, 4194304000.0, 4194304000.0, 4194304000.0, 4194304000.0, 4194304000.0, 4194304000.0,
#      4202692600.0, 4202692600.0, 4202692600.0, 4202692600.0, 4202692600.0, 4211081200.0, 4211081200.0, 4211081200.0,
#      4211081200.0, 4211081200.0, 4211081200.0, 4211081200.0, 4211081200.0, 4211081200.0, 4219469800.0, 4219469800.0,
#      4219469800.0, 4219469800.0, 4219469800.0, 4219469800.0, 4227858400.0, 4227858400.0, 4227858400.0, 4227858400.0,
#      4227858400.0, 4227858400.0, 4236247000.0, 4236247000.0, 4236247000.0, 4244635600.0, 4244635600.0, 4244635600.0,
#      4244635600.0, 4244635600.0, 4244635600.0, 4244635600.0, 4244635600.0, 4244635600.0, 4253024300.0, 4253024300.0,
#      4261412900.0, 4261412900.0, 4261412900.0, 4261412900.0, 4261412900.0, 4261412900.0, 4261412900.0, 4261412900.0,
#      4261412900.0, 4269801500.0, 4269801500.0, 4269801500.0, 4269801500.0, 4269801500.0, 4269801500.0, 4278190000.0,
#      4278190000.0, 4278190000.0, 4278190000.0, 4278190000.0, 4278190000.0, 4278190000.0, 4278190000.0, 4286578700.0,
#      4286578700.0, 4286578700.0, 4286578700.0, 4286578700.0, 4286578700.0, 4286578700.0]