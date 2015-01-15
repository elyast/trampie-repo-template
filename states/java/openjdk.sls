{% set version = pillar['java']['version'] -%}
{% if grains['cpuarch'] == 'x86_64' %}
{% set arch = '-amd64' -%}
{% else -%}
{% set arch = '-i386' -%}
{% endif -%}
{% set parent_home = pillar['java']['parent_home'] -%}
{% set path_tmp = "java-{0}-openjdk{1}" -%}
{% set path = path_tmp.format(version, arch) -%}
{% set home = "{0}/{1}".format(parent_home, path) -%}
{% set java_home = "{0}/jre".format(home) -%}

jdk-pkg:
  pkg.installed:
    - names:
      - openjdk-{{ version }}-jdk
      - default-jre-headless

/etc/environment:
  file.append:
    - text: JAVA_HOME={{ home }}/jre
    - require:
      - pkg: jdk-pkg
      - file: sed_etc_env

sed_etc_env:
  file.sed:
    - name: /etc/environment
    - before: '^JAVA_HOME.*$'
    - after: JAVA_HOME={{ home }}/jre
    - require:
      - pkg: jdk-pkg

