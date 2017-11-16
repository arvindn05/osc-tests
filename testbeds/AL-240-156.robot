



*** Variables ***
# OSC
${osc-ip}=  10.3.242.3
#${osc-ip}=  10.3.240.156
${osc-user}=  admin
${osc-pass}=  admin123
${args}=  -d    2    -v

${none}=

# VC
${vc-type}=  OPENSTACK
${vc-name}=  default-VC
#${vc-providerIP}=  20.0.0.2
#${vc-providerIP}=  10.3.205.92
${vc-providerIP}=  10.3.241.154
#${vc-providerIP}=  10.3.241.226
${vc-providerUser}=  admin
${vc-providerPass}=  admin123
${vc-softwareVersion}=  Icehouse
${vc-ishttps}=  false
${vc-rabbitMQPort}=  5672
${vc-rabbitUser}=  guest
${vc-rabbitMQPassword}=  guest
${vc-adminTenantName}=  admin
${vc-controllerType}=  None
#${vc-controllerType}=  NSC
${verbose}=  true
${delay}=  1
${blank}=
${vc-adminProjectName}=  admin
${vc-adminDomainId}=  default

*** Variables ***
${vc-ishttps}=  false
${vc-rabbitMQPort}=  5672
${vc-rabbitUser}=  guest
${vc-rabbitMQPassword}=  guest
${vc-adminTenantName}=  admin
${vc-controllerType}=

