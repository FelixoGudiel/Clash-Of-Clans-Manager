package com.japarejo.springmvc.welcome;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.japarejo.springmvc.apiKey.KeyService;
import com.japarejo.springmvc.apiKey.apiKey;
import com.japarejo.springmvc.configuration.GlobalConfig;
import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class WelcomeController {

    private final GlobalConfig globalConfig;

    @Autowired
    KeyService keyService;
    public WelcomeController(GlobalConfig globalConfig) {
        this.globalConfig = globalConfig;
    }

    @GetMapping(path = {"", "/"})
    public ModelAndView welcome() {
        ModelAndView result = new ModelAndView("welcome");

        apiKey foundKey = keyService.keyByIp(globalConfig.getGlobalVariable());
        result.addObject("globalConfigIp", globalConfig.getGlobalVariable());
        if (foundKey!=null){
            result.addObject("apiKeyCode", foundKey.getApiKeyCode());
        }
        else {
            result.addObject("apiKeyCode", null);
        }
        return result;
    }
}
