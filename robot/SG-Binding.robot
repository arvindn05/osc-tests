*** Settings ***
Resource     ../testbeds/${testbed}
Library      ../lib/vcTests.py
Library      ../lib/mcTests.py
Library      ../lib/daTests.py


*** Test Cases ***

1 Initialize
    ${osc}=  get osc  ${osc-ip}  ${osc-user}  ${ics-pass}
    ${log}=  get log  ${delay}  ${verbose}
    ${vc}=   get vc   ${vc-type}  ${vc-name}  ${vc-providerIP}  ${vc-providerUser}  ${vc-providerPass}  ${vc-softwareVersion}  ${vc-ishttps}  ${vc-rabbitMQPort}  ${vc-rabbitUser}  ${vc-rabbitMQPassword}  ${vc-adminProjectName}  ${vc-adminDomainId}  ${vc-controllerType}
    ${mc}=   get mc   ${mc-type}  ${mc-name}  ${mc-providerIP}  ${mc-user}  ${mc-pass}  ${mc-apikey}
    ${da}=   get da   ${da-name}  ${da-mcname}  ${da-model}  ${da-swname}  ${da-domainName}  ${da-encapType}  ${da-vcname}  ${da-vctype}
    ##                  ds_name, da_name, region_name, project_name, selection, inspnet_name, mgmtnet_name, ippool_name, shared, count
    ${ds}=   get ds   ${ds-name}  ${da-name}  ${ds-region}  ${ds-project}  ${ds-selction}  ${ds-insp-net}  ${ds-mgmt-net}  ${ds-floating-ip-pool}  ${ds-shared}  ${ds-count}
    ##   SG:            sg_name,   vc_name,   project_name,   protect_all,   encode_unicode
    ${sg}=   get sg   ${sg-name}  ${vc-name}  ${ds-project}  ${sg-protect-all}
    ##   SGMBR:              sg_name, member_name, member_type, region_name, protect_external=None
    ${sg-vm-mbr}=  get sgmbr  ${sg-name}  ${sg-vm-member-name}  ${sg-vm-member-type}  ${ds-region}
    ${sg-network-mbr}=  get sgmbr  ${sg-name}  ${sg-network-member-name}  ${sg-network-member-type}  ${ds-region}
    ${sg-subnet-mbr}=  get sgmbr  ${sg-name}  ${sg-subnet-member-name}  ${sg-subnet-member-type}  ${ds-region}  ${true}
    ##  SGBDG:                                sg_name,                   da_name,       binding_name,          policy_name=None,                       is_binded=True,   tag_value=None,   failure_policy=None,   order=0
    ${sg-client-bdg}=             get sgBdg   ${sg-name}                 ${da-name}     ${sg-binding-name}     ${sg-client-policy-name}                ${true}
    ${sg-server-bdg}=             get sgBdg   ${sg-name}                 ${da-name}     ${sg-binding-name}     ${sg-server-policy-name}  ${true}
    ${sg-client-and-server-bdg}=  get sgBdg   ${sg-name}                 ${da-name}     ${sg-binding-name}     ${sg-client-and-server-policy-name}     ${true}
    ${sg-failopen-bdg}=           get sgBdg   ${sg-failopen-bdg-name}    ${da-name}     ${sg-binding-name}     ${sg-client-and-server-policy-name}     ${true}           ${none}           FAIL_OPEN
    ${sg-failclosed-bdg}=         get sgBdg   ${sg-failclosed-bdg-name}  ${da-name}     ${sg-binding-name}     ${sg-client-and-server-policy-name}     ${true}           ${none}           FAIL_CLOSED

    ${osc-version}=  get version  ${osc}
    log to console   ${\n}  ${osc-version}  ${\n}



