# Version: MPL 1.1/GPL 2.0/LGPL 2.1
#
# The contents of this file are subject to the Mozilla Public License Version
# 1.1 (the "License"); you may not use this file except in compliance with
# the License. You may obtain a copy of the License at
# http://www.mozilla.org/MPL/
#
# Software distributed under the License is distributed on an "AS IS" basis,
# WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
# for the specific language governing rights and limitations under the
# License.
#
# The Original Code is The Tinderbox Client.
#
# The Initial Developer of the Original Code is
# Zach Lipton.
# Portions created by the Initial Developer are Copyright (C) 2001
# the Initial Developer. All Rights Reserved.
#
# Contributor(s): Zach Lipton <zach@zachlipton.com>
#
# Alternatively, the contents of this file may be used under the terms of
# either the GNU General Public License Version 2 or later (the "GPL"), or
# the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
# in which case the provisions of the GPL or the LGPL are applicable instead
# of those above. If you wish to allow use of your version of this file only
# under the terms of either the GPL or the LGPL, and not to allow others to
# use your version of this file under the terms of the MPL, indicate your
# decision by deleting the provisions above and replace them with the notice
# and other provisions required by the GPL or the LGPL. If you do not delete
# the provisions above, a recipient may use your version of this file under
# the terms of any one of the MPL, the GPL or the LGPL.

# This script developed August 2001 for Abisource and perl.


package Tinderconfig;

# By forcing us into a seperate package, we can keep ourselves out 
# of the namespace of the main script. This way, when invoking config 
# vars, it must be called like $Tinderconfig::var instead of $var;

#===========================================================
#BOXNAME
# set this to the name of the tinderbox that you wish to 
# see displayed as the col. heading on the tinderbox server. 
# This should probably contain your OS.
$boxname = ""; 
#===========================================================

#===========================================================
#SERVERADDRESS
# set this to the email address that the results should be sent 
# to.
$serveraddress = 'tinder@onion.perl.org'; 
#===========================================================

#===========================================================
#TINDERBOXPAGE
# set this to the page on the tinderbox (Perl, Perl6, 
# etc) that you wish to display this tinderboxen.
$tinderboxpage = "perl"; 
#===========================================================

#===========================================================
#ADMIN
# set this to the email address of the person who should
# get trouble reports
$admin = "";
#===========================================================

#===========================================================
#PULLDIR
# This var should be set to a directory where the rsync pull 
# will occur. Any and all contents will be overwritten.
$pulldir = '';

#===========================================================
#RSYNCCOMMAND
# This var should be set to the full rsync command used 
# to pull or update the source tree. Note that this assumes 
# that the files will appear in the same directory that this 
# command is run inside. Include the word 'rsync' at the 
# begining of this command.
$rsynccommand = "";
#===========================================================

#===========================================================
#PREBUILD
# This var should be set to a script (if any) that you would 
# like run before the build, but after the pull. For example, 
# if you have a script which you checkout of cvs, and then run 
# to do the full pull, you would enter that here and the full 
# cvs path to the script in $CVSMODULE above. Note that this 
# script runs _in_ the pull directory.
$prebuild = "";
#===========================================================


#===========================================================
#BUILDCOMMANDS
# This array should be set to the commands needed to build. 
# The commands will be run in sequence starting with [0].
@buildcommands = ('./configure -de -Dusedevel','make'); 
# XXX, set configure options here!
#===========================================================

#===========================================================
#FAILURESTATES
# This should be set to a list of rexexp patterns that will 
# indicate an error building the source. Be carful with this, 
# as if the pattern matches any output with the build it will 
# show up as a failure on the tinderbox page.
@failurestates = ('\[checkout aborted\]','\: cannot find module','^C ','gmake: \*\*\*');
#===========================================================

#===========================================================
#TESTS
# This hash should be set to the commands to run to perform the 
# test as the key, and an array of two regexp patterns that
# indicate a PASS of the test, and a build failure,
# in that order.  It will be considered a test failed if the
# none of the regexps match.  If the second regexp is blank,
# the failure of this test will not be able to result in a
# burning tree on tinderbox.  Having anything in the build
# error regexp at all is mostly useful for Perl programs 
# that are tested like Bugzilla
# where the same compile test determines both build errors
# and test failures (perl -c)
%tests = (
# 'COMMAND' => ['PASS','FAILURE'],
'make test' => ['100.00% ok',''],
);
#===========================================================


#===========================================================
#POSTBUILD
# This array should be set to commands (if any) that should 
# be run after the build. For example, if you would like to 
# upload the build to an ftp site, you can set this to a 
# packaging script and/or a shell script to do the upload.
@postbuild = ();
#===========================================================


#===========================================================
#MINCYCLETIME
# This should be set to the minimum time between tinderbox
# test cycles.  This is to avoid overloading the server
# with lots of closely-spaced emails.  If the build and
# test process takes longer than this amount of time, the
# build and test process will restart immediately, however
# if it takes less, it will wait until this time has
# expired before restarting.
$mincycletime = 300;
#===========================================================

$rsync = 1; # this is the rsync conf file

1;
