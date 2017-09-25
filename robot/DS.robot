*** Settings ***
Resource     ../testbeds/${testbed}
Library      ../lib/vcTests.py
Library      ../lib/mcTests.py
Library      ../lib/daTests.py

*** Test Cases ***
Prepare variables
    ${-osc-ip}=  get variable value  ${ip-osc}   ${osc-ip}
    ${osc-msg}=  convert to string  OSC IP is
    log to console   ${\n}${osc-msg} ${-osc-ip}

    ${-vc-ip}=  get variable value  ${ip-vc}   ${vc-providerIP}
    ${vc-msg}=  convert to string  VC IP is
    log to console   ${vc-msg} ${-vc-ip}

    ${-mc-ip}=  get variable value  ${ip-mc}   ${mc-providerIP}
    ${mc-msg}=  convert to string  MC IP is
    log to console   ${mc-msg} ${-mc-ip}
    set global variable   ${-osc-ip}
    set global variable   ${-vc-ip}
    set global variable   ${-mc-ip}

1Initialize
    ${osc}=  get osc  ${-osc-ip}  ${osc-user}  ${osc-pass}
    ${log}=  get log  ${delay}  ${verbose}
    ${vc}=   get vc   ${vc-type}  ${vc-name}  ${-vc-ip}  ${vc-providerUser}  ${vc-providerPass}  ${vc-softwareVersion}  ${vc-ishttps}  ${vc-rabbitMQPort}  ${vc-rabbitUser}  ${vc-rabbitMQPassword}  ${vc-adminProjectName}  ${vc-adminDomainId}  ${vc-controllerType}
    ${mc}=   get mc   ${mc-type}  ${mc-name}  ${-mc-ip}  ${mc-user}  ${mc-pass}  ${mc-apikey}
    ${da}=   get_da   ${da-name}  ${da-mcname}  ${da-model}  ${da-swname}  ${da-domainName}  ${da-encapType}  ${da-vcname}  ${da-vctype}
    ##                  ds_name, da_name, region_name, project_name, selection, inspnet_name, mgmtnet_name, ippool_name, shared, count
    ${ds}=   get ds   ${ds-name}  ${da-name}  ${ds-region}  ${ds-project}  ${ds-selction}  ${ds-insp-net}  ${ds-mgmt-net}  ${ds-floating-ip-pool}  ${ds-shared}  ${ds-count}
    ##   SG:            sg_name,   vc_name,   project_name,   protect_all,   encode_unicode
    ${sg}=   get sg   ${sg-name}  ${vc-name}  ${ds-project}  ${sg-protect-all}
    ##   SGMBR:              sg_name, member_name, member_type, region_name, protect_external=None
    ${sg-vm-mbr}=  get sgmbr  ${sg-name}  ${sg-vm-member-name}  ${sg-vm-member-type}  ${ds-region}
    ${sg-network-mbr}=  get sgmbr  ${sg-name}  ${sg-network-member-name}  ${sg-network-member-type}  ${ds-region}
    ${sg-subnet-mbr}=  get sgmbr  ${sg-name}  ${sg-subnet-member-name}  ${sg-subnet-member-type}  ${ds-region}  ${true}
    ##  SGBDG:               sg_name,  da_name,      binding_name,   policy_name=None,  is_binded=True,  tag_value=None, failure_policy=None, order=0
    ${sg-bdg}=  get sgBdg  ${sg-name}  ${da-name}  ${sg-binding-name}  ${sg-server-policy-name}  ${true}


    log to console  ${\n}
    log to console  ${ds.name}
    log to console  ${ds.project_name}
    log to console  ${ds.region_name}
    log to console  ${ds.selction}
    log to console  ${sg.name}
    log to console  ${sg.vc_name}

    set global variable   ${osc}
    set global variable   ${vc}
    set global variable   ${mc}
    set global variable   ${da}
    set global variable   ${ds}
    set global variable   ${sg}
    set global variable   ${sg-vm-mbr}
    set global variable   ${sg-network-mbr}
    set global variable   ${sg-subnet-mbr}
    set global variable   ${sg-bdg}
    set global variable   ${log}

2SHOW OSC VERSION
    ${osc-version}=  get version  ${osc}
    log to console   ${osc-version}

Clean SGs
    deleteSG   ${osc}

Clean DAs
    delete das  ${osc}

Add NSM Certificate
    uploadCertificate  ${osc}  ${nsm-cer-name}  ${nsm-cer-body}

#ADD VC with name  default-VC
#    ${result}=      positive test vc  ${true}  ${false}   default-VC  ${vc}  ${osc}  ${log}
#    should be equal as integers  ${result}  0

#Actually starting Manager Connector Test Cases

#For-Loop-Elements
#    @{ITEMS}=      Create List   snort  snort-123  mc-snort  foo-bar
#    :FOR    ${ELEMENT}    IN    @{ITEMS}
#    \   Positive Manager Connector with special name ${ELEMENT}
#    \   ${result}=  positive test mc name  ${true}  ${false}  ${ELEMENT}  ${mc}  ${osc}  ${log}
#    \   should be equal as integers  ${result}  0


3ADD default VC
    ${result}=      positive test   ${true}  ${false}  vc  name   ${vc-name}  ${vc}  ${osc}  ${log}
    should be equal as integers  ${result}  0

4Add default MC
    ${result}=  positive test   ${true}  ${false}  mc  name  ${mc-name}  ${mc}  ${osc}  ${log}
    should be equal as integers  ${result}  0

UPload VNF Image if needed
    ${result}  ${status}=  uploadVnfImage   ${osc}  ${vnf-path}
    log to console  ${status}
    should be equal as integers  ${result}  0

5Positive Distributed Appliances with all valid para create include delete if any
    ${result}=  positive test   ${true}  ${false}  da  name  ${da-name}  ${da}  ${osc}  ${log}
    should be equal as integers  ${result}  0

6Positive Deployment Spec with all hosts
    ${result}=  positive test   ${true}  ${false}  ds  name  ${ds-name}  ${ds}  ${osc}  ${log}
    should be equal as integers  ${result}  0

7Positive Create Security Group
    ${result}=  positive test   ${true}  ${false}  sg  name  ${sg-name}  ${sg}  ${osc}  ${log}
    should be equal as integers  ${result}  0

#8Positive Add VM Security Group Member
#    ##                                    start_clean, finish_clean, obj_type, field_type, field, obj, osc, log)
#    ${result}=  positive add sg member test  ${true}  ${false}  sgmbr  none  none  ${sg-vm-mbr}  ${osc}  ${log}
#    should be equal as integers  ${result}  0
#
#9Positive Add Network Security Group Member
#    ##                                    start_clean, finish_clean, obj_type, field_type, field, obj, osc, log)
#    ${result}=  positive add sg member test  ${false}  ${false}  sgmbr  none  none  ${sg-network-mbr}  ${osc}  ${log}
#    should be equal as integers  ${result}  0
#
#10Positive Add Subnet Security Group Member
#    ##                                    start_clean, finish_clean, obj_type, field_type, field, obj, osc, log)
#    ${result}=  positive add sg member test  ${false}  ${false}  sgmbr  none  none  ${sg-subnet-mbr}  ${osc}  ${log}
#    should be equal as integers  ${result}  0

11Positive Add Security Group Binding
    ##                                    start_clean, finish_clean, obj_type, field_type, field, obj, osc, log)
    ${result}=  positive add sg binding test  ${false}  ${false}  sgbdg  none  none  ${sg-bdg}  ${osc}  ${log}
    should be equal as integers  ${result}  0


