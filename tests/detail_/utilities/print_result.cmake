include(cmake_test/cmake_test)

ct_add_test(NAME "_test_print_result")
function(${_test_print_result})
    include(cmake_test/detail_/utilities/print_result)
    ct_add_section(NAME "_print_result_no_indent")
    function(${_print_result_no_indent})
        _ct_print_result("Hello" "World" 0 80)
        ct_assert_prints("Hello......................................................................World")
    endfunction()

    ct_add_section(NAME "_print_result_with_indent")
    function(${_print_result_with_indent})
        _ct_print_result("Hello" "World" 2 80)
        ct_assert_prints("        Hello..............................................................World")
    endfunction()
endfunction()

ct_add_test(NAME "_test_print_pass")
function(${_test_print_pass})
    include(cmake_test/detail_/utilities/print_result)
    _ct_print_pass("NOT A TEST, DISREGARD THIS OUTPUT" 0 80)
    ct_assert_prints("NOT A TEST, DISREGARD THIS OUTPUT.........................................${CT_BoldGreen}PASSED${CT_ColorReset}")
endfunction()

ct_add_test(NAME "_test_print_fail")
function(${_test_print_fail})
    include(cmake_test/detail_/utilities/print_result)
    _ct_print_fail("NOT A TEST, DISREGARD THIS OUTPUT" 0 80)
    ct_assert_prints("NOT A TEST, DISREGARD THIS OUTPUT.........................................${CT_BoldRed}FAILED${CT_ColorReset}")
endfunction()


ct_add_test(NAME "_test_print_fail_length_180") 
function(${_test_print_fail_length_180})
    include(cmake_test/detail_/utilities/print_result)
    _ct_print_fail("NOT A TEST, DISREGARD THIS OUTPUT" 0 180)
    ct_assert_prints("NOT A TEST, DISREGARD THIS OUTPUT.............................................................................................................................................${CT_BoldRed}FAILED${CT_ColorReset}")
endfunction()

ct_add_test(NAME "_test_print_pass_length_180")
function(${_test_print_pass_length_180})
    include(cmake_test/detail_/utilities/print_result)
    _ct_print_pass("NOT A TEST, DISREGARD THIS OUTPUT" 0 180)
    ct_assert_prints("NOT A TEST, DISREGARD THIS OUTPUT.............................................................................................................................................${CT_BoldGreen}PASSED${CT_ColorReset}")
endfunction()
