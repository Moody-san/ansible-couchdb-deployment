%{ for server_info in ociservers ~}
%{ if server_info.is_oracle_db || server_info.is_oracle_master ~}
${server_info.all_details} ansible_ssh_common_args="-o ProxyJump=ubuntu@${ocibastionpubip[0]}"
%{ endif ~}
%{ endfor ~}
%{ for server_info in azservers ~}
%{ if server_info.is_azure_db || server_info.is_azure_master ~}
${server_info.all_details} ansible_ssh_common_args="-o ProxyJump=ubuntu@${ocibastionpubip[0]}"
%{ endif ~}
%{ endfor ~} 

[masters]
%{ for server_info in ociservers ~}
%{ if server_info.is_oracle_master ~}
${server_info.name}
%{ endif ~}
%{ endfor ~} 
%{ for server_info in azservers ~}
%{ if server_info.is_azure_master ~}
${server_info.name}
%{ endif ~}
%{ endfor ~} 

[db1]
%{ for server_info in azservers ~}
%{ if server_info.is_azure_db ~}
${server_info.name}
%{ endif ~}
%{ endfor ~} 

[db2]
%{ for server_info in ociservers ~}
%{ if server_info.is_oracle_db ~}
${server_info.name}
%{ endif ~}
%{ endfor ~} 

