#!/bin/bash
#
# Description: Custom plugin returns if there is a kernel update pending on 
# CentOS.  Useful for knowing when to reboot a server updated  by yum-cron.
# Author: Russell Obets - Adapted from ubuntu_updates_check.sh by Tomas Muraus.
# License: MIT
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


LAST_KERNEL=$(rpm -q --last kernel | perl -pe 's/^kernel-(\S+).*/$1/' | head -1)
CURRENT_KERNEL=$(uname -r)

REBOOT_REQUIRED="yes"

if [ $LAST_KERNEL = $CURRENT_KERNEL ]; then
  REBOOT_REQUIRED="no"
fi

echo "metric reboot_required string ${REBOOT_REQUIRED}"
echo "metric current_kernel string ${CURRENT_KERNEL}"
echo "metric latest_kernel string ${LAST_KERNEL}"
