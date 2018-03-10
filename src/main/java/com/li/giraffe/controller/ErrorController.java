package com.immomo.live.phoenix.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author li.he 2014年11月7日 下午5:41:40
 */
@Controller
public class ErrorController extends BaseController {

    @RequestMapping("/error/500")
    public void error500() {

    }

    @RequestMapping("/error/404")
    public void error404() {

    }

}
