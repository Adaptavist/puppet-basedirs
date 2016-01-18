#Basedirs

[![Build Status](https://travis-ci.org/Adaptavist/puppet-basedirs.svg?branch=master)](https://travis-ci.org/Adaptavist/puppet-basedirs)

####Table of Contents

1. [Overview - What is the basedirs module?](#overview)
1. [Module Description - What does the module do?](#module-description)
1. [Module Dependencies - What does the module rely on?](#module-dependencies)
1. [Usage - The classes and defined types available for configuration](#usage)
    * [Classes and Defined Types](#classes-and-defined-types)
        * [Class: basedirs](#class-basedirs)
    * [Examples - Demonstrations of some configuration options](#examples)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
    * [Classes](#classes)
        * [Public Classes](#public-classes)
        * [Private Classes](#private-classes)
    * [Defined Types](#defined-types)
        * [Public Defined Types](#public-defined-types)
        * [Private Defined Types](#private-defined-types)
    * [Templates](#templates)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)
    * [Contributing to the module](#contributing)
    * [Running tests - A quick guide](#running-tests)

##Overview

The **BaseDirs** module creates directories that other modules depend upon. It is a wrapper around file puppet resource and makes it easier to define required folders. 

##Module Description

Makes sure required directories are created. Directories are passed as hash via directories parameter.

By default it creates the directory `/opt` that belongs to root user and group. 

##Module Dependencies

This module has no dependencies on other puppet modules.

##Usage

###Classes and defined types

####Class: Basedirs

Main class that accepts directories hash as parameter and creates file resources.

###Examples

```

 basedirs:directories:
   "/opt/jira":
     ensure: 'directory'
     owner: 'root'
     group': 'root'
     mode': '755'
   "/tmp/example":
     ensure: 'directory'
     owner: 'root'
     group': 'root'
     mode': '755'
   
```

##Reference

###Classes

####Public classes

* basedirs - creates directoris/files passed as directories hash parameter. By default it creates "/opt" that belongs to root user and group

####Private classes


###Defined types

####Public defined types

####Private defined types

###Templates

##Limitations

* Module is not specific to OS.

##Development

###Contributing

* Create branch, name it according to functionality you are developing. Prefix with feature or bug, so the branch name looks like feature/<name_of_feature>

* Make changes and commit functionality to branch. Do not forget to write/adjust tests

* Create pull request, add reviewers

* Once approved, merge with master

###Running tests

Tests are located in spec folder. Subfolders classes and defines separates types of objects tested. Make sure .fixtures.yml contains all dependent modules to run tests. Functionality in all classes and defines has to be tested for all supported OS and cases of use. 

To run tests:
```
gem install bundler
bundle install
bundle exec rake spec
```
