/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.omenk.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.omenk.dao.BukuDAO;
import org.omenk.dao.KategoriDAO;

import org.omenk.model.Buku;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author ndh
 */
@Controller
public class KatalogConroller {

    private static final org.slf4j.Logger log = LoggerFactory.getLogger(BukuController.class);
    @Autowired
    private BukuDAO bukuDAO;
    
    @Autowired
    private KategoriDAO kategoriDAO;

    public KategoriDAO getKategoriDAO() {
        return kategoriDAO;
    }

    public void setKategoriDAO(KategoriDAO kategoriDAO) {
        this.kategoriDAO = kategoriDAO;
    }
      
    
    public BukuDAO getBukuDAO() {
        return bukuDAO;
    }

    public void setBukuDAO(BukuDAO bukuDAO) {
        this.bukuDAO = bukuDAO;
    }

    @RequestMapping(value = "/katalog", method = RequestMethod.GET)
    public String list(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {


        Map model = new HashMap();
        PagedListHolder pagedListHolder = (PagedListHolder) request.getSession().getAttribute("personList");
        

        if (pagedListHolder == null) {
            pagedListHolder = new PagedListHolder(bukuDAO.findAll());
            pagedListHolder.setPageSize(3);
        } else {
            pagedListHolder.setPageSize(3);
            String page = (String) request.getParameter("page");
            if ("next".equals(page)) {
                pagedListHolder.nextPage();
            } else if ("previous".equals(page)) {
                pagedListHolder.previousPage();
            }
        }

        request.getSession().setAttribute("personList", pagedListHolder);
        model.put("personList", pagedListHolder);
        //modelMap.addAttribute("bukus", bukuDAO.findAll());
        return "katalog/katalog";
    }

    @RequestMapping(value = "/katalog/{id}", method = RequestMethod.GET)
    public String detail(@PathVariable("id") Long id, Buku buku, ModelMap modelMap) throws Exception {

        if (id == null) {
            throw new IllegalArgumentException("An Identifier is required ......");
        }
        modelMap.addAttribute("buku", bukuDAO.find(id));
        bukuDAO.updateJumlah(id);
        return "katalog/detail";

    }
    
    @RequestMapping(value = "/katalog/menu", method = RequestMethod.GET)
    public String list(ModelMap modelMap) {
        modelMap.addAttribute("data", kategoriDAO.findAll());
        return "katalog/menu";
    }
}
