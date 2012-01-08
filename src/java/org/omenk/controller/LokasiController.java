
package org.omenk.controller;


import javax.validation.Valid;
import org.omenk.dao.LokasiDAO;
import org.omenk.editor.LokasiEditor;
import org.omenk.model.Lokasi;

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
public class LokasiController {

    private static final org.slf4j.Logger log = LoggerFactory.getLogger(LokasiController.class);
    private LokasiDAO lokasiDAO;

    public LokasiDAO getLokasiDAO() {
        return lokasiDAO;
    }

    @Autowired
    public void setLokasiDAO(LokasiDAO lokasiDAO) {
        this.lokasiDAO = lokasiDAO;
    }

    @RequestMapping(value = "/lokasi", method = RequestMethod.GET)
    public String list(ModelMap modelMap) {
        modelMap.addAttribute("data", lokasiDAO.findAll());
        return "lokasi/list";
    }

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        webDataBinder.registerCustomEditor(Lokasi.class, new LokasiEditor(lokasiDAO));
    }

    @RequestMapping(value = "/lokasi/form", method = RequestMethod.GET)
    public String create(ModelMap modelMap) {
        Lokasi o = new Lokasi();
        modelMap.addAttribute("lokasi", o);
        return "lokasi/new";
    }

    @RequestMapping(value = "/lokasi", method = RequestMethod.POST)
    public String insert(@Valid @ModelAttribute("lokasi") Lokasi lokasi,
            BindingResult result, ModelMap modelMap) {

        if (lokasi == null) {
            throw new IllegalArgumentException("A lokasi is required");
        }
        if (result.hasErrors()) {
            modelMap.addAttribute("lokasi", lokasi);
            return "lokasi/new";
        }

        lokasiDAO.persist(lokasi);

        return "redirect:/lokasi" ;
    }
        //pada request "/kategori/id dengan metod post maka akan menghapus data kategori dengan id = ?
    @RequestMapping(value = "/lokasi/{id}", method = RequestMethod.POST)
    public String delete(@PathVariable("id") Lokasi lokasi) throws Exception {
        if (lokasi == null) {
            throw new IllegalArgumentException("An Identifier is required");
        }
        lokasiDAO.remove(lokasi);
        return "redirect:/lokasi" ;
    }

        @RequestMapping(value = "/lokasi/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Long id, ModelMap modelMap) throws Exception {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("lokasi", lokasiDAO.find(id));
        return "lokasi/show";
    }

    @RequestMapping(value ="/lokasi/update/{id}",method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("lokasi") Lokasi lokasi , BindingResult result, ModelMap modelMap) throws Exception {
        if (result.hasErrors()) {
           log.warn(result.toString());
            modelMap.addAttribute("lokasi", lokasi);
            return "lokasi/update";
        }
        lokasiDAO.merge(lokasi);
        return "redirect:/lokasi/";
    }

    @RequestMapping(value = "/lokasi/{id}/form", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Lokasi o, ModelMap modelMap) throws Exception {
        modelMap.addAttribute("lokasi", o);
        return "lokasi/update";
    }
}
