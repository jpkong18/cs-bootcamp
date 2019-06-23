namespace: demo
flow:
  name: jptest
  workflow:
    - deploy_vm:
        do:
          io.cloudslang.microsoft.azure.deploy_vm:
            - subscription_id: "${get_sp('io.cloudslang.base.from')}"
            - resource_group_name: "${get_sp('io.cloudslang.base.hostname')}"
            - username: "${get_sp('io.cloudslang.base.http.keystore')}"
            - password:
                value: "${get_sp('io.cloudslang.base.hostname')}"
                sensitive: true
            - location: "${get_sp('get_robot_params_script_template')}"
            - vm_size: "${get_sp('get_robot_params_script_template')}"
            - offer: "${get_sp('io.cloudslang.base.network.keystore')}"
            - sku: "${get_sp('io.cloudslang.base.network.trust_password')}"
            - publisher: "${get_sp('io.cloudslang.base.network.keystore_password')}"
            - virtual_network_name: '${subscription_id}'
            - availability_set_name: '${virtual_network_name}'
            - storage_account: "${get_sp('io.cloudslang.base.to')}"
            - subnet_name: "${get_sp('io.cloudslang.base.http.trust_keystore')}"
            - os_platform: "${get_sp('io.cloudslang.base.http.keystore')}"
            - vm_username: "${get_sp('io.cloudslang.base.http.keystore')}"
            - vm_password:
                value: "${get_sp('io.cloudslang.base.hostname')}"
                sensitive: true
            - disk_size: "${get_sp('io.cloudslang.base.port')}"
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      deploy_vm:
        x: 190
        y: 91
        navigate:
          ff5a99f0-82b3-1642-b18c-2a7539c9b356:
            targetId: 1fceba17-6131-17df-14f5-905b6fc841c0
            port: SUCCESS
    results:
      SUCCESS:
        1fceba17-6131-17df-14f5-905b6fc841c0:
          x: 442
          y: 95
