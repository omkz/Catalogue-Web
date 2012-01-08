/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.omenk.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.omenk.dao.KategoriDAO;
import org.omenk.editor.KategoriEditor;
import org.omenk.model.Kategori;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author ndh
 */
@Controller
public class KategoriController {

    private static final org.slf4j.Logger log = LoggerFactory.getLogger(KategoriController.class);
    private KategoriDAO kategoriDAO;

    public KategoriDAO getKategoriDAO() {
        return kategoriDAO;
    }

    @Autowired
    public void setKategoriDAO(KategoriDAO kategoriDAO) {
        this.kategoriDAO = kategoriDAO;
    }

    @ExceptionHandler(Exception.class)
    public String handleException(Exception ex, HttpServletRequest request) {
        request.setAttribute("ex", ex);
        return "kategori/error";
    }

    @RequestMapping(value = "/kategori", method = RequestMethod.GET)
    public String list(ModelMap modelMap) {
        modelMap.addAttribute("data", kategoriDAO.findAll());
        return "kategori/list";
    }

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        webDataBinder.registerCustomEditor(Kategori.class, new KategoriEditor(kategoriDAO));
    }

    @RequestMapping(value = "/kategori/form", method = RequestMethod.GET)
    public String create(ModelMap modelMap) {
        Kategori o = new Kategori();
        modelMap.addAttribute("kategori", o);
        return "kategori/new";
    }

    @RequestMapping(value = "/kategori", method = RequestMethod.POST)
    public String insert(@Valid @ModelAttribute("kategori") Kategori kategori,
            BindingResult result, ModelMap modelMap) {

        if (kategori == null) {
            throw new IllegalArgumentException("A Kategori is required");
        }
        if (result.hasErrors()) {
            modelMap.addAttribute("kategori", kategori);
            return "kategori/new";
        }

        kategoriDAO.persist(kategori);

        return "redirect:/kategori";
    }
    //pada request "/kategori/id dengan metod post maka akan menghapus data kategori dengan id = ?

    @RequestMapping(value = "/kategori/{id}", method = RequestMethod.POST)
    public String delete(@PathVariable("id") Kategori kategori) throws Exception {
        if (kategori == null) {
            throw new IllegalArgumentException("An Identifier is required");
        }
        kategoriDAO.remove(kategori);
        return "redirect:/kategori";
    }

    @RequestMapping(value = "/kategori/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Long id, ModelMap modelMap) throws Exception {
        if (id == null) {
            throw new IllegalArgumentException("An Identifier is required");
        }
        modelMap.addAttribute("kategori", kategoriDAO.find(id));
        return "kategori/show";
    }

    @RequestMapping(value = "kategori/update/{id}", method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("kategori") Kategori kategori, BindingResult result, ModelMap modelMap) throws Exception {
        if (result.hasErrors()) {
            log.warn(result.toString());
            modelMap.addAttribute("kategori", kategori);
            return "kategori/update";
        }
        kategoriDAO.merge(kategori);
        return "redirect:/kategori/";
    }

    @RequestMapping(value = "/kategori/{id}/form", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Kategori o, ModelMap modelMap) throws Exception {
        modelMap.addAttribute("kategori", o);
        return "kategori/update";
    }
}
