const PDFDocument = require("pdfkit");

exports.generateResumePDF = (resumeText, res) => {
  const doc = new PDFDocument({
    margin: 50,
    size: "A4"
  });

  // Set headers for download
  res.setHeader(
    "Content-Disposition",
    "attachment; filename=optimized-resume.pdf"
  );
  res.setHeader("Content-Type", "application/pdf");

  doc.pipe(res);

  // Clean ATS-friendly formatting
  doc
    .font("Helvetica")
    .fontSize(11)
    .text(resumeText, {
      align: "left",
      lineGap: 4
    });

  doc.end();
};