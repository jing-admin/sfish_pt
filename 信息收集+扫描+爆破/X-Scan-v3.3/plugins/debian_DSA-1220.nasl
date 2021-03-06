# This script was automatically generated from the dsa-1220
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(23737);
 script_version("$Revision: 1.6 $");
 script_xref(name: "DSA", value: "1220");
 script_cve_id("CVE-2006-5869");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1220 security update');
 script_set_attribute(attribute: 'description', value:
'Brian May discovered that pstotext, a utility to extract plain text from
Postscript and PDF files, performs insufficient quoting of file names,
which allows execution of arbitrary shell commands.
For the stable distribution (sarge) this problem has been fixed in
version 1.9-1sarge2. The build for the mipsel architecture is not yet
available due to technical problems with the build host.
For the upcoming stable distribution (etch) this problem has been
fixed in version 1.9-4.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2006/dsa-1220');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your pstotext package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:H/Au:N/C:P/I:P/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1220] DSA-1220-1 pstotext");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1220-1 pstotext");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'pstotext', release: '3.1', reference: '1.9-1sarge2');
deb_check(prefix: 'pstotext', release: '4.0', reference: '1.9-4');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
