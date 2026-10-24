# Project Submission Guide — Goodwork

This guide outlines the required steps to push the **Goodwork** repository to GitHub and submit it to the grading portal.

---

## 🔗 Submission Details

- **Project Name:** Goodwork — Social & Environmental Impact Job Portal
- **Student Name:** S. Ajay Varma
- **GitHub Repository URL:** `[INSERT GITHUB REPOSITORY LINK HERE — e.g., https://github.com/your-username/goodwork]`
- **School / Evaluation Portal URL:** `[INSERT SCHOOL / COURSE PORTAL SUBMISSION LINK HERE]`
- **Live Web Demo (Optional / GitHub Pages / Firebase Hosting):** `[INSERT LIVE DEMO LINK HERE (OPTIONAL)]`
- **Submission Date:** October 24, 2026

---

## 🚀 Step-by-Step GitHub Push Instructions

### 1. Initialize Git in the Project Root
Open your terminal in `/Users/s.ajayvarma/ajay1/flutter` and initialize a clean Git repository:

```bash
cd /Users/s.ajayvarma/ajay1/flutter

# Initialize git tracking
git init

# Verify status
git status
```

### 2. Verify `.gitignore`
Ensure generated build artifacts, IDE metadata, and secrets are excluded:
```bash
# Verify .gitignore exists
cat .gitignore
```
*(A standard Flutter `.gitignore` is included in this repository).*

### 3. Stage and Commit All Project Files
```bash
# Stage all files
git add .

# Create the initial commit with a descriptive message
git commit -m "feat: complete Goodwork impact job portal with responsive two-pane layout, UN SDG mappings, and Material 3 design"
```

### 4. Create a New Repository on GitHub
1. Log in to [GitHub](https://github.com).
2. Click **New Repository** (or visit `https://github.com/new`).
3. Repository name: `goodwork`
4. Visibility: **Public** (or **Private** with your instructor/evaluator added as a collaborator).
5. **Do NOT** check "Initialize this repository with a README" (since we already have one).
6. Click **Create repository**.

### 5. Link Local Repository to GitHub and Push
Replace `<your-username>` with your GitHub username:

```bash
# Rename default branch to main
git branch -M main

# Add the remote repository URL
git remote add origin https://github.com/<your-username>/goodwork.git

# Push code to GitHub
git push -u origin main
```

---

## 📋 Pre-Submission Checklist

Before submitting the link to your course or school portal, verify the following:

- [ ] **Flutter pub get executes cleanly**: Run `flutter pub get` with zero errors.
- [ ] **Static Analysis passes**: Run `flutter analyze` with 0 issues.
- [ ] **Automated Tests pass**: Run `flutter test` and confirm all tests green.
- [ ] **Two-Pane Layout verified**:
  - [ ] Tested on phone viewport (< 900 px): Job list navigates to dedicated `JobDetailScreen`.
  - [ ] Tested on desktop viewport (≥ 900 px): Left pane shows jobs; right pane displays selected job dossier.
- [ ] **Search & Filtering verified**:
  - [ ] Search by title, organization, location, skills, and SDGs works as expected.
  - [ ] Category chips (All roles, Climate, Health, Education, Inclusion, Community) filter correctly.
  - [ ] Saved roles toggle and counter function properly.
- [ ] **Sample Roles verified**:
  - [ ] All 6 required roles are included with rich impact statements, descriptions, skills, and SDG tags.
- [ ] **Application modal verified**:
  - [ ] "Apply for this role" triggers the clear employer continuation modal and displays the confirmation snackbar.
- [ ] **Documentation verified**:
  - [ ] `README.md` is complete with setup and run commands for all 6 platforms.
  - [ ] `RUBRIC_MAPPING.md` is populated with evidence for all evaluation criteria.
  - [ ] Replace placeholder links in this file with your actual GitHub repository URL.

---

## 📬 Final Portal Submission Template

When submitting to your instructor or learning portal, you can copy-paste the following summary:

```markdown
Project Title: Goodwork — Social & Environmental Impact Job Portal
Student Name: S. Ajay Varma
Repository Link: [INSERT GITHUB REPOSITORY LINK HERE]
School Portal Submission ID: [INSERT SUBMISSION ID / TICKET HERE]

Summary:
Goodwork is a cross-platform Flutter application supporting Android, iOS, Web, macOS, Linux, and Windows. It features a responsive layout that dynamically switches between a single-column navigation hierarchy on mobile viewports (< 900px) and a master-detail two-pane layout on wide screens (≥ 900px). Every role is mapped to United Nations Sustainable Development Goals (SDG 3, 4, 10, 11, 13, 17) with WCAG AAA accessibility, custom Material 3 styling (forest green & warm off-white), dynamic search & category filtering, role bookmarking, and direct employer application flows.
```