# MC going for ISM, no need of SSL:
#${mc-type}=  NSM
${mc-type}=  ISM
#${mc-name}=  156-MC-NSM
${mc-name}=  default-MC
#${mc-providerIP}=  10.3.240.166
${mc-providerIP}=  1.2.3.4
${mc-user}=  admin
${mc-pass}=  admin123
${mc-apikey}=
${smc-apikey}=  kdkyTdZ2YW4NqEm4Bb990001
${nsm-cer-name}=  nsmCer166
#MIID6TCCAtGgAwIBAgIEa7J6ZzANBgkqhkiG9w0BAQsFADCBpDEkMCIGCSqGSIb3DQEJARYVQWRtaW5pc3RyYXRvckBXSU4yMDA4MRAwDgYDVQQDEwdXSU4yMDA4MSUwIwYDVQQLExxJbnRydXNpb24gUHJldmVudGlvbiBTeXN0ZW1zMRMwEQYDVQQKEwpNY0FmZWUgSW5jMRQwEgYDVQQHEwtTYW50YSBDbGFyYTELMAkGA1UECBMCQ0ExCzAJBgNVBAYTAlVTMB4XDTE3MDMwOTIzNDg1MFoXDTM3MDMwNDIzNDg1MFowgaQxJDAiBgkqhkiG9w0BCQEWFUFkbWluaXN0cmF0b3JAV0lOMjAwODEQMA4GA1UEAxMHV0lOMjAwODElMCMGA1UECxMcSW50cnVzaW9uIFByZXZlbnRpb24gU3lzdGVtczETMBEGA1UEChMKTWNBZmVlIEluYzEUMBIGA1UEBxMLU2FudGEgQ2xhcmExCzAJBgNVBAgTAkNBMQswCQYDVQQGEwJVUzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAK0LbxzsdKRtz1lF2sVoAOPjNw+thWYot9sPtSorBHkLkee5g1rIJjveha/7gI40ygNaBrh+cYPC+xQTr/cj6Yc4aN4rBTmNlqyd75Khq1hng91Us7qwKJezHFSidjFxegdMEdvul8f1AgvOOfJeNYCyhr1eX6sfKRYzIn7xp7qjndDXGK4AjVMIxdI28jkPQ9kteCsQG2qypvGFHUx99ZNfYBsBSbVUGr6WKcHogv7ADcoTZ8IbDUNkrGOx4H7MqpV2apDQgN0Y4KucH34V4knrobWeG/MWvRBkFH5p7z0FsJXJsUyIYlmB5w/hMC4dpX/lXN5AB5Apnhu1yYGVh6sCAwEAAaMhMB8wHQYDVR0OBBYEFCWET7OBnx7/n3s1uacBu+VYiRdlMA0GCSqGSIb3DQEBCwUAA4IBAQBv0Jd81YB2QCx/RYxJ1Iim8MFvc/dZ4r7EN9M7tWSFTqYCJYhUIOLDJqJQ2SrE4quXod/hio1EIMzYsGO0BKEHYB4ScT9F5DcQSOC4uuL161BB7cQkCrjpZvDYbzpeKgaGEy6Km+hinfrWMUSh7zjePBuquzD/UOpl92Ds3ZI79o9jjVo3ROgoznTnYgKGK8L1o+WVd+yQ2dykxqUfwO0D3A8v+gWjEBat24H1XoW7hFAPTwBH2axHkCX07BdRMN2nG7q0Edb+Z1rd+THgut3N5Wlo88N+Uw4yd8UkWYwZJszlgRvmU8X2ZaeTl59lJ4zGnRvC2gxwN2pX9lsAhZkU \n-----END CERTIFICATE-----
${nsm-cer-body}=  -----BEGIN CERTIFICATE-----\n MIIDvjCCAqYCAQAwDQYJKoZIhvcNAQELBQAwgaQxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2FudGEgQ2xhcmExEzARBgNVBAoTCk1jQWZlZSBJbmMxJTAjBgNVBAsTHEludHJ1c2lvbiBQcmV2ZW50aW9uIFN5c3RlbXMxEDAOBgNVBAMTB1dJTjIwMDgxJDAiBgkqhkiG9w0BCQEWFUFkbWluaXN0cmF0b3JAV0lOMjAwODAeFw0xNzAyMDcyMjA0MDZaFw0zNzAyMDIyMjA0MDZaMIGkMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFDASBgNVBAcTC1NhbnRhIENsYXJhMRMwEQYDVQQKEwpNY0FmZWUgSW5jMSUwIwYDVQQLExxJbnRydXNpb24gUHJldmVudGlvbiBTeXN0ZW1zMRAwDgYDVQQDEwdXSU4yMDA4MSQwIgYJKoZIhvcNAQkBFhVBZG1pbmlzdHJhdG9yQFdJTjIwMDgwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCux4KqlIxFH2wjdXsTedyHN/tLPjTkxZLrYO7Oyp1KOxQxSf65uZfMt8dYPxoWc08htvMMz6xvrZmsygGrknXa9U677gq0Bxb6MloCgyjL7eBwrZTXFuEnztLlfN3xbZwwfGt6XgK+kxdZpsWZqqdiAAcmG31EXhi1FlTEKwihfvIrcMBg9zXdizU7WMubPX4n/4ryoUcXwD97FneggvL9cnfqmn9cKyF/l3QE7iifqdAm16RDDrTUkhcAm4jF2ii7zxcWBOTW+JFd5jjJQFBn7gNXZkti7R7K/7g8pIwiQvRcbdHb10C3RZ9vE+XNdrjKcW/BNlk0SB+dobZhd2brAgMBAAEwDQYJKoZIhvcNAQELBQADggEBABh5nM7Ul/lzy03bMPtnOo+cRy6LeXZUbaQmgY5ZHoE6ZA6JR5lWgu1qFq9qpFLGoZ91cIW3wN8QRpUNJsUYEj+zkW8p7g/xpS6/v0nU8Q3NhZFkULS79mHnjZnhDUs+MXhaP+Cs7bGJGrnbnAHOFysI49/XvRhX7v+82oEE+kJBJUSqhXMThQy3N6zVxbARZQfKjoiZjAuA5sSBli7t1WhKasphe7P7GpaLLV7dN6XDvRhbZuZCOwvw7Y44wEjREu8GfvdQPsBL286xBSU0TMISFGoQEYh1FEtJNHGLaRyWBymewTn5+OqZS0AdK/wchKKIS2MCjF1yr0gnC+EFR28= \n-----END CERTIFICATE-----
${smc-cer-name}=  smcCer167
${smc-cer-body}=  -----BEGIN CERTIFICATE-----\n MIIC2TCCAkICCQC1EYQQnUAMDjANBgkqhkiG9w0BAQsFADCBsDELMAkGA1UEBhMCUEwxDzANBgNVBAgMBkdkYW5zazEPMA0GA1UEBwwGR2RhbnNrMRkwFwYDVQQKDBBJbnRlbCBUZWNobm9sb2d5MR8wHQYDVQQLDBZJbmZvcm1hdGlvbiB0ZWNobm9sb2d5MRYwFAYDVQQDDA0xMC4xMDIuNjMuMTEzMSswKQYJKoZIhvcNAQkBFhxwYXdlbC5wcm9za3Vybmlja2lAaW50ZWwuY29tMB4XDTE3MDMwMTEzMDUxOFoXDTE4MDMwMTEzMDUxOFowgbAxCzAJBgNVBAYTAlBMMQ8wDQYDVQQIDAZHZGFuc2sxDzANBgNVBAcMBkdkYW5zazEZMBcGA1UECgwQSW50ZWwgVGVjaG5vbG9neTEfMB0GA1UECwwWSW5mb3JtYXRpb24gdGVjaG5vbG9neTEWMBQGA1UEAwwNMTAuMTAyLjYzLjExMzErMCkGCSqGSIb3DQEJARYccGF3ZWwucHJvc2t1cm5pY2tpQGludGVsLmNvbTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEArwOF+M6BGN0UKquBJbd0TAgdFzZSTjGcTfXARygNcK4b0Gm/44TaOAIEz7axDfCJiE+IS9X2DH8G58eZ9/LoQXSXRpsyWptHFRPtJuL94s2OXaU+paEwUHqkPKFQSXmi+zWLBfxUppyqmK0E1vZV/pqVBLgttiWEh4jXrhtMe4UCAwEAATANBgkqhkiG9w0BAQsFAAOBgQBViZPRK8C07oVwHiB9UBVEjwL8L+UcxRpEf0TAhwJZlYEaWyI6Yfk3yusn1pY8G0rUHO3wLBhy2nllv5TUjqa4/wtnSSJpgE9wjpVO2b7k7SVM1irKOZB1FqPaGcecfOHZFHJLAcJjiDcm/aEAP0QTOlgngzH8mBT9XQX5Exk/qA== \n-----END CERTIFICATE-----