#
###  Continue Initialization -- Setup Prequisites For SG-Binding Tests ##
#log to console   ${\n}  Initializing - Set Up Prerequisites For SG-Binding Tests  ${\n}
#
#2 Create VC
#    ${result}=       positive test   ${true}  ${false}  vc  name  104-VC  ${vc}  ${osc}  ${log}
#    should be equal as integers  ${result}  0
#
#4 Create MC
#    ${result}=   positive test   ${true}  ${false}  mc  name  ${mc-name}  ${mc}  ${osc}  ${log}
#    should be equal as integers  ${result}  0
#
#5 Create DA
#    ${result}=   positive test   ${true}  ${false}  da  name  ${da-name}  ${da}  ${osc}  ${log}
#    should be equal as integers  ${result}  0
#
#6 Create DS
#    ${result}=   positive test   ${true}  ${false}  ds  name  ${ds-name}  ${ds}  ${osc}  ${log}
#    should be equal as integers  ${result}  0
#
#7Create SG
#    ${result}=   positive test   ${true}  ${false}  sg  ${none}  ${none}  ${sg}  ${osc}  ${log}
#    should be equal as integers  ${result}  0
#
#8Add VM SG Member
#    ##                                    start_clean, finish_clean, obj_type, field_type, field, obj, osc, log)
#    ${result}=   positive add sg member test  ${true}  ${false}  sgmbr  ${none}  ${none}  ${sg-vm-mbr}  ${osc}  ${log}
#    should be equal as integers  ${result}  0
#
#9Add NETWORK SG Member
#    ##                                    start_clean, finish_clean, obj_type, field_type, field, obj, osc, log)
#    ${result}=   positive add sg member test  ${false}  ${false}  sgmbr  ${none}  ${none}  ${sg-network-mbr}  ${osc}  ${log}
#    should be equal as integers  ${result}  0
#
#10Add SG Binding
#    ##                                    start_clean, finish_clean, obj_type, field_type, field, obj, osc, log)
#    ${result}=   positive add sg binding test  ${false}  ${false}  sgbdg  ${none}  ${none}  ${sg-client-and-server-bdg}  ${osc}  ${log}
#    should be equal as integers  ${result}  0
#
###  Completed Initialization - Begin SG-Binding Tests  ##
#log to console   ${\n}  Completed Initialization - Begin SG-Binding Tests  ${\n}
#



11 Verify that you can Bind Policy To Security Group using an NSM DA
    #Test_Name:     Openstack_SG_Bind_TC1
    #Test_Desc:     Verify that you can Bind Policy To Security Group using an NSM DA
    #Test_Type:     Positive
    ##                                    start_clean, finish_clean, obj_type, field_type, field, obj, osc, log)
    removeSgBdgs   ${osc}

    ##
    ${result}=   positive test   ${true}  ${false}  sg  ${none}  ${none}  ${sg}  ${osc}  ${log}
    should be equal as integers  ${result}  0
    ## removeSgBdgs   ${osc}


12 Verify that you can Bind Policy To Security Group using an NSM DA
    #Test_Name:     Openstack_SG_Bind_TC1
    #Test_Desc:     Verify that you can Bind Policy To Security Group using an NSM DA
    #Test_Type:     Positive
    ##                                    start_clean, finish_clean, obj_type, field_type, field, obj, osc, log)
    removeSgBdgs   ${osc}

    ##
    ${result}=   positive add sg binding test  ${false}  ${false}  sgbdg  ${none}  ${none}  ${sg-client-and-server-bdg}  ${osc}  ${log}
    should be equal as integers  ${result}  0
    ##
    ##removeSgBdgs   ${osc}



13 Verify Inspection Policy -- Default Client And Server Protection for NSM DA
    #Test_Name:   Openstack_SG_Bind_TC14
    #Test_Desc:   Verify Inspection Policy -- Default Client And Server Protection for NSM DA
    #Test_Type:   Positive
    ##                                    start_clean, finish_clean, obj_type, field_type, field, obj, osc, log)
    removeSgBdgs   ${osc}

    ${result}=   positive add sg binding test  ${false}  ${false}  sgbdg  ${none}  ${none}  ${sg-client-and-server-bdg}  ${osc}  ${log}
    should be equal as integers  ${result}  0
##                                             expected_value               field_name      data_fetch_fcn     filter_field    filter_value      osc        data_fetch_fcn_args
    ${result}=   positive check field value    Default Client and Server Protection    policyName      getSgBdgs          ${none}         ${none}           ${osc}     sg_name_or_id   104-SG-123
    should be equal as integers  ${result}  0
    ##
    ##removeSgBdgs   ${osc}



