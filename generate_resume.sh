COMMIT_TO_GIT=$1

# Generate OnePage
cd OnePage
pdflatex -jobname=OsamaIqbal_Resume resume_onepage.tex
pdftotext OsamaIqbal_Resume.pdf
rm *.log
rm *.out
rm *.aux
cd ..


# Generate TwoPage Resume
cd TwoPages
pdflatex -jobname=OsamaIqbal_Resume resume.tex
pdftotext OsamaIqbal_Resume.pdf
rm *.log
rm *.out
rm *.aux
cd ..

# Generate TwoPages Alternative
cd TwoPages/AlternativeExperience
pdflatex -jobname=OsamaIqbal_Resume resume.tex
pdftotext OsamaIqbal_Resume.pdf
rm *.log
rm *.out
rm *.aux
cd ../..

# Generate the CoverLetter
cd CoverLetter
pdflatex -jobname=OsamaIqbal_CoverLetter coverletter.tex
pdftotext OsamaIqbal_CoverLetter.pdf
rm *.log
rm *.out
rm *.aux
cd ..

# Commit to git if git flag is given
if [[ $1 == "add" ]]; then
  git add OnePage/OsamaIqbal_Resume.pdf
  git add OnePage/OsamaIqbal_Resume.txt
  git add OnePage/resume_onepage.tex

  git add TwoPages/OsamaIqbal_Resume.pdf
  git add TwoPages/OsamaIqbal_Resume.txt
  git add TwoPages/resume.tex

  git add TwoPages/AlternativeExperience/OsamaIqbal_Resume.pdf
  git add TwoPages/AlternativeExperience/OsamaIqbal_Resume.txt
  git add TwoPages/AlternativeExperience/resume.tex

  git add CoverLetter/OsamaIqbal_CoverLetter.pdf
  git add CoverLetter/OsamaIqbal_CoverLetter.txt
  git add CoverLetter/coverletter.tex
else
  echo "Not adding to git"
fi
