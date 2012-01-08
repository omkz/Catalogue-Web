/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.omenk.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.omenk.dao.BukuDAO;

import org.omenk.dao.KategoriDAO;
import org.omenk.dao.LokasiDAO;
import org.omenk.dao.PenerbitDAO;
import org.omenk.dao.PengarangDAO;
import org.omenk.editor.BukuEditor;
import org.omenk.editor.KategoriEditor;
import org.omenk.editor.LokasiEditor;
import org.omenk.editor.PenerbitEditor;
import org.omenk.editor.PengarangEditor;

import org.omenk.model.Buku;

import org.omenk.model.Kategori;
import org.omenk.model.Lokasi;
import org.omenk.model.Penerbit;
import org.omenk.model.Pengarang;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ndh
 */
@Controller
public class BukuController {

    private static final org.slf4j.Logger log = LoggerFactory.getLogger(BukuController.class);
    @Autowired
    private BukuDAO bukuDAO;
    @Autowired
    private KategoriDAO kategoriDAO;
    @Autowired
    private PengarangDAO pengarangDAO;
    @Autowired
    private PenerbitDAO penerbitDAO;
    @Autowired
    private LokasiDAO lokasiDAO;

    public BukuDAO getBukuDAO() {
        return bukuDAO;
    }

    public void setBukuDAO(BukuDAO bukuDAO) {
        this.bukuDAO = bukuDAO;
    }

    public KategoriDAO getKategoriDAO() {
        return kategoriDAO;
    }

    public void setKategoriDAO(KategoriDAO kategoriDAO) {
        this.kategoriDAO = kategoriDAO;
    }

    public LokasiDAO getLokasiDAO() {
        return lokasiDAO;
    }

    public void setLokasiDAO(LokasiDAO lokasiDAO) {
        this.lokasiDAO = lokasiDAO;
    }

    public PenerbitDAO getPenerbitDAO() {
        return penerbitDAO;
    }

    public void setPenerbitDAO(PenerbitDAO penerbitDAO) {
        this.penerbitDAO = penerbitDAO;
    }

    public PengarangDAO getPengarangDAO() {
        return pengarangDAO;
    }

    public void setPengarangDAO(PengarangDAO pengarangDAO) {
        this.pengarangDAO = pengarangDAO;
    }

    @RequestMapping(value = "/buku/test", method = RequestMethod.GET)
    public String list(ModelMap modelMap) {

        return "buku/test";
    }

