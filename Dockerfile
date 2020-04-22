# ========================================================================================
# ========================================================================================
#
#    Dockerfile
#      Dockerfile for alpine-apache.
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version 2.4.43-alpine
# @copyright © 2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package alpine-apache
# @subpackage Dockerfile
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

ARG FROM_REPO=""
ARG FROM_PARENT="httpd"
ARG FROM_VERS="2.4.43"
ARG FROM_EXT="-alpine"
ARG FROM_EXT_MOD=""

FROM ${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}

# ========================================================================================
#
# docker build --file=Dockerfile -t alpine-apache:2.4.43 .
#
# docker run -dit --name httpd -p 80:80 -v ${HOME}/public_html/:/usr/local/apache2/htdocs/ httpd:2.4.43
#
# ========================================================================================

ARG FROM_REPO
ARG FROM_PARENT
ARG FROM_VERS
ARG FROM_EXT
ARG FROM_EXT_MOD

EXPOSE 80 443
