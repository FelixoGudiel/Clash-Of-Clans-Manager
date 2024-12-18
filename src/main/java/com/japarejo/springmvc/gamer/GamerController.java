package com.japarejo.springmvc.gamer;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.japarejo.springmvc.apiKey.KeyService;
import com.japarejo.springmvc.asalto.AsaltoService;
import com.japarejo.springmvc.configuration.GlobalConfig;
import com.japarejo.springmvc.gamerRecord.GamerRecordService;

import antlr.collections.List;

@Controller
@RequestMapping("/clan")
public class GamerController {

    @Autowired
    AsaltoService asaltoService;
    @Autowired
    GamerService gamerService;
    @Autowired
    GamerRecordService gamerRecordService;
    @Autowired
    KeyService keyService;

    public static final String CLAN = "Clan";
    public static final String PROMOTION = "Promotion";
    private GlobalConfig globalConfig;

    @Autowired
    public GamerController(GlobalConfig globalConfig) {
        this.globalConfig = globalConfig;
    }


    @GetMapping
    public ModelAndView clan(RedirectAttributes redirectAttributes) throws IOException {
        ModelAndView result;

        if (keyService.keyByIp(globalConfig.getGlobalVariable()) == null) {
         redirectAttributes.addFlashAttribute("message", "No hay llave API activa");
        return new ModelAndView("redirect:/");
    }

    result = new ModelAndView(CLAN);
    result.addObject("members", gamerService.clanMembers());
    ArrayList<Integer> listNumAsaltos = new ArrayList<>();
    for (Gamer member : gamerService.clanMembers()){
        listNumAsaltos.add(gamerService.numAsaltos(member));
    }
    result.addObject("listNumAsaltos", listNumAsaltos);
    return result;
}


    @GetMapping("/update")
    public ModelAndView clanUpdate() throws IOException {
        gamerService.clanAPI();
        ModelAndView result = new ModelAndView("redirect:/clan");
        return result;
    }

    @GetMapping("/promote")
    public ModelAndView promoteSelect() throws IOException {
        ModelAndView result = new ModelAndView(PROMOTION);
        result.addObject("members", gamerService.clanMembers());
        return result;
    }
    @GetMapping("/promote/{id}")
    public ModelAndView promoteGamer(@PathVariable("id") Integer id) throws IOException {
        ModelAndView result = new ModelAndView("redirect:/clan/promote");
        Gamer gamerUpdate = gamerService.findById(id);
        if (gamerUpdate == null){
            result.addObject("message", "Usuario no encontrado");
            return result;
        }
        switch(gamerUpdate.getEtiqueta()){
            case("Desconocido"):
            gamerUpdate.setEtiqueta("Conocido");
            break;
            case("Conocido"):
            gamerUpdate.setEtiqueta("Amigo");
            break;
            case("Amigo"):
            result.addObject("message", "Este jugador ya tiene el máximo rango");
            return result;
        }
        gamerService.save(gamerUpdate);
        result.addObject("message", gamerUpdate.getNombre() +" promocionado con éxito");
        return result;
    }

    @GetMapping("/demote/{id}")
    public ModelAndView demoteGamer(@PathVariable("id") Integer id) throws IOException {
        Gamer gamerUpdate = gamerService.findById(id);
        ModelAndView result = new ModelAndView("redirect:/clan/promote");
        switch(gamerUpdate.getEtiqueta()){
            case("Amigo"):
            gamerUpdate.setEtiqueta("Conocido");
            break;
            case("Conocido"):
            gamerUpdate.setEtiqueta("Desconocido");
            break;
            case("Desconocido"):
            result.addObject("message", "Este jugador ya tiene el mínimo rango");
            return result;
        }
        gamerService.save(gamerUpdate);
        result.addObject("message",  gamerUpdate.getNombre() +" degradado con éxito");
        return result;
    }
}
