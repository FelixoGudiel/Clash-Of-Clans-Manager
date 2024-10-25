package com.japarejo.springmvc.apiKey;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.japarejo.springmvc.asalto.Asalto;
import com.japarejo.springmvc.gamer.Gamer;
import com.japarejo.springmvc.gamer.GamerService;
import com.japarejo.springmvc.gamerRecord.GamerRecord;
import com.japarejo.springmvc.gamerRecord.GamerRecordService;


@Controller
@RequestMapping("/apikey")
public class KeyController {

    @Autowired
    KeyService keyService;

    public static final String KEY_INFO = "KeyInfo";

    public static final String KEY_CREATE_VIEW = "KeyCreate";

    @GetMapping()
    public ModelAndView infoKeys() {
        ModelAndView result = new ModelAndView(KEY_INFO);
        result.addObject("apiKeys", keyService.findAll());
        return result;
    }

    @GetMapping("/nueva")
    public ModelAndView nuevaKey() {
        ModelAndView result = new ModelAndView(KEY_CREATE_VIEW);
        result.addObject("apiKey", new apiKey());  
        return result;
    }

    @PostMapping("/nueva")
    public String createApiKey(@Valid @ModelAttribute("apiKey") apiKey apiKey, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "apikey/nueva"; 
        }
        keyService.save(apiKey);
        return "redirect:/apikey"; 
    }

    @GetMapping("/eliminar/{id}")
    public String eliminarKey(@PathVariable("id") Integer id) {
        keyService.deleteById(id);
        return "redirect:/apikey"; 
    }
}
