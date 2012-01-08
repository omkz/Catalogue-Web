/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.omenk.controller;

import javax.validation.Valid;
import org.omenk.dao.PenerbitDAO;

import org.omenk.editor.PenerbitEditor;

import org.omenk.model.Penerbit;
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

@Controller
public class PenerbitController {

    private static final org.slf4j.Logger log = LoggerFactory.getLogger(PenerbitController.class);
    private PenerbitDAO penerbitDAO;

    public PenerbitDAO getPenerbitDAO() {
        return penerbitDAO;
    }

    @Autowired
    public void setPenerbitDAO(PenerbitDAO penerbitDAO) {
        this.penerbitDAO = penerbitDAO;
    }

    @RequestMapping(value = "/penerbit", method = RequestMethod.GET)
    public String list(ModelMap modelMap) {
        modelMap.addAttribute("data", penerbitDAO.findAll());
        return "penerbit/list";
    }

    @RequestMapping(value = "/penerbit/form", method = RequestMethod.GET)
    public String create(ModelMap modelMap) {
        Penerbit o = new Penerbit();
        modelMap.addAttribute("penerbit", o);
        return "penerbit/new";
    }

    @RequestMapping(value = "/penerbit", method = RequestMethod.POST)
    public String insert(@Valid @ModelAttribute("penerbit") Penerbit penerbit,
            BindingResult result, ModelMap modelMap) {

        if (penerbit == null) {
            throw new IllegalArgumentException("A penerbit is required");
        }
        if (result.hasErrors()) {
            modelMap.addAttribute("penerbit", penerbit);
            return "penerbit/new";
        }

        penerbitDAO.persist(penerbit);

        return "redirect:/penerbit";
    }

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        webDataBinder.registerCustomEditor(Penerbit.class, new PenerbitEditor(penerbitDAO));
    }
    
    
     //pada request "/kategori/id dengan metod post maka akan menghapus data kategori dengan id = ?
    @RequestMapping(value = "/penerbit/{id}", method = RequestMethod.POST)
    public String delete(@PathVariable("id") Penerbit penerbit) throws Exception {
        if (penerbit == null) {
            throw new IllegalArgumentException("An Identifier is required");
        }
        penerbitDAO.remove(penerbit);
        return "redirect:/penerbit" ;
    }

    @RequestMapping(value = "/penerbit/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Long id, ModelMap modelMap) throws Exception {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("penerbit", penerbitDAO.find(id));
        return "penerbit/show";
    }

    @RequestMapping(value ="penerbit/update/{id}",method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("penerbit") Penerbit penerbit , BindingResult result, ModelMap modelMap) throws Exception {
        if (result.hasErrors()) {
           log.warn(result.toString());
            modelMap.addAttribute("penerbit", penerbit);
            return "penerbit/update";
        }
        penerbitDAO.merge(penerbit);
        return "redirect:/penerbit/";
    }

    @RequestMapping(value = "/penerbit/{id}/form", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Penerbit o, ModelMap modelMap) throws Exception {
        modelMap.addAttribute("penerbit", o);
        return "penerbit/update";
    }


}
