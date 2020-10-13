#!/bin/bash
# ========================================================================================
# ========================================================================================
#
#    build-httpd
#      Build/Installation file for alpine-apache.
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version 2.4.46-alpine
# @copyright © 2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package alpine-apache
# @subpackage build-httpd
#
# ========================================================================================
#
#	Copyright © 2020. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/alpine-apache.
#
#   ewsdocker/alpine-apache is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/alpine-apache is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/httpd:2.4.46-alpine.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# ========================================================================================
# ========================================================================================

echo
echo "Stopping and removing httpd"
echo

docker stop httpd
docker rm httpd

echo
echo "Removing alpine-apache:2.4.46"
echo

docker rmi ewsdocker/alpine-apache:2.4.46

echo
echo "Building alpine-apache:2.4.46"
echo

docker build \
       --file=Dockerfile \
       -t ewsdocker/alpine-apache:2.4.46 .
[[ $? -eq 0 ]] ||
 {
 	echo "ewsdocker/alpine-apache:2.4.46 failed"
 	exit 1
 }

echo
echo "Installing and starting httpd from ewsdocker/alpine-apache:2.4.46"
echo

docker run \
    -d \
    -it \
	--restart unless-stopped \
    -v ${HOME}/Development:/usr/local/apache2/htdocs/ \
    -p=80:80 \
    --name httpd \
  ewsdocker/alpine-apache:2.4.46
[[ $? -eq 0 ]] ||
 {
 	echo "Unable to install/run httpd from ewsdocker/alpine-apache:2.4.46"
 	exit 2
 }
 
echo
echo "Successfully installed httpd from ewsdocker/alpine-apache:2.4.46"
echo

exit 0
