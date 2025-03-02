# Ansible Role - `ascii17.system_config.dnf_repo`

Role for creating multiple yum repos at once. Allows for the creation of gpg keys on the filesystem.

## Variables

#### REQUIRED VARIABLES

|      **Name** | **Sub-var** | **Type** | **Description**                                                                               |
| ------------: | :---------- | :------: | :-------------------------------------------------------------------------------------------- |
| **dnf_repos** | **name**    | `String` | Unique repository ID. This option builds the section name of the repository in the repo file. |
| **dnf_repos** | **baseurl** | `String` | URL to the directory where the yum repository’s ‘repodata’ directory lives.                   |

#### OPTIONAL VARIABLES

|      **Name** | **Sub-var**         |    **Type**    | **Default** | **Description**                                                                                                                                             |
| ------------: | :------------------ | :------------: | :---------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **dnf_repos** | **enabled**         |   `Boolean`    | `true`      | This tells yum whether or not use this repository.                                                                                                          |
| **dnf_repos** | **state**           |    `String`    | `"present"` | State of the repo file.                                                                                                                                     |
| **dnf_repos** | **description**     |    `String`    | omitted     | A human readable string describing the repository. This option corresponds to the “name” property in the repo file.                                         |
| **dnf_repos** | **enablegroups**    |    `String`    | omitted     | Determines whether yum will allow the use of package groups for this repository.                                                                            |
| **dnf_repos** | **exclude**         | `List[String]` | omitted     | List of packages to exclude from updates or installs. This should be a space separated list. Shell globs using wildcards (for example * and ?) are allowed. |
| **dnf_repos** | **file**            |    `String`    | omitted     | File name without the `.repo` extension to save the repo in. Defaults to the value of `name`.                                                               |
| **dnf_repos** | **gpgcheck**        |   `Boolean`    | omitted     | Tells yum whether or not it should perform a GPG signature check on packages.                                                                               |
| **dnf_repos** | **gpgkey**          |    `String`    | omitted     | A URL pointing to the ASCII-armored GPG key file for the repository.                                                                                        |
| **dnf_repos** | **username**        |    `String`    | omitted     | Username to use for basic authentication to a repo or really any url                                                                                        |
| **dnf_repos** | **password**        |    `String`    | omitted     | Password to use with the username for basic authentication.                                                                                                 |
| **dnf_repos** | **metadata_expire** |    `String`    | omitted     | Time (in seconds) after which the metadata will expire.                                                                                                     |

#### GPG KEY MANAGEMENT VARIABLES

|    **Name** | **Sub-var** | **Type** | **Description**                     |
| ----------: | :---------- | :------: | :---------------------------------- |
| **dnf_gpg** | **name**    | `String` | Name of the GPG file.               |
| **dnf_gpg** | **gpg**     | `String` | The actual public GPG key contents. |

#### DISABLE REPOS

|              **Name** |    **Type**    | **Default** | **Description**                                                          |
| --------------------: | :------------: | :---------- | :----------------------------------------------------------------------- |
|       **dnf_disable** |   `Boolean`    | `false`     | Wether to disable any repos.                                             |
| **dnf_disable_repos** | `List[String]` | `[]`        | Repo files in `/etc/yum.repos.d/` without the file extension of `.repo`. |
