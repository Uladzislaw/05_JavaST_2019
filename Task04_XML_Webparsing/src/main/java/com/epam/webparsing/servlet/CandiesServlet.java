package com.epam.webparsing.servlet;

import com.epam.webparsing.builder.DOMBuilder;
import com.epam.webparsing.builder.Director;
import com.epam.webparsing.builder.SAXBuilder;
import com.epam.webparsing.builder.StAXBuilder;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.Objects;

/**
 * Servlet class. Processes request of parsing xml document with chosen parser.
 * Redirect on page with a table of objects in xml document.
 */
@WebServlet("/candies_table")
@MultipartConfig
public class CandiesServlet extends HttpServlet {
    /**
     * Logger.
     */
    private static final Logger LOGGER
            = LogManager.getLogger(CandiesServlet.class);

    /**
     * Get HTTP method. Gets a chosen language and set it.
     *
     * @param req  request.
     * @param resp response.
     */
    @Override
    protected void doGet(final HttpServletRequest req,
                         final HttpServletResponse resp) {
        String lang = req.getParameter("lang");
        req.getSession().setAttribute("locale",
                Objects.requireNonNullElse(lang, "en"));
        try {
            req.getServletContext().getRequestDispatcher(
                    "/jsp/parser_choice.jsp").forward(req, resp);
        } catch (ServletException e) {
            LOGGER.error("Candies servlet exception.", e);
        } catch (IOException e) {
            LOGGER.error("Invalid path to jsp file.", e);
        }
    }

    /**
     * Post HTTP method. Gets a chosen parser and parser the xml document with
     * help that parser. Resend user on home page if didnt get a xml file.
     *
     * @param req  request.
     * @param resp response.
     */
    @Override
    protected void doPost(final HttpServletRequest req,
                          final HttpServletResponse resp) {
        try {
            Part filePart = req.getPart("fload");
            if (filePart.getSubmittedFileName().length() == 0) {
                LOGGER.info("File haven't been chosen");
                req.getServletContext().getRequestDispatcher(
                        "/jsp/parser_choice.jsp").forward(req, resp);
                return;
            }
            InputStream fileContent = filePart.getInputStream();
            String newFilePath = "/Users/uladzislau/Documents/EpamTrainingJava/"
                    + "05_JavaST_2019/Task04_XML_Webparsing/src/main/"
                    + "data/uploaded.xml";
            OutputStream outputStream = new FileOutputStream(newFilePath);

            fileContent.transferTo(outputStream);

            String parser = req.getParameter("parser");
            setParser(req, parser, newFilePath);

            req.getServletContext().getRequestDispatcher(
                    "/jsp/candies_table.jsp").forward(req, resp);
        } catch (ServletException e) {
            LOGGER.error("Candies servlet exception.", e);
        } catch (IOException e) {
            LOGGER.error("Invalid path to jsp file.", e);
        }
    }

    /**
     * Checks what parser was chosen.
     *
     * @param req      request.
     * @param parser   chosen parser.
     * @param filePath path to file.
     */
    private void setParser(final HttpServletRequest req, final String parser,
                           final String filePath) {
        if ("DOM".equalsIgnoreCase(parser)) {
            req.setAttribute("res", Director.createCandies(
                    new DOMBuilder(), filePath));
        } else if ("sax".equalsIgnoreCase(parser)) {
            req.setAttribute("res", Director.createCandies(
                    new SAXBuilder(), filePath));
        } else {
            req.setAttribute("res", Director.createCandies(
                    new StAXBuilder(), filePath));
        }
    }
}
