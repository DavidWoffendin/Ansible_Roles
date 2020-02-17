#!/bin/sh
password="$(echo "$2" | sed 's/\$/\\$/g')"
echo "jenkins.model.Jenkins.instance.securityRealm.createAccount(\"$1\", \"$password\")" | \
  java -jar /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar -s \
  'http://localhost:8080' \
  -auth "admin:${3}" -noKeyAuth groovy =
