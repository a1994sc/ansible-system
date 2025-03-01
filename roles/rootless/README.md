# Ansible Role - `ascii17.system_config.rootless`

Role pulled in from [rwxd/ansible-role-subuid_subgid](https://github.com/rwxd/ansible-role-subuid_subgid/tree/main).

## Variables

#### VARIABLES

|            **Name** |    **Type**    | **Default** | **Description**                       |
| ------------------: | :------------: | :---------- | :------------------------------------ |
|     **subid_users** | `List[string]` | `[]`        | Users to update the subuid and subgid |
| **subuid_bitshift** |     `Int`      | `16`        | Used for bit-shifting the subuid      |
| **subgid_bitshift** |     `Int`      | `16`        | Used for bit-shifting the subgid      |
