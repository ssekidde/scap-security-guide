# platform = Red Hat Enterprise Linux 7, multi_platform_fedora

# Include source function library.
. /usr/share/scap-security-guide/remediation_functions

PATTERN="-a always,exit -F path=/usr/bin/unix_chkpwd.*"
GROUP="privileged"
FULL_RULE="-a always,exit -F path=/usr/bin/unix_chkpwd -F perm=x -F auid>=1000 -F auid!=4294967295 -F key=privileged"
# Perform the remediation for both possible tools: 'auditctl' and 'augenrules'
fix_audit_syscall_rule "auditctl" "$PATTERN" "$GROUP" "$ARCH" "$FULL_RULE"
fix_audit_syscall_rule "augenrules" "$PATTERN" "$GROUP" "$ARCH" "$FULL_RULE"
