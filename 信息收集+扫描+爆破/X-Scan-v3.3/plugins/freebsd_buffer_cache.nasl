#
# (C) Tenable Network Security, Inc.
#
#

if ( ! defined_func("bn_random") ) exit(0);

include("compat.inc");

if(description)
{
 script_id(12527);
 script_bugtraq_id(10416);
 script_version ("$Revision: 1.7 $");
 script_cve_id("CVE-2004-0435");
 name["english"] = "FreeBSD : SA-04:11.msync";
 
 script_name(english:name["english"]);
 
 script_set_attribute(attribute:"synopsis", value:
"The remote device is missing a vendor-supplied security patch" );
 script_set_attribute(attribute:"description", value:
"The remote host is running a version of FreeBSD which contains a
programming error in the msync(2) system call which may let a local user with
read access to a given file to forbid any change to this file to be written
to disk." );
 script_set_attribute(attribute:"solution", value:
"http://www.vuxml.org/freebsd/1db1ed59-af07-11d8-acb9-000d610a3b12.html" );
 script_set_attribute(attribute:"risk_factor", value:"Low" );


 script_end_attributes();

 
 summary["english"] = "Check for the version of FreeBSD";
 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2004-2009 Tenable Network Security, Inc.");
 family["english"] = "FreeBSD Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/FreeBSD/pkg_info");
 exit(0);
}



include("freebsd_package.inc");

port = 0;

pkgs = get_kb_item("Host/FreeBSD/pkg_info");

package = get_kb_item("Host/FreeBSD/release");


if ( egrep(pattern:"FreeBSD-5\.", string:package) )
{
 if ( pkg_cmp(pkg:package, reference:"FreeBSD-5.2_8") < 0 )
 {
  security_hole(port);
  exit(0);
 }
}


if ( egrep(pattern:"FreeBSD-4\.9", string:package) )
{
 if ( pkg_cmp(pkg:package, reference:"FreeBSD-4.9_9") < 0 )
 {
  security_hole(port);
  exit(0);
 }
}

if ( egrep(pattern:"FreeBSD-4\.[0-8]([^0-9]|$)", string:package) )
{
 if ( pkg_cmp(pkg:package, reference:"FreeBSD-4.8_22") < 0 )
 {
  security_hole(port);
  exit(0);
 }
}
