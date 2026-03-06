const Resume = require("../models/resume.model");
const User = require("../models/user.model");
const { calculateATS } = require("./ats.service");
const { askGroq } = require("./groq.service");
const redis = require("../config/redis");
const generateHash = require("../utils/hash.util");

// =============================
// ANALYZE RESUME
// =============================
exports.analyzeResume = async (userId, resumeText, jdText) => {

  const user = await User.findById(userId).populate("plan");
if (!user)
  throw new AppError("User not found", 404);

if (!user.plan)
  throw new AppError("User plan not assigned", 400);

  const plan = user.plan;

  if (!resumeText || !jdText) {
    throw new Error("Resume and Job Description are required");
  }

  // ✅ Plan-based Resume Limit
  if (
    plan.resumeLimit !== -1 &&
    user.resumeCount >= plan.resumeLimit
  ) {
    throw new Error("Resume limit reached. Upgrade your plan.");
  }

  const cacheKey = `analysis:${userId}:${generateHash(
    resumeText + jdText
  )}`;

  const cached = await redis.get(cacheKey);

  if (cached) {
    user.resumeCount += 1;
    await user.save();
    return JSON.parse(cached);
  }

  const atsResult = await calculateATS(resumeText, jdText);

  if (!atsResult || typeof atsResult.score !== "number") {
    throw new Error("ATS calculation failed");
  }

  const optimized = await askGroq([
    {
      role: "system",
      content:
        "You are a professional resume writer. Return only improved resume text."
    },
    {
      role: "user",
      content: `
Rewrite this resume to match the job description.
Make it ATS friendly and achievement-based.
Do not add fake experience.

Resume:
${resumeText}

Job Description:
${jdText}
`
    }
  ]);

  const savedResume = await Resume.create({
    userId,
    resumeText,
    jobDescription: jdText,
    atsScore: atsResult.score,
    missingKeywords: atsResult.missing_keywords || [],
    optimizedResume: optimized
  });

  user.resumeCount += 1;
  await user.save();

  const safeResponse = {
    id: savedResume._id,
    atsScore: savedResume.atsScore,
    missingKeywords: savedResume.missingKeywords,
    optimizedResume: savedResume.optimizedResume
  };

  await redis.set(cacheKey, JSON.stringify(safeResponse), "EX", 3600);

  return safeResponse;
};

// =============================
// DOWNLOAD RESUME
// =============================
exports.downloadResume = async (userId, resumeId) => {

  const user = await User.findById(userId).populate("plan");
if (!user)
  throw new AppError("User not found", 404);

if (!user.plan)
  throw new AppError("User plan not assigned", 400);

  const plan = user.plan;

  const resume = await Resume.findOne({
    _id: resumeId,
    userId
  });

  if (!resume) {
    throw new Error("Resume not found or access denied");
  }

  // ✅ Plan-based Download Limit
  if (
    plan.downloadLimit !== -1 &&
    user.downloadsUsed >= plan.downloadLimit
  ) {
    throw new Error("Download limit exceeded. Upgrade your plan.");
  }

  user.downloadsUsed += 1;
  await user.save();

  return {
    optimizedResume: resume.optimizedResume,
    downloadsUsed: user.downloadsUsed,
    plan: plan.name
  };
};

// =============================
// GET USER ANALYSIS HISTORY
// =============================
exports.getUserHistory = async (userId, page = 1, limit = 10) => {

  const skip = (page - 1) * limit;

  const resumes = await Resume.find({ userId })
    .sort({ createdAt: -1 })
    .skip(skip)
    .limit(limit)
    .select("_id atsScore missingKeywords createdAt");

  const total = await Resume.countDocuments({ userId });

  return {
    total,
    page,
    pages: Math.ceil(total / limit),
    data: resumes
  };
};

// =============================
// GET SINGLE RESUME
// =============================
exports.getResumeById = async (userId, resumeId) => {

  const resume = await Resume.findOne({
    _id: resumeId,
    userId
  });

  if (!resume) {
    throw new Error("Resume not found");
  }

  return resume;
};