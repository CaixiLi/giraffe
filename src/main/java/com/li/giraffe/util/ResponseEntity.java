package com.li.giraffe.util;

import java.io.Serializable;
import java.util.HashMap;

/**
 * 响应数据实体，用于JSon数据返回。
 * 
 * @author yicheng, mixueqing
 */
public class ResponseEntity extends HashMap<String, Object> implements Serializable {
    private static final long serialVersionUID = -5915188556451352477L;

    public static ResponseEntity OK;
    public static ResponseEntity ERR_NEED_LOGIN;
    public static ResponseEntity ERR_PERMISSION_DENIED;

    static {
        OK = new ResponseEntity();
        OK.put("ec", 0);

        ERR_NEED_LOGIN = new ResponseEntity();
        ERR_NEED_LOGIN.put("ec", 403);
        ERR_NEED_LOGIN.put("em", "You need to login before requesting this operation!");

        ERR_PERMISSION_DENIED = new ResponseEntity();
        ERR_PERMISSION_DENIED.put("ec", 405);
        ERR_PERMISSION_DENIED.put("em", "Permission denied!");
    }

    public static final ResponseEntity ok(String message) {
        ResponseEntity response = new ResponseEntity();
        response.put("ec", 0);
        response.put("em", message);
        return response;
    }

    public static final ResponseEntity okWithResult(Object obj) {
        ResponseEntity response = new ResponseEntity();
        response.put("ec", 0);
        response.put("data", obj);
        return response;
    }

    public static final ResponseEntity error(int errorCode, String errorMsg) {
        ResponseEntity response = new ResponseEntity();
        response.put("ec", errorCode);
        response.put("em", errorMsg);
        return response;
    }

    public static final ResponseEntity error(Throwable throwable) {
        ResponseEntity response = new ResponseEntity();
        response.put("ec", 500);
        response.put("em", throwable.getMessage());
        return response;
    }

    public static final ResponseEntity errorWithResult(int errorCode, Object rst) {
        ResponseEntity response = new ResponseEntity();
        response.put("ec", errorCode);
        response.put("data", rst);
        return response;
    }

    public ResponseEntity() {
    }

    public ResponseEntity(int result) {
        this(result, null, null);
    }

    public ResponseEntity(Object data) {
        this(1, null, data);
    }

    public ResponseEntity(int result, Object data) {
        this(result, null, data);
    }

    public ResponseEntity(int ec, String em, Object data) {
        put("ec", ec);
        put("em", em);
        put("data", data);
    }

    public int getEc() {
        return (Integer) get("ec");
    }

    public void setEc(int ec) {
        put("ec", ec);
    }

    public String getEm() {
        return (String) get("em");
    }

    public void setEm(String em) {
        put("em", em);
    }

    public Object getData() {
        return get("data");
    }

    public void setData(Object data) {
        put("data", data);
    }

}
