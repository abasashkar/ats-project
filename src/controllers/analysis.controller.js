const pdfParse = require("pdf-parse");
const { analyzeResume } = require("../services/resume.service");
const { downloadResume } = require("../services/resume.service");
const { generateResumePDF } = require("../utils/pdfGenerator");
const resumeService = require("../services/resume.service");

exports.analyze = async (req, res, next) => {
  try {
    if (!req.file) {
      return next(new AppError("Resume file is required", 400));
    }

    const jobDescription = req.body.jobDescription;
    if (!jobDescription) {
      return next(new AppError("Job description is required", 400));
    }

    const pdfData = await pdfParse(req.file.buffer);
    const resumeText = pdfData.text;

    const analysisResult = await analyzeResume(
      req.user.id,
      resumeText,
      jobDescription
    );

    res.json({
      success: true,
      message: "Resume analyzed successfully",
      id: analysisResult.id,
      atsScore: analysisResult.atsScore,
      missingKeywords: analysisResult.missingKeywords,
      optimizedResume: analysisResult.optimizedResume,
    });

  } catch (error) {
    next(error);
  }
};

// =============================
// DOWNLOAD
// =============================
exports.download = async (req, res, next) => {
  try {
    const resumeId = req.params.id;

    if (!resumeId) {
      return next(new AppError("Resume ID is required", 400));
    }

    const result = await downloadResume(req.user.id, resumeId);

    generateResumePDF(result.optimizedResume, res);

  } catch (error) {
    next(error);
  }
};




// GET /analysis/history
exports.getHistory = async (req, res, next) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;

    const history = await resumeService.getUserHistory(
      req.user.id,
      page,
      limit
    );

    res.json({
      success: true,
      ...history
    });

  } catch (error) {
    next(error);
  }
};

exports.getSingleResume = async (req, res, next) => {
  try {
    const resume = await resumeService.getResumeById(
      req.user.id,
      req.params.id
    );

    res.json({
      success: true,
      data: resume
    });

  } catch (error) {
    next(error);
  }
};