14 Verify Inspection Policy -- Default Client Protection for NSM DA
    #Test_Name:   Openstack_SG_Bind_TC15
    #Test_Desc:   Verify Inspection Policy -- Default Client Protection for NSM DA
    #Test_Type:   Positive
    ##                                    start_clean, finish_clean, obj_type, field_type, field, obj, osc, log)
    removeSgBdgs   ${osc}

    ${result}=   positive add sg binding test  ${false}  ${false}  sgbdg  ${none}  ${none}  ${sg-client-bdg}  ${osc}  ${log}
    should be equal as integers  ${result}  0
##                                             expected_value               field_name      data_fetch_fcn     filter_field    filter_value      osc        data_fetch_fcn_args
    ${result}=   positive check field value    Default Client Protection    policyName      getSgBdgs          ${none}         ${none}           ${osc}     sg_name_or_id   104-SG-123
    should be equal as integers  ${result}  0
    ##
    ##removeSgBdgs   ${osc}



15 Verify Inspection Policy -- Default Server Protection for NSM DA
    #Test_Name:   Openstack_SG_Bind_TC16
    #Test_Desc:   Verify Inspection Policy -- Default Server Protection for NSM DA
    #Test_Type:   Positive
    ##                                    start_clean, finish_clean, obj_type, field_type, field, obj, osc, log)
    removeSgBdgs   ${osc}

    ${result}=   positive add sg binding test  ${false}  ${false}  sgbdg  ${none}  ${none}  ${sg-server-bdg}  ${osc}  ${log}
    should be equal as integers  ${result}  0
##                                            expected_value               field_name      data_fetch_fcn     filter_field    filter_value      osc        data_fetch_fcn_args
    ${result}=   positive check field value    Default Server Protection    policyName      getSgBdgs          ${none}         ${none}           ${osc}     sg_name_or_id   104-SG-123
    should be equal as integers  ${result}  0
    ##
    ##removeSgBdgs   ${osc}



##
##    'Chaining Failure Policy' Tests Do Not Currently Work Because NSC Has No Info on Dist. Appl. Instance Status
##
#16 Verify Chaining Failure Policy - FAIL_OPEN for NSM-DA
#    #Test_Name:   Openstack_SG_Bind_TC20
#    #Test_Desc:   Verify Chaining Failure Policy - FAIL_OPEN for NSM-DA
#    #Test_Type:   Positive
#    #Status:      INACTIVE -- NSC-type SDN controller does not currently support the OSC "failure chaining policy" feature, so this test currently fails
#    ##
#    removeSgBdgs   ${osc}
#
#    ${result}=   positive add sg binding test    ${false}       ${false}        sgbdg       ${none}       ${none}    ${sg-failopen-bdg}    ${osc}   ${log}
#    should be equal as integers  ${result}  0
#
#    ##                                           expected_value         field_name       data_fetch_fcn     filter_field    filter_value      osc        data_fetch_fcn_args
#    ${result}=   positive check field value      FAIL_OPEN              failurePolicy    getSgBdgs          ${none}         ${none}           ${osc}     sg_name_or_id   104-SG-123
#    should be equal as integers  ${result}  0
#    ##
#    ##removeSgBdgs   ${osc}
#
#
#
#17 Verify Chaining Failure Policy - FAIL_CLOSED for NSM-DA
#    #Test_Name:   Openstack_SG_Bind_TC21
#    #Test_Desc:   Verify Chaining Failure Policy - FAIL_CLOSED for NSM-DA
#    #Test_Type:   Positive
#    #Status:      INACTIVE -- NSC-type SDN controller does not currently support the OSC "failure chaining policy" feature, so this test currently fails
#    ##
#    removeSgBdgs   ${osc}
#
#    ##                                           start_clean,   finish_clean,   obj_type,   field_type,   field,     obj,                   osc,     log)
#    ${result}=   positive add sg binding test    ${false}       ${false}        sgbdg       ${none}       ${none}    ${sg-failclosed-bdg}   ${osc}   ${log}
#    should be equal as integers  ${result}  0
#
#    ##                                           expected_value         field_name       data_fetch_fcn     filter_field    filter_value      osc        data_fetch_fcn_args
#    ${result}=   positive check field value      FAIL_CLOSED            failurePolicy    getSgBdgs          ${none}         ${none}           ${osc}     sg_name_or_id   104-SG-123
#    should be equal as integers  ${result}  0
#    ##removeSgBdgs   ${osc}



