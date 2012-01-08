package org.omenk.controller;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.security.Principal;
import java.util.List;
import org.omenk.dao.BukuDAO;
import org.omenk.model.Buku;
import org.omenk.services.SearchCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import javax.validation.constraints.Pattern;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.filter.RequestContextFilter;

@Controller
public class SearchController {

    private BukuDAO bukuDAO;

    public BukuDAO getBukuDAO() {
        return bukuDAO;
    }

    @Autowired
    public void setBukuDAO(BukuDAO bukuDAO) {
        this.bukuDAO = bukuDAO;
    }

    //  @Inject
    // public SearchController(BukuDAO bukuDAO) {
    //     this.bukuDAO = bukuDAO;
    // }
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(HttpServletRequest request, SearchCriteria criteria, Model model) {

        String cari = request.getParameter("dasarCari");


        if (cari.equals("judul")) {
            List<Buku> bukus = bukuDAO.cari(criteria);
            model.addAttribute(bukus);            
            model.addAttribute("count", bukuDAO.countResultSearch(criteria));          


        } else {
            List<Buku> bukus = bukuDAO.cariPengarang(criteria);
            model.addAttribute(bukus);
            model.addAttribute("count", bukuDAO.countResultSearchPengarang(criteria));
            

        }

        return "search/list";

    }

    //@RequestMapping(value = "/cari, method = RequestMethod.GET)
    //public void search(SearchCriteria searchCriteria, Principal currentUser, Model model) {
    //if (currentUser != null) {
    //	List<Booking> booking = bookingService.findBookings(currentUser.getName());
    //model.addAttribute(booking);
    //}
    //}
    @RequestMapping(value = "/search/search", method = RequestMethod.GET)
    public void cariPage(SearchCriteria criteria, Model model) {
        List<Buku> bukus = bukuDAO.findAll();
        model.addAttribute(bukus);

    }

    @RequestMapping(value = "/search/{id}", method = RequestMethod.GET)
    public String detail(@PathVariable("id") Long id, Buku buku, ModelMap modelMap) throws Exception {

        if (id == null) {
            throw new IllegalArgumentException("An Identifier is required ......");
        }
        modelMap.addAttribute("buku", bukuDAO.find(id));
        bukuDAO.updateJumlah(id);

        return "search/detail";

    }

    @RequestMapping(value = "/search/jumlah", method = RequestMethod.GET)
    public String jumlahCari(ModelMap modelMap) {


        modelMap.addAttribute("data", bukuDAO.jumlahCari());
        return "search/jumlah";
    }

    @RequestMapping(value = "/search/jumlahSepi", method = RequestMethod.GET)
    public String SepiCari(ModelMap modelMap) {


        modelMap.addAttribute("data", bukuDAO.sepiCari());
        return "search/jarangCari";
    }

    @RequestMapping(value = "/laporan/banyakCari*", method = RequestMethod.GET)
    public String generateSummary(Model model) {
        
        List<Buku> bukus = java.util.Collections.emptyList();
        try {

            bukus = bukuDAO.jumlahCari();

        } catch (Exception ex) {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            ex.printStackTrace(pw);

        }

        model.addAttribute("bukus", bukus);

        return "banyakCari";
    }
    
     @RequestMapping(value = "/laporan/nolCari*", method = RequestMethod.GET)
    public String lapNolCari(Model model) {
        
        List<Buku> bukus = java.util.Collections.emptyList();
        try {

            bukus = bukuDAO.sepiCari();

        } catch (Exception ex) {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            ex.printStackTrace(pw);

        }

        model.addAttribute("bukus", bukus);

        return "nolCari";
    }
}