    //@ModelAttribute("bukus")
    //  public Collection<Buku> populateBukus() {
    //     return bukuDAO.findAll();
    //  }
    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        webDataBinder.registerCustomEditor(Buku.class, new BukuEditor(bukuDAO));
        webDataBinder.registerCustomEditor(Kategori.class, new KategoriEditor(kategoriDAO));
        webDataBinder.registerCustomEditor(Lokasi.class, new LokasiEditor(lokasiDAO));
        webDataBinder.registerCustomEditor(Pengarang.class, new PengarangEditor(pengarangDAO));
        webDataBinder.registerCustomEditor(Penerbit.class, new PenerbitEditor(penerbitDAO));

    }

    @RequestMapping(value = "/buku", method = RequestMethod.GET)
    public String test(ModelMap modelMap) {
        modelMap.addAttribute("bukus", bukuDAO.findAll());
        return "buku/list";
    }

    @RequestMapping(value = "/buku/form", method = RequestMethod.GET)
    public String create(ModelMap modelMap) {

        Buku o = new Buku();
        modelMap.addAttribute("buku", o);
        modelMap.addAttribute("kat", kategoriDAO.findAll());
        modelMap.addAttribute("lokasi", lokasiDAO.findAll());
        modelMap.addAttribute("pengarang", pengarangDAO.findAll());
        modelMap.addAttribute("penerbit", penerbitDAO.findAll());
        return "buku/new";
    }

    @RequestMapping(value = "/buku", method = RequestMethod.POST)
    public String insert(@Valid @ModelAttribute("buku") Buku buku,
            BindingResult result, ModelMap modelMap, HttpServletRequest request) throws IOException {

        if (buku == null) {
            throw new IllegalArgumentException("A buku is required");
        }

        if (result.hasErrors()) {
            for (ObjectError error : result.getAllErrors()) {
                System.err.println("Error: " + error.getCode() + " - " + error.getDefaultMessage());
            }
            return "buku/new";
        }
        try {
            MultipartFile file = buku.getFileData();
            String filename = null;
            InputStream inputStream = null;
            OutputStream outputStream = null;
            if (file.getSize() > 0) {
                inputStream = file.getInputStream();
            }
            if (file.getSize() > 100000) {
                inputStream = file.getInputStream();
                System.out.println("ukuran file" + file.getSize());
                return "buku/new";
            }
            //filename = request.getRealPath("") + "/image/" + file.getOriginalFilename();
            filename = "/home/ndh/Gambar/cover/" + file.getOriginalFilename();

            System.out.println("file name : :" + filename);
            outputStream = new FileOutputStream(filename);
            //System.out.println("output stream :" + outputStream);
            System.out.println("filename :" + file.getOriginalFilename());
            int readBytes = 0;
            byte[] buffer = new byte[100000];
            while ((readBytes = inputStream.read(buffer, 0, 100000)) != -1) {
                outputStream.write(buffer, 0, readBytes);
            }
            inputStream.close();
            buku.setCover("/upload/" + file.getOriginalFilename());
            System.out.println(".." + buku.getCover());
            
            
            //session.setAttribute("uploadFile", file.getOriginalFilename());

        } catch (Exception e) {
            System.out.println("kesalahan : " + e);
            //System.out.println("salahe :"+e.printStackTrace());
        }


       

        buku.setFileData(null);
        bukuDAO.persist(buku);



        return "redirect:/buku";
    }

    @RequestMapping(value = "/buku/{id}", method = RequestMethod.POST)
    public String delete(@PathVariable("id") Buku buku) throws Exception {
        if (buku == null) {
            throw new IllegalArgumentException("An Identifier is required");
        }
        bukuDAO.remove(buku);
        return "redirect:/buku";
    }

    @RequestMapping(value = "/buku/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Long id, ModelMap modelMap) throws Exception {
        if (id == null) {
            throw new IllegalArgumentException("An Identifier is required");
        }
        modelMap.addAttribute("buku", bukuDAO.find(id));
        return "buku/show";
    }

    @RequestMapping(value = "/buku/{id}/form", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Buku o, ModelMap modelMap) throws Exception {
        modelMap.addAttribute("buku", o);
        modelMap.addAttribute("kat", kategoriDAO.findAll());
        modelMap.addAttribute("lokasi", lokasiDAO.findAll());
        modelMap.addAttribute("pengarang", pengarangDAO.findAll());
        modelMap.addAttribute("penerbit", penerbitDAO.findAll());
        return "buku/update";
    }

    @RequestMapping(value = "buku/update/{id}", method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("buku") Buku buku, BindingResult result, ModelMap modelMap) throws Exception {
        if (result.hasErrors()) {
            log.warn(result.toString());
            modelMap.addAttribute("buku", buku);
            return "buku/update";
        }
        try {
            MultipartFile file = buku.getFileData();
            String filename = null;
            InputStream inputStream = null;
            OutputStream outputStream = null;
            if (file.getSize() > 0) {
                inputStream = file.getInputStream();
            }
            if (file.getSize() > 100000) {
                inputStream = file.getInputStream();
                System.out.println("ukuran file" + file.getSize());
                return "buku/new";
            }
            //filename = request.getRealPath("") + "/image/" + file.getOriginalFilename();
            filename = "/home/ndh/Gambar/cover/" + file.getOriginalFilename();

            System.out.println("file name : :" + filename);
            outputStream = new FileOutputStream(filename);
            //System.out.println("output stream :" + outputStream);
            System.out.println("filename :" + file.getOriginalFilename());
            int readBytes = 0;
            byte[] buffer = new byte[100000];
            while ((readBytes = inputStream.read(buffer, 0, 100000)) != -1) {
                outputStream.write(buffer, 0, readBytes);
            }
            inputStream.close();
            buku.setCover("/upload/" + file.getOriginalFilename());
            System.out.println(".." + buku.getCover());
            //session.setAttribute("uploadFile", file.getOriginalFilename());


        } catch (Exception e) {
            System.out.println("kesalahan : " + e);
            //System.out.println("salahe :"+e.printStackTrace());
        }
        buku.setFileData(null);
        bukuDAO.merge(buku);

        return "redirect:/buku/";
    }
}
