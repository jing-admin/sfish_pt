# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200507-14.xml
# It is released under the Nessus Script Licence.
# The messages are release under the Creative Commons - Attribution /
# Share Alike license. See http://creativecommons.org/licenses/by-sa/2.0/
#
# Avisory is copyright 2001-2006 Gentoo Foundation, Inc.
# GLSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description)
{
 script_id(19210);
 script_version("$Revision: 1.4 $");
 script_xref(name: "GLSA", value: "200507-14");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200507-14 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200507-14
(Mozilla Firefox: Multiple vulnerabilities)


    The following vulnerabilities were found and fixed in Mozilla
    Firefox:
    "moz_bug_r_a4" and "shutdown" discovered that
    Firefox was improperly cloning base objects (MFSA 2005-56).
    Michael Krax reported that Firefox was not correctly handling
    JavaScript URLs from external applications (MFSA 2005-53), and that the
    "Set as wallpaper" function in versions 1.0.3 and 1.0.4 could be abused
    to load JavaScript (MFSA 2005-47).
    Several researchers
    reported ways to trick Firefox into accepting events generated by web
    content (MFSA 2005-45).
    Kohei Yoshino discovered a new way to
    inject script from the sidebar panel using data: (MFSA 2005-49).
    "moz_bug_r_a4" reported that Firefox failed to validate XHTML DOM
    nodes properly (MFSA 2005-55), and that XBL scripts ran even when
    Javascript is disabled (MFSA 2005-46).
    "shutdown" discovered a
    possibly exploitable crash in InstallVersion.compareTo (MFSA
    2005-50).
    Finally, Secunia discovered that a child frame can
    call top.focus() even if the framing page comes from a different origin
    and has overridden the focus() routine (MFSA 2005-52), and that the
    frame injection spoofing bug fixed in 1.0.2 was mistakenly reintroduced
    in 1.0.3 and 1.0.4 (MFSA 2005-51).
  
Impact

    A remote attacker could craft malicious web pages that would
    leverage these issues to inject and execute arbitrary script code with
    elevated privileges, steal cookies or other information from web pages,
    or spoof content.
  
Workaround

    There are no known workarounds for all the issues at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All Mozilla Firefox users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=www-client/mozilla-firefox-1.0.5"
    All Mozilla Firefox binary users should upgrade to the latest
    version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=www-client/mozilla-firefox-bin-1.0.5"
  ');
script_set_attribute(attribute: 'risk_factor', value: 'Medium');
script_set_attribute(attribute: 'see_also', value: 'http://www.mozilla.org/projects/security/known-vulnerabilities.html#Firefox');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200507-14.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200507-14] Mozilla Firefox: Multiple vulnerabilities');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'Mozilla Firefox: Multiple vulnerabilities');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "www-client/mozilla-firefox-bin", unaffected: make_list("ge 1.0.5"), vulnerable: make_list("lt 1.0.5")
)) { security_warning(0); exit(0); }
if (qpkg_check(package: "www-client/mozilla-firefox", unaffected: make_list("ge 1.0.5"), vulnerable: make_list("lt 1.0.5")
)) { security_warning(0); exit(0); }
exit(0, "Host is not affected");