# DA (daname, mcname, model, swname, domainName, encapType, vcname, vctype)
${da-name}=  da1
${da-name2}=  da2
${da-mcname}=  default-MC
${da-model}=  CIRROS-TCPD
${da-swname}=  0.3.0.5000
#${da-model}=  SNORT-0.2
#${da-swname}=  0.2.0.20150626002613
${da-domainName}=  Default
${da-encapType}=  VLAN
${da-vcname}=  default-VC
${da-vctype}=  OPENSTACK
#${vnf-path}=  ../osc_resources/sensorsw_vm100-vss_8310019.zip
${vnf-path}=  ../osc_resources/cirrosAppl-1nic.zip
#${vnf-path}=  ../osc_resources/snort-appliance.zip

# DS
${ds-name}=  DS-156
${ds-daname}=  DA-156
${ds-project}=  admin
${ds-region}=   RegionOne
${ds-selction}=  hosts:mitakaCompute241155.localdomain
${ds-mgmt-net}=  mgmt-net
${ds-insp-net}=  inspec-net
${ds-floating-ip-pool}=  ext-net
${ds-count}=  1
${ds-shared}=  ${true}

# SG
${sg-name}=  SG-156
${sg-protect-all}=  false
${sg-vm-member-name}=  cirros
${sg-vm-member-type}=  VM
${sg-network-member-name}=  mgmt-net
${sg-network-member-type}=  NETWORK
${sg-subnet-member-name}=  mgmt-subnet
${sg-subnet-member-type}=  SUBNET
${sg-binding-da-name}=  ${da-name}
${sg-binding-is-binded}=  ${true}
##${sg-binding-name}=  ${sg-name} Test Binding
${sg-binding-name}=  SG-156-BIND
${sg-client-policy-name}=  Default  Client  Protection
${sg-server-policy-name}=  Default  Server  Protection
${sg-client-and-server-policy-name}=  Default  Client  and  Server  Protection
${sg-chaining-fail-open-policy}=  FAIL_OPEN
${sg-chaining-fail-closed-policy}=  FAIL_CLOSED
${sg-failopen-bdg-name}=   SG FAIL_OPEN Binding
${sg-failclosed-bdg-name}=   SG FAIL_CLOSED Binding
${sg-protectall-name}=  SG_protects_all
${sg-not-protectall-name}=  SG_not_protect_all

#  Openstack-API Related SG Tests
${sg-mgmt-net}=  ${sg-network-member-name}
${sg-test-net}=  testnet-1
${sg-test-port}=  testport-1
${sg-test-vm}=   testvm-1
${ostack-ip}=  ${vc-providerIP}

${sfc-sfcname}=  sfc1
${sfc-sfcname2}=  sfc2
${sfc-vcname}=  default-VC
#vc id cannot be provided here - just in run time







