# -*- coding: utf-8 -*-
from __future__ import print_function

import sys, os
sys.path.append(os.pardir)
import lambda_function

def test_save_voucher_intent():
    res = lambda_function.save_voucher_intent({"name":"SaveVoucherIntent"}, {})
    assert res['response']['outputSpeech']['ssml'] == '<speak>OK.</speak>'


def test_show_accounting_sheet_intent():
    res = lambda_function.show_accounting_sheet_intent({"name":"ShowAccountingSheetIntent"}, {})
    assert res['response']['outputSpeech']['ssml'] == '<speak>OK.</speak>'


def test_calculate_payroll_intent():
    res = lambda_function.show_accounting_sheet_intent({"name":"CalculatePayrollIntent"}, {})
    assert res['response']['outputSpeech']['ssml'] == '<speak>OK.</speak>'
