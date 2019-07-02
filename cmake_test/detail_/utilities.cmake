include_guard()

function(_ct_variable_is_set _vis_var)
    cmake_policy(SET CMP0054 NEW)
    if("${${_vis_var}}" STREQUAL "")
        message(FATAL_ERROR "${ARGN}")
    endif()
endfunction()

macro(_ct_return _r_var)
    set(${_r_var} "${${_r_var}}" PARENT_SCOPE)
endmacro()

function(_ct_lc_find _lf_found _lf_str _lf_line)
    string(FIND "${_lf_line}" "${_lf_str}" _lf_pos)
    set(${_lf_found} TRUE PARENT_SCOPE)
    if("${_lf_pos}" STREQUAL "-1")
        set(${_lf_found} FALSE PARENT_SCOPE)
    endif()
endfunction()

function(_ct_sanitize_name _sn_new_name _sn_old_name)
    string(TOLOWER "${_sn_old_name}" _sn_old_name)
    string(REPLACE " " "_" ${_sn_new_name} "${_sn_old_name}")
    string(REPLACE ":" "-" ${_sn_new_name} "${${_sn_new_name}}")
    _ct_return(${_sn_new_name})
endfunction()
