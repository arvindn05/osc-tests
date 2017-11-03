*** Variables ***
# OSC
${osc-ip}=  10.3.205.110
${osc-user}=  admin
${osc-pass}=  admin123
${args}=  -d    2    -v

${none}=

# VC
${vc-type}=  OPENSTACK
${vc-name}=  default-VC
${vc-providerIP}=  20.0.0.2
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
${da-name}=  DAdefault
${da-mcname}=  default-MC
${da-vcname}=  default-VC
${da-vctype}=  OPENSTACK
${da-model}=  CIRROS-TCPD
${da-swname}=  0.3.0.5000
${da-domainName}=
${da-encapType}=
${vnf-path}=  ../osc_resources/cirrosAppl-1nic.zip

# DS
${ds-name}=  DSdefault
${ds-daname}=  DAdefault
${ds-project}=  demo
${ds-region}=   regionOne
${ds-selction}=  All
${ds-mgmt-net}=  demo-net
${ds-insp-net}=  insp-net
${ds-floating-ip-pool}=  ext-net
${ds-count}=  1
${ds-shared}=  ${true}

# SG
${sg-name}=  default-SG-123
${sg-protect-all}=  false
${sg-vm-member-name}=  cirros1
${sg-vm-member-type}=  VM
${sg-network-member-name}=  demo-net
${sg-network-member-type}=  NETWORK
${sg-subnet-member-name}=  demo-subnet
${sg-subnet-member-type}=  SUBNET
${sg-binding-da-name}=  ${da-name}
${sg-binding-is-binded}=  ${true}
##${sg-binding-name}=  ${sg-name} Test Binding
${sg-binding-name}=  default-SG-123-BDG-1
${sg-client-policy-name}=  default  Client  Protection
${sg-server-policy-name}=  default  Server  Protection
${sg-client-and-server-policy-name}=  default  Client  and  Server  Protection
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



