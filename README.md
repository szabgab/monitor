# Monitor

Tool to monitor name resolutions and websites


See the https://github.com/szabgab/try-monitor/ or the https://github.com/szabgab/my-monitor repositories for an examples.

1. Create a configuration YAML file like this:

```
sites/code-maven.com.yaml
```

```yaml
sites:
  # To check the mx DNS resolving of a domain use the `mx` key.
  - mx: code-maven.com
    ips:
      - mx1.forwardemail.net.
      - mx2.forwardemail.net.

  # To check the DNS resolving of a hostname use the `host` key and either specify the list of expected IP addresses ...
  - host: academy.code-maven.com
    ips:
      - 173.255.196.65

  # ... or use the word `github` if your host is hosted on github pages.
  - host: code-maven.com
    ips: github

  # To check the content of a web site use the `url` key.
  - url: https://code-maven.com/
    status_code: 200
    html_contains: "<title>Code Maven - for people who code</title>"

  # To check the redirection of a web site use the `url` key.
  - url: http://code-maven.com/
    status_code: 301
    headers:
       Location: https://code-maven.com/
```


2. Create a GitHub Workflow file:

* This will run the workflow once an hour at the 42nd minute of the hour.
* This will use the version that was tagged as `v1.00` This makes it safe and boring as the action does not change beneath your workflow.
* Instead of `v1.00` you should probably use the most recent tag or you can live on the edge and use `main` instead.
* You either list the specific config files or you can use wild-cards. In the example below you can see both.

```yaml
name: CI

on:
  push:
  pull_request:
  schedule:
   - cron: '42 * * * *'
  workflow_dispatch:

jobs:
  build-in-container:
    runs-on: ubuntu-latest
    container:
      image: python:3.14
    name: Run
    steps:
      - name: Checkout
        uses: actions/checkout@v6

      # Pass the name of the individual config files
      - uses: szabgab/monitor@v1.00
        with:
          config: sites/code-maven.com.yaml sites/szabgab.com.yaml

      # Pass wild-card should also work
      - uses: szabgab/monitor@v1.00
        with:
          config: sites/*.yaml
```






