
# English Version ---------------------------------------------------------

# Knit the HTML version
rmarkdown::render("cv.rmd",
                  params = list(pdf_mode = FALSE, english = TRUE),
                  output_file = "CV_Johannes_Feldhege.html")

# Knit the PDF version to temporary html location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("cv.rmd",
                  params = list(pdf_mode = TRUE, english = TRUE),
                  output_file = tmp_html_cv_loc)

# Convert to PDF using Pagedown
pagedown::chrome_print(input = tmp_html_cv_loc,
                       output = "CV_Johannes_Feldhege.pdf")


# Deutsche Version --------------------------------------------------------

rmarkdown::render("cv.rmd",
                  params = list(pdf_mode = FALSE, english = FALSE),
                  output_file = "Lebenslauf_Johannes_Feldhege.html")

# Knit the PDF version to temporary html location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("cv.rmd",
                  params = list(pdf_mode = TRUE, english = FALSE),
                  output_file = tmp_html_cv_loc)

# Convert to PDF using Pagedown
pagedown::chrome_print(input = tmp_html_cv_loc,
                       output = "Lebenslauf_Johannes_Feldhege.pdf")
