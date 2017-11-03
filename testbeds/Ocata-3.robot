*** Variables ***
# OSC
${osc-ip}=  10.3.241.211
${osc-user}=  admin
${osc-pass}=  admin123
${args}=  -d    2    -v

${none}=

# VC
${vc-type}=  OPENSTACK
${vc-name}=  default-VC
${vc-providerIP}=  10.3.241.221
${vc-providerUser}=  admin
${vc-providerPass}=  admin123
${vc-softwareVersion}=  Icehouse
${vc-ishttps}=  false
${vc-rabbitMQPort}=  5672
${vc-rabbitUser}=  guest
${vc-rabbitMQPassword}=  guest
${vc-adminProjectName}=  admin
${vc-adminDomainId}=  default
${vc-controllerType}=  NSC
#${vc-controllerType}=  NONE
${verbose}=  true
${delay}=  1
${blank}=


# MC
${mc-type}=  ISM
${mc-name}=  default-MC
${mc-providerIP}=  1.2.3.4
${mc-user}=  admin
${mc-pass}=  admin123
${mc-apikey}=

${nsm-cer-name}=  notUse
${nsm-cer-body}=  -----BEGIN CERTIFICATE-----\n xxxxxxxxxxxxxxx \n-----END CERTIFICATE-----

# DA (daname, mcname, model, swname, domainName, encapType, vcname, vctype)
${da-name}=  default-DA
${da-mcname}=  default-MC
${da-vcname}=  default-VC
${da-vctype}=  OPENSTACK
${da-model}=  CIRROS-TCPD
${da-swname}=  0.3.0.5000
${da-domainName}=  Default
${da-encapType}=  VLAN
${vnf-path}=  ../osc_resources/cirrosAppl-1nic.zip

# DS
${ds-name}=  default-DS
${ds-daname}=  default-DA
${ds-project}=  admin
${ds-region}=   RegionOne
#${ds-selction}=  All
${ds-selction}=  hosts:ocata-comp
${ds-mgmt-net}=  mgmt
${ds-insp-net}=  inspection
${ds-floating-ip-pool}=  null
${ds-count}=  1
${ds-shared}=  ${true}

${ds-2-selection}=  All
${da-2-name}=  second-DA
${ds-2-daname}=  ${da-2-name}

${sg-network-mul-members-name}=  networks:mgmt-net
${sg1-name}=  default-SG1
${sg-vm-mul-members-name} =  vms:testvm-1

# SG
${sg-name}=  default-SG
${sg-protect-all}=  false
${sg-vm-member-name}=  victim
${sg-vm-member-type}=  VM
${sg-network-member-name}=  ${ds-mgmt-net}
${sg-network-member-type}=  NETWORK
${sg-subnet-member-name}=  mgmt-subnet
${sg-subnet-member-type}=  SUBNET
${sg-binding-da-name}=  ${da-name}
${sg-binding-is-binded}=  ${true}
##${sg-binding-name}=  ${sg-name} Test Binding
${sg-binding-name}=  default-SG-Bind
${sg-odd-policy}=  Odd
${sg-even-policy}=  Even
${sg-multiple-policy}=  Odd,Even

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

${sfc-name}=   default-SFC
${sfc-2-name}=   second-SFC


