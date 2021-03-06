#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");


if(description)
{
 script_id(11996);
 script_version("$Revision: 1.6 $");

 script_name(english:"Brilliant Digital Software Detection");
 script_summary(english:"Brilliant Digital detection");

 script_set_attribute(
   attribute:"synopsis",
   value:"The remote host has spyware installed on it."
 );
 script_set_attribute(
   attribute:"description", 
   value:string(
     "The remote host is using Brilliant Digital, a media player that tracks\n",
     "browsing habits.  This program has been reported to cause slow down,\n",
     "and occassional crashes.  You should ensure that :\n\n",
     "- The user intended to install Brilliant Digital (it is sometimes\n",
     "  silently installed)\n",
     "- The use of Brilliant Digital matches your corporate mandates and\n",
     "  security policies."
   )
 );
 script_set_attribute(
   attribute:"see_also",
   value:"http://www.nessus.org/u?64866ea4"
 );
 script_set_attribute(
   attribute:"solution", 
   value:string(
     "To remove this sort of software, you may wish to check out Ad-Aware\n",
     "or SpyBot."
   )
 );
 script_set_attribute(
   attribute:"cvss_vector", 
   value:"CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:P"
 );
 script_end_attributes();

 script_category(ACT_GATHER_INFO);
 script_family(english:"Windows");
 
 script_copyright(english:"This script is Copyright (C) 2004-2009 Tenable Network Security, Inc.");
 
 script_dependencies("smb_hotfixes.nasl");
 script_require_keys("SMB/registry_full_access");

 script_require_ports(139, 445);
 exit(0);
}



# start the script
include("smb_func.inc");
if ( ! get_kb_item("SMB/registry_full_access") ) exit(0);

path[0] = "software\altnet";
path[1] = "software\brilliant digital entertainment";
path[2] = "software\microsoft\code store database\distribution units\{8721f16d-cbf8-4ce5-b924-18d64e12e77e}";
path[3] = "software\microsoft\windows\currentversion\uninstall\bdeplayer";
path[4] = "software\microsoft\windows\currentversion\uninstall\{e37135e3-cc51-4d5d-96a6-7116fc4058d4}";


port = kb_smb_transport();
if(!port || ! get_port_state(port) )exit(0);

login = kb_smb_login();
pass  = kb_smb_password();
domain = kb_smb_domain();

          
soc = open_sock_tcp(port);
if(!soc) exit(0);

session_init(socket:soc, hostname:kb_smb_name());
r = NetUseAdd(login:login, password:pass, domain:domain, share:"IPC$");
if ( r != 1 ) exit(0);

handle = RegConnectRegistry(hkey:HKEY_LOCAL_MACHINE);
if ( isnull(handle) )
{
 NetUseDel();
 exit(0);
}


for (i=0; path[i]; i++) {
       key_h = RegOpenKey(handle:handle, key:path[i], mode:MAXIMUM_ALLOWED);
       if ( !isnull(key_h) ) 
       { 
         RegCloseKey(handle:key_h);
         RegCloseKey(handle:handle);
	 security_warning(kb_smb_transport()); 
	 NetUseDel();
	 exit(0);
       }
}


RegCloseKey(handle:handle);
NetUseDel();
