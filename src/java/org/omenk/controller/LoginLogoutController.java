/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.omenk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginLogoutController{

    @RequestMapping(method = RequestMethod.GET, value = "/login")
    public String home() {
        return "login/login";
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/suksesOut")
    public String out() {
        return "login/logoutSukses";
    }
}
