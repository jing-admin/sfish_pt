# This script was automatically generated from the dsa-803
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(19610);
 script_version("$Revision: 1.8 $");
 script_xref(name: "DSA", value: "803");
 script_cve_id("CVE-2005-2088");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-803 security update');
 script_set_attribute(attribute: 'description', value:
'A vulnerability has been discovered in the Apache web server.  When it
is acting as an HTTP proxy, it allows remote attackers to poison the
web cache, bypass web application firewall protection, and conduct
cross-site scripting attacks, which causes Apache to incorrectly
handle and forward the body of the request.
The fix for this bug is contained in the apache-common package which means
that there isn\'t any need for a separate update of the apache-perl and
apache-ssl package.
For the old stable distribution (woody) this problem has been fixed in
version 1.3.26-0woody7.
For the stable distribution (sarge) this problem has been fixed in
version 1.3.33-6sarge1.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2005/dsa-803');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your Apache package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:N/I:P/A:N');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA803] DSA-803-1 apache");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-803-1 apache");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'apache', release: '3.0', reference: '1.3.26-0woody7');
deb_check(prefix: 'apache-common', release: '3.0', reference: '1.3.26-0woody7');
deb_check(prefix: 'apache-dev', release: '3.0', reference: '1.3.26-0woody7');
deb_check(prefix: 'apache-doc', release: '3.0', reference: '1.3.26-0woody7');
deb_check(prefix: 'apache', release: '3.1', reference: '1.3.33-6sarge1');
deb_check(prefix: 'apache-common', release: '3.1', reference: '1.3.33-6sarge1');
deb_check(prefix: 'apache-dbg', release: '3.1', reference: '1.3.33-6sarge1');
deb_check(prefix: 'apache-dev', release: '3.1', reference: '1.3.33-6sarge1');
deb_check(prefix: 'apache-doc', release: '3.1', reference: '1.3.33-6sarge1');
deb_check(prefix: 'apache-perl', release: '3.1', reference: '1.3.33-6sarge1');
deb_check(prefix: 'apache-ssl', release: '3.1', reference: '1.3.33-6sarge1');
deb_check(prefix: 'apache-utils', release: '3.1', reference: '1.3.33-6sarge1');
deb_check(prefix: 'libapache-mod-perl', release: '3.1', reference: '1.29.0.3-6sarge1');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
