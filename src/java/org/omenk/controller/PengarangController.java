/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.omenk.controller;

import javax.validation.Valid;
import org.omenk.dao.PengarangDAO;
import org.omenk.editor.PengarangEditor;

import org.omenk.model.Pengarang;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author ski
 */
@Controller
public class PengarangController {

    private static final org.slf4j.Logger log = LoggerFactory.getLogger(PengarangController.class);
    private PengarangDAO pengarangDAO;

    public PengarangDAO getPengarangDAO() {
        return pengarangDAO;
    }

    @Autowired
    public void setPengarangDAO(PengarangDAO pengarangDAO) {
        this.pengarangDAO = pengarangDAO;
    }

    @RequestMapping(value = "/pengarang/form", method = RequestMethod.GET)
    public String create(ModelMap modelMap) {
        Pengarang o = new Pengarang();
        modelMap.addAttribute("pengarang", o);
        return "pengarang/new";
    }

    @RequestMapping(value = "/pengarang", method = RequestMethod.GET)
    public String list(ModelMap modelMap) {
        modelMap.addAttribute("data", pengarangDAO.findAll());
        return "pengarang/list";
    }

    @RequestMapping(value = "/pengarang", method = RequestMethod.POST)
    public String insert(@Valid @ModelAttribute("pengarang") Pengarang pengarang,
            BindingResult result, ModelMap modelMap) {

        if (pengarang == null) {
            throw new IllegalArgumentException("A pengarang is required");
        }
        if (result.hasErrors()) {
            modelMap.addAttribute("pengarang", pengarang);
            return "pengarang/new";
        }

        pengarangDAO.persist(pengarang);

        return "redirect:/pengarang";
    }
     @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        webDataBinder.registerCustomEditor(Pengarang.class, new PengarangEditor(pengarangDAO));
    }

     //pada request "/kategori/id dengan metod post maka akan menghapus data kategori dengan id = ?
    @RequestMapping(value = "/pengarang/{id}", method = RequestMethod.POST)
    public String delete(@PathVariable("id") Pengarang pengarang) throws Exception {
        if (pengarang == null) {
            throw new IllegalArgumentException("An Identifier is required");
        }
        pengarangDAO.remove(pengarang);
        return "redirect:/pengarang" ;
    }

    @RequestMapping(value = "/pengarang/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Long id, ModelMap modelMap) throws Exception {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("pengarang", pengarangDAO.find(id));
        return "pengarang/show";
    }

    @RequestMapping(value ="pengarang/update/{id}",method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("pengarang") Pengarang pengarang , BindingResult result, ModelMap modelMap) throws Exception {
        if (result.hasErrors()) {
           log.warn(result.toString());
            modelMap.addAttribute("pengarang", pengarang);
            return "pengarang/update";
        }
        pengarangDAO.merge(pengarang);
        return "redirect:/pengarang/";
    }

    @RequestMapping(value = "/pengarang/{id}/form", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Pengarang o, ModelMap modelMap) throws Exception {
        modelMap.addAttribute("pengarang", o);
        return "pengarang/update";
    }

}
