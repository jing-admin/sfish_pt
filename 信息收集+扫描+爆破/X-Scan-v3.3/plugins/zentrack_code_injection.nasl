#
# (C) Tenable Network Security, Inc.
#

#
# Ref:
#
# Date: 6 Jun 2003 01:00:55 -0000
# From: <farking@i-ownur.info>
# To: bugtraq@securityfocus.com
# Subject: zenTrack Remote Command Execution Vulnerabilities



include("compat.inc");

if(description)
{
 script_id(11702);
 script_version ("$Revision: 1.17 $");

 script_bugtraq_id(7843);
 script_xref(name:"OSVDB", value:"4554");

 script_name(english:"zenTrack index.php Multiple Parameter Remote File Inclusion");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server contains a PHP application that is prone to
remote file include attacks." );
 script_set_attribute(attribute:"description", value:
"It is possible to make the remote host include php files hosted on a
third-party server using the version of zenTrack installed on the
remote host. 

An attacker may use this flaw to inject arbitrary code and to gain a
shell with the privileges of the web server on the affected host." );
 script_set_attribute(attribute:"see_also", value:"http://www.securityfocus.com/archive/1/324214/30/0/threaded" );
 script_set_attribute(attribute:"see_also", value:"http://sourceforge.net/forum/forum.php?forum_id=283172" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to zenTrack 2.4.2 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P" );
script_end_attributes();

 
 script_summary(english:"Checks for the presence of zenTrack's index.php");
 script_category(ACT_ATTACK);
 script_copyright(english:"This script is Copyright (C) 2003-2009 Tenable Network Security, Inc.");
 script_family(english:"CGI abuses");
 script_dependencie("http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}

#
# The script code starts here
#

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);



function check(loc)
{
 local_var r, req;
 r = http_send_recv3(method: "GET", item:string(loc, "/index.php?libDir=http://xxxxxxxx"),
 		port:port);			
 if( r == NULL )exit(0);
 if("http://xxxxxxxx/configVars.php" >< r[2])
 {
 	security_hole(port);
	exit(0);
 }
}



foreach dir (cgi_dirs())
{
 check(loc:dir);
}
