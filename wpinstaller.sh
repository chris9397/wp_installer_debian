#!/bin/bash

# At this time, this script only works with Debian based Linux distrobutions
# This will download the latest version of Wordpress to 'Wordpress' in your home directory
# Suggestions or feedback? Reach me at chris9397@gmail.com

counter=1

if [ $1 ]
then
  workingdir=/home/$(whoami)/$1
else
  workingdir=/home/$(whoami)/Wordpress
fi

function dots {
  while [ $counter -le 3 ]
  do
  echo -ne "."
  sleep .1
  ((counter++))
  done
  let counter=1
  echo
}

if [ ! -e /usr/bin/wget ]
then
  echo "We need to install 'wget'. You may need to enter your password"
  dots
  sudo apt-get install wget
fi

echo "Creating 'Wordpress' directory in your home directory"
dots
mkdir $workingdir
pushd $workingdir
echo "Downloading the latest Wordpress"
wget http://wordpress.org/latest.tar.gz
echo ""
echo ""
echo ""
echo "Wordpress Download Successful!"
echo "-------------------------------"
echo ""
echo ""
echo ""
echo "Setting up....................."

tar xf latest.tar.gz
mv wordpress/* .
rm latest.tar.gz
rm -rf wordpress
mv wp-config-sample.php wp-config.php

echo ""
echo ""
echo ""
echo "Wordpress Setup Successfull, Enjoy!"
echo ""
echo ""
echo ""
