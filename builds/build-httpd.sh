# ========================================================================================
# ========================================================================================
#
#    build-httpd
#      Build/Installation file for alpine-apache.
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version 2.4.43-alpine
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
#   along with ewsdocker/httpd:2.4.43-alpine.  If not, see 
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
echo "Removing alpine-apache:2.4.43"
echo

docker rmi alpine-apache:2.4.43

echo
echo "Building alpine-apache:2.4.43"
echo

docker build \
       --file=Dockerfile \
       -t alpine-apache:2.4.43 .
[[ $? -eq 0 ]] ||
 {
 	echo "alpine-apache:2.4.43 failed"
 	exit 1
 }

echo
echo "Installing and starting httpd from alpine-apache:2.4.43"
echo

docker run \
    -d \
    -it \
    --name httpd \
    -v ${HOME}/public_html/:/usr/local/apache2/htdocs/ \
  alpine-apache:2.4.43
[[ $? -eq 0 ]] ||
 {
 	echo "Unable to install/run httpd from alpine-apache:2.4.43"
 	exit 2
 }
 
echo
echo "Successfully installed httpd from alpine-apache:2.4.43"
echo

exit 0
