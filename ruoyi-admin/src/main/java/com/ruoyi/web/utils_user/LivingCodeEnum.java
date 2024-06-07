package com.ruoyi.web.utils_user;

public enum  LivingCodeEnum {

    UNKNOWN_EXCEPTION(40000, "系统未知异常"),
    INVALID_EXCEPTION(40001, "参数校验异常~~");

    private int code;
    private String msg;

    LivingCodeEnum(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
    public int getCode() {
        return code;
    }
    public String getMsg() {
        return msg;
    }
}
