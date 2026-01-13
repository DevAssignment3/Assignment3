# University Digital Notice Board

A static website for displaying academic announcements, examination schedules, and admission notices with automated CI/CD pipelines.

## 📋 Project Overview

This project implements a university notice board system with three separate CI/CD pipelines for development, production, and release environments. Each pipeline enforces code quality through linting, automated builds using Parcel, and containerization with Docker.

## 🏗️ Project Structure

```
uni-notice-board/
├── .github/
│   └── workflows/
│       ├── developement.yaml    # Development pipeline (develop branch)
│       ├── production.yaml      # Production pipeline (main branch)
│       └── release.yaml         # Release pipeline (version tags)
├── .dockerignore
├── .gitignore
├── .htmlhintrc.json
├── .stylelintrc.json
├── Dockerfile
├── package.json
├── README.md
├── src/
│   ├── index.html        # Homepage & navigation
│   ├── notices.html      # Academic notices
│   ├── exams.html        # Exam schedules
│   ├── admissions.html   # Admission updates
│   └── contact.html      # Contact details
└── styles/
    └── style.css         # Website styling
```

## 🚀 CI/CD Pipelines

### 1. Development Pipeline (developement.yaml)
- **Trigger:** Push/PR to `develop` branch
- **Docker Tag:** `dev`
- **Purpose:** Testing and development

### 2. Production Pipeline (production.yaml)
- **Trigger:** Push/PR to `main` branch
- **Docker Tag:** `latest`
- **Purpose:** Production deployment

### 3. Release Pipeline (release.yaml)
- **Trigger:** Version tags (v*.*.*)
- **Docker Tags:** `<version>` and `stable`
- **Purpose:** Versioned releases with GitHub Release creation

## 📦 Pipeline Stages

Each pipeline follows these stages:

1. **Linting Job**
   - HTMLHint validation for HTML files
   - Stylelint validation for CSS files
   
2. **Build Job**
   - Build website using Parcel bundler
   - Upload build artifacts
   
3. **Docker Image Job**
   - Build Docker image (multi-stage build)
   - Push to Docker Hub

## 🛠️ Local Development

### Prerequisites
- Node.js (v18 or higher)
- Docker Desktop
- Git

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd Assignment3

# Install dependencies
npm install
```

### Local Testing Commands

```bash
# 1. Lint HTML files
npx htmlhint "src/**/*.html"

# 2. Lint CSS files
npx stylelint "styles/**/*.css"

# 3. Build website with Parcel
npx parcel build "./src/index.html" "./src/notices.html" "./src/exams.html" "./src/admissions.html" "./src/contact.html" --dist-dir "./dist" --public-url "./" --no-cache

# 4. Build Docker image
docker build -t uni-notice-board:local .

# 5. Run Docker container
docker run -d -p 8080:80 uni-notice-board:local

# Access the website at http://localhost:8080
```

## 🐳 Docker Information

The project uses a multi-stage Docker build:
- **Stage 1:** Node.js Alpine image for building the website
- **Stage 2:** Nginx Alpine image for serving static files

## 🔧 Configuration Files

- **.htmlhintrc.json** - HTMLHint linting rules
- **.stylelintrc.json** - Stylelint configuration
- **.dockerignore** - Files to exclude from Docker build
- **.gitignore** - Files to exclude from Git

## 👥 Team Members

| Name | Role | Page Responsibility |
|------|------|---------------------|
| Ali Raza | Team Lead | index.html |
| Hassan Hanan Khalid | Member | exams.html |
| Musa Qureshi | Member | notice.html |
| Khawaja faheem ud din | Member | admissions.html |
| Musab Abdullah Shan | Member | contact.html |

## 📝 Branching Strategy

- `main` - Production-ready code
- `develop` - Development branch (protected)
- `feature/*` - Feature branches for each team member

## 🔒 Branch Protection Rules

The `develop` branch is protected with:
- Require pull request reviews
- Only Team Lead can merge PRs
- CI checks must pass before merging

## 📄 License

ISC License

## 🔗 Links

- **GitHub Repository:** [Repository URL]
- **Docker Hub:** [Docker Hub URL]
