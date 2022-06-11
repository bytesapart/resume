#!/bin/zsh

# This file is used for generating a coverletter for the company
# Replaces headers with proper company names and replaces the job names
# with the job name that is given.

COMPANY_NAME=$1
CITY=$2
COUNTRY=$3
JOB_NAME=$4
RECRUITER=$5


# Replace the stubs in the TeX file
sed -i "0,/CompanyName/s/CompanyName/$COMPANY_NAME/" coverletter.tex
sed -i "0,/City/s/City/$CITY/" coverletter.tex
sed -i "0,/Country/s/Country/$COUNTRY/" coverletter.tex
sed -i "0,/XYZ/s/XYZ/$JOB_NAME/" coverletter.tex

if [ ! -z "$RECRUITER" ]; then
  sed -i "0,/Recruiter/s/Recruiter/$RECRUITER/" coverletter.tex
fi
  
UNDERSCORE_COMPANY_NAME="${COMPANY_NAME// /_}"
pdflatex -jobname=OsamaIqbal_Coverletter_$UNDERSCORE_COMPANY_NAME coverletter.tex

# Revert the replacement
sed -i "0,/$COMPANY_NAME/s/$COMPANY_NAME/CompanyName/" coverletter.tex
sed -i "0,/$CITY/s/$CITY/City/" coverletter.tex
sed -i "0,/$COUNTRY/s/$COUNTRY/Country/" coverletter.tex
sed -i "0,/$JOB_NAME/s/$JOB_NAME/XYZ/" coverletter.tex

if [ ! -z "$RECRUITER" ]; then
  sed -i "0,/$RECRUITER/s/$RECRUITER/Recruiter/" coverletter.tex
fi


