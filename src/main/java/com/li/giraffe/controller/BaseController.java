package com.immomo.live.phoenix.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;

/**
 * @author li.he 2014年11月7日 下午5:16:34
 */
@Controller
public class BaseController {
    private static final Log LOG = LogFactory.getLog(BaseController.class);

    @ExceptionHandler(Exception.class)
    // 在Controller类中添加该注解方法即可(注意：添加到某个controller，只针对该controller起作用)
    public void exceptionHandler(Exception ex, HttpServletResponse response, HttpServletRequest request) throws IOException {
        LOG.error("start ex:" + ex.getClass() + " ERROR MSG" + ex.getMessage());
        if (ex.getClass() == NoSuchRequestHandlingMethodException.class) {
            response.sendRedirect(request.getContextPath() + "/error/404");
        } else if (ex.getClass() == org.springframework.web.util.NestedServletException.class) {
            response.sendRedirect(request.getContextPath() + "/error/404");
        } else {
            response.sendRedirect(request.getContextPath() + "/error/500");
        }
    }

}
