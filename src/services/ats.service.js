const { askGroq } = require("./groq.service");

exports.calculateATS = async (resumeText, jdText) => {
  const result = await askGroq([
    {
      role: "system",
      content: `
You are a professional ATS scoring engine.

Rules:
- Respond ONLY with valid JSON.
- Do NOT include markdown.
- Do NOT include explanation.
- Score must be between 0 and 100.
`
    },
    {
      role: "user",
      content: `
Analyze how well the resume matches the job description.

Return STRICTLY this JSON format:

{
  "score": number,
  "missing_keywords": [],
  "matched_skills": [],
  "improvement_suggestions": []
}

Resume:
${resumeText}

Job Description:
${jdText}
`
    }
  ]);

  try {
    // 🔥 Remove accidental markdown formatting
    const cleaned = result
      .replace(/```json/g, "")
      .replace(/```/g, "")
      .trim();

    const parsed = JSON.parse(cleaned);

    // 🔥 Safety clamp score
    parsed.score = Math.max(0, Math.min(100, parsed.score));

    // 🔥 Ensure arrays exist
    parsed.missing_keywords = parsed.missing_keywords || [];
    parsed.matched_skills = parsed.matched_skills || [];
    parsed.improvement_suggestions =
      parsed.improvement_suggestions || [];

    return parsed;

  } catch (error) {
    throw new Error("Invalid ATS response from AI");
  }
};