#!/bin/zsh

# This file is used for generating a coverletter for the company
# Replaces headers with proper company names and replaces the job names
# with the job name that is given.

COMPANY_NAME=$1
CITY=$2
COUNTRY=$3
JOB_NAME=$4
RECRUITER=$5


Replace the stubs in the TeX file
sed -i "s/CompanyName/$COMPANY_NAME/g" coverletter.tex
sed -i "s/City/$CITY/g" coverletter.tex
sed -i "s/Country/$COUNTRY/g" coverletter.tex
sed -i "s/XYZ/$JOB_NAME/g" coverletter.tex

if [ ! -z "$RECRUITER" ]; then
  sed -i "s/Recruiter/$RECRUITER/g" coverletter.tex
fi
  

pdflatex -jobname=OsamaIqbal_Coverletter_$COMPANY_NAME coverletter.tex

# Revert the replacement
sed -i "s/$COMPANY_NAME/CompanyName/g" coverletter.tex
sed -i "s/$CITY/City/g" coverletter.tex
sed -i "s/$COUNTRY/Country/g" coverletter.tex
sed -i "s/$JOB_NAME/XYZ/g" coverletter.tex

if [ ! -z "$RECRUITER" ]; then
  sed -i "s/$RECRUITER/Recruiter/g" coverletter.tex
fi


