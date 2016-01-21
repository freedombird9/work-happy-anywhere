# work-happy-anywhere

## set_envs.sh

Command **`set_envs.sh app.yaml`** will read the environment variables under key `env_variables` from file `app.yaml`. This is the config file format for GCS (Google Cloud Service). An example `app.yaml` looks like:

```yaml
application: project-id
version: 1
runtime: python27 
api_version: 1

// other config settings

env_variables:
 DJANGO_SETTINGS_MODULE: 'base.settings'
 GAE_SQL_HOST: '/cloudsql/:dbname'
 GAE_SQL_DBNAME: 'dbname'
 LOCAL_SQL_HOST: 'host_ip_address'
 LOCAL_SQL_DBNAME: 'dbname'
 DEBUG: 'off'
 TEMPLATE_DEBUG: 'off'
 ALLOWED_HOSTS: '*' 
 GCM_PUSH_API_KEY: 'key'
```

It reads all the env_variables and exports them to your current terminal, so that you can run the app locally to debug.

### Usage

It only supports bash 4. To install bash 4 on Mac:

```
# Homebrew installs the new bash under /usr/local/bin/bash
brew update && brew install bash
```

```bash
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell
chsh -s /usr/local/bin/bash
```

Now close your current terminal and start a new one. Run `bash --version`, you should see version 4.X.X

Install PyYAML:

The shell script relies on a python program to parse the yaml file. You need this module to run the python parser (read_yaml.py).

```bash
pip install pyyaml
```

Then you're ready to go. Remember to execute it with `. set_envs.sh /path/to/yamlfile` or `source set_envs.sh /path/to/yamlfile`.

If you run it directly, the environment variables won't be exported to your current working shell, rather, they'll be exported to a sub-shell and be gone.
