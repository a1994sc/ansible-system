# Ansible Role - `ascii17.system_config.environment`

Role to update the `/etc/environment` file for global environment vars.

## Variables

#### VARIABLES

|           **Name** |    **Type**    | **Default**             | **Description**                                   |
| -----------------: | :------------: | :---------------------- | :------------------------------------------------ |
| **os_environment** | `List[Object]` | `See defaults/main.yml` | Sets the global environment variables for the OS. |

#### VARIABLES for `os_environment` list

| **Sub-var** | **Type** | **Default** | **Description**                |
| :---------- | :------: | :---------- | :----------------------------- |
| **key**     | `String` | `null`      | Name of environment variable.  |
| **value**   | `String` | `null`      | Value of environment variable. |
