/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.omenk.services;

import com.lowagie.text.Document;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfWriter;
import java.awt.Color;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.omenk.model.Buku;

import org.springframework.web.servlet.view.document.AbstractPdfView;

/**
 *
 * @author ndh
 */
public class PdfNolCari extends AbstractPdfView {

    protected void buildPdfDocument(Map model, Document document,
            PdfWriter writer, HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        List<Buku> bukus = (List<Buku>) model.get("bukus");

        Table table = new Table(3);
        //table.setAutoFillEmptyCells(true);
        table.setCellsFitPage(true);
        table.setBorderColorTop(Color.yellow);
        
        table.setAlignment(DEFAULT_CONTENT_TYPE);

        table.addCell("JUDUL BUKU");
        table.addCell("PENGARANG");
        table.addCell("JUMLAH CARI");

        if (!bukus.isEmpty()) {
            for (Buku buku : bukus) {
                table.addCell(buku.getJudul());
                table.addCell(buku.getPengarang().getNama());
                table.addCell(buku.getJumlahCari().toString());
            }
        }
        document.add(table);
    }
}
