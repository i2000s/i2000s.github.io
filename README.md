---
layout: default
title: About this site

---

[![Build Status](https://travis-ci.org/i2000s/i2000s.github.io.svg?branch=dev)](https://travis-ci.org/i2000s/i2000s.github.io)

This site is mostly static HTML, generated by [Jekyll](https://github.com/mojombo/jekyll)
from [source on Github](https://github.com/i2000s/i2000s.github.io).  You are free
to fork and modify it for your own needs.
It was originally based on Carl Boettiger's
[labnotebook sites](http://carlboettiger.info) and David Ketcheson's [customization](http://davidketcheson.info).
Carl publishes the source for his site on Github as the
[labnotebook project](http://github.com/cboettig/labnotebook) and
releases it all under [CC0](http://creativecommons.org/publicdomain/zero/1.0/),
so setting my site up was as easy as following
[his instructions](http://www.carlboettiger.info/README.html),
replacing the \_posts directory, and making a few CSS customizations.
I have customized the source code a little bit more to make it much easier for anyone to adapt this source code to other repos and sites (see detailed instructions in a later section).

To run the site on a local computer, you need to install Jekyll and
dependencies, run `bundle install` then `bundle exec jekyll serve` (see detailed instruction below and the [issue](https://github.com/jekyll/jekyll/issues/332#issuecomment-18952908) of using baseurl for gh-pages subrepos).

You can generate the [Publications page](//www.qixiaodong.tk/en/pubs/) from a bibtex file
using some [code David Ketcheson wrote to generate HTML divs from Bibtex](https://github.com/ketch/tex2_rst_html).
It also makes use of [jQuery](https://github.com/ketch/tex2_rst_html) and
[MixItUp](https://mixitup.kunkalabs.com/) for filtering and searching.
Here, I am using the [Jekyll-scholar](https://github.com/inukshuk/jekyll-scholar) with some customizations.

Please report any errors or other feedback to the [Issue Tracker](https://github.com/i2000s/i2000s.github.io/issues) for this site, or in general for the Labnotebook on [Carl's repo](http://github.com/cboettig/labnotebook).

Additional Site Features & Credits
==================================
* CSS generated with [twitter bootstrap](http://twitter.github.com/bootstrap/)
* [Carl Boettiger's plugins](https://github.com/cboettig/jekyll-labnotebook-plugins) for Mendeley, Github, Twitter and others
* Integrated with IPython/IJulia/Jupyter notebooks and [MathJax](https://www.mathjax.org)
* Source code hosting on [Github](https://github.com/ketch/labnotebook) with automatic deployment using [Travis-CI](http://travis-ci.org) and Rake
* Improved "related posts" plugin from [David Lynch](https://github.com/kemayo/davidlynch.org/blob/master/_plugins/related_posts.rb)
* Improved publication and citation support from [Jekyll-scholar](https://github.com/inukshuk/jekyll-scholar) with some customizations

Instruction on hosting the site locally
=======================================
I use Ubuntu 16.04 LTS OS to generate the static website from source code.
Instructions on other operating systems should be similar.

If you run Jekyll sites for the first time, you may need to install Ruby v2.3.* (tested on v2.3.0 and v2.3.1) and the `gem` development envirenment.
I was basically following [this instruction](http://tecadmin.net/install-ruby-on-rails-on-ubuntu/) on my Ubuntu,
except for the step of sourcing RVM which I used the following command line instead  
```
source ~/.rvm/scripts/rvm
```
But you may find the source command works for you.
An improvement on the source command line following the instruction in the link is to use
```
echo "source /etc/profile.d/rvm.sh" >> ~/.bash_profile
```
which will add the rvm path to the bash profile perminantly.
If the source is setup correctly, `type rvm | head -n 1` should give `rvm is a function` as the output according to [this](https://rvm.io/rvm/install).
If you encounter any problem before the sourcing step, you should make sure whether the security key has been updated from the official [Ruby site](https://rvm.io/rvm/install).
Or, if you find the problem is due to the certificate, you may want to check out [this solution](http://stackoverflow.com/questions/3160909/how-do-i-deal-with-certificates-using-curl-while-trying-to-access-an-https-url/30154802#30154802).
Otherwise, you can also install rvm from a third-party repo following [this instruction](https://github.com/rvm/ubuntu_rvm) on Ubuntu OS and follow the outputed command line instruction on sourcing the profile.

On Ubuntu 16.04, you can follow [this instruction](https://gorails.com/setup/ubuntu/16.04) for updated information.
I would recommend you to use rvm on Rails to configure a compatible Ruby version, which is employed on travis.CI.
In the process of installing Ruby through rvm, if you encounter the ***permission denied*** error, you can try
```
rvmsudo rvm install 2.3.1
```
as an example.
Similarly, if `gem install rails` or other gem install command lines fail, you can also try
```
rvmsudo gem install rails
```
or similar to help solve some gem/Ruby package installation errors by promoting permissions in rvm.

For other systems, [here](https://www.ruby-lang.org/en/documentation/installation/) is the official guide for Ruby installation.

Besides, the library of `gsl` and the `pandoc` package are recommended to install for better support to the `clarifier-reborn` and other plugins/scripts used in this site.
On Ubuntu, I use the following lines
```
sudo add-apt-repository -y ppa:marutter/c2d4u
sudo apt-get update
sudo apt-get install pandoc
sudo apt-get install gsl-bin libgsl0-dev
```
On Windows OS, you may be able to follow [this instruction](https://davidburela.wordpress.com/2015/11/28/easily-install-jekyll-on-windows-with-3-command-prompt-entries-and-chocolatey/) to install Jekyll.
If you find some error related to Ruby Development Kit when you run `bundle exec jekyll serve` or `gem install ***`, you may find [this experience](http://flatshaded.com/2013/05/installing-jekyll-on-windows/) helpful.
`gsl` should be preinstalled in order to gem install `rb-gsl`, where the step in the `.travis.yml` configuration file about installing `gsl-bin` step does not apply to Windows systems.

The `Gemfile` and the configuration files `_conf.yml` and `.travis.yml` should include sufficient information on installing correct dependences.
Then for a routinely rendering, you only need to run the following command lines:
```
bundle install
bundle exec jekyll serve
```
Notice that, I have locked the Jekyll version to `~>3.1.6`.
If you want to use Jekyll version 2.5 or earlier, you may need to tweak the code a little bit.

If you encounter the missing credentials error for the `twitter_feed` plugin, you may need to export environmental variables `TWIT_KEY`, `TWIT_SECRET`, `TWIT_TOK` and `TWIT_TOK_SECRET` before running the jekyll server. All the credentials of the Twitter plugin should be accessible from the TWitter account used for the site.

By default, the local build should be accessible at `http://127.0.0.1:4000` on your internet browser.

How to adapt this source code to generate your own Jekyll website
=================================================================
Since Jekyll uses a very efficient way to control common information in fewer places, you can easily modify the source code of this website to generate your own website on GitHub and deploy to elsewhere.
In fact, when the site was initially designed and modified especially to my end, it has always been a common goal to make it easy for the community to migrate this source code to other web hosts and adapt to various purposes.
I encourage you to post an issue or make a pull request on this repo or the original [labnotebook repo](http://carlboettiger.info) if you find a way to improve the general design.
Only in this way, the network of people who have adapted this design to their sites can benefit most from the continuous improvement by the community who are following this body of code for open science and beyond.
Below are the minimum changes you need to make to serve your own purpose of using the source code.

1. Fork this repo under your GitHub account.

2. Change information defined in the `_config.yml` file for your case.
There you will find definitions for your site, Github account and repo information, as well as your personal contact information.
I will explain more advanced setting information below.

3. Add encrypted information in the `.travis.yml` file.
There you will find the `env/global` section where global variables are defined to automatically generate twitter timeline, github comment history and [deploy the site as gh-pages on the Travis-CI server](http://awestruct.org/auto-deploy-to-github-pages/).
You should remove all the original code starting with `secure` and replace with your own encrypted codes line by line in the `.travis.yml` file or on the Travis-CI setting page.
The recommended minimum global variables to be encrypted are: [Github Token](https://help.github.com/articles/creating-an-access-token-for-command-line-use/) (variable name `GH_TOKEN`), git commit author name (`GIT_NAME`), git commit author email (`GIT_EMAIL`);
if you want to generate a Twitter message line on your site using the `twitter_feed.rb` plugin, you will also need to encrypt Twitter key (`TWIT_KEY`), secret (`TWIT_SECRET`), token (`TWIT_TOK`), token secret (`TWIT_TOK_SECRET`).
Before you commit this step, make sure you have [ativated the Travis-CI module for your Github repo](https://travis-ci.org/getting_started).
You can then generate the encrypted variables by installing travis while on your local repo directory with command `gem install travis` and using the following command line format `travis encrypt GIT_NAME="Xiaodong Qi"`.
You should replace the variable name and value with the real cases as bash commands one after one.
Notice that when the variable value has a space inside, you need to use a pair of quotation marks as the example I gave--otherwise no need to use quotation marks in most cases; if you have special characters that bash command doesn't like, you need to [escape those characters](http://wiki.bash-hackers.org/syntax/quoting).
The last command line should generate a long string of random characters which you should be able to add to the `env/global` section of the `.travis.yml` file in the format of `- secure Your_Encrypt_Random_bits`.
You can certainly add more encrypt variables or define some non-sensitive variables as explicit/non-encrypted variables in a similar way, but the Github token has to be encrypted to pass the security check of Github.

4. If you have different amount of social accounts or plugin items defined in the `_config.yml` file, you need to double modify the scripts appeared in the header and footer template under the `_include` directory.
Notice that, by using different set of social account info in the configure file, the default social media icons will link to the front page of those empty social network websites.
To avoid these unwanted icons, you may want to delete/comment out those icon blocks in the footer templates and the index.html pages.
Similarly, if you want to add new social media icons, you can modify the configure file and corresponding footers with a compatible icon image.
On the top of this README file, there is an icon showing the compilation status of Travis-CI, you might want to modify the icon address to your case--pay attention to the username/organization name which is capital sensitive to Travis-CI.

5. Check the `metadata.html` template defined under the `_include` directory to make sure necessary information are shown correctly for you.
This metadata is just for different search engines and robots to recognize your website in particular formats.
I have used fields like `OtherName` to identify the author's local language name, as well as both Google analytics and Baidu analytics IDs for page visitor statistics. You can delete this field in the `config.yml` and the `metadata.html` files.
The `analytics.html` template in the `_include` directory has the website visiting analytics scripts for Google and Baidu which you may need to delete one or add a new one according to your preference.
The metadata file also defines the language information and keywords where you should most likely modify for your own version.
Other information if you don't understand, leaving them alone should be fine in most cases.

The publication and citation databases are defined in the `asset` directory as bibtex files with suffix `.bib`, which you may want to replace with your own.  
The rest is to delete or keep posts and pages to fit into your needs.
I suggest to put this source code in a branch other than `master` or `gh-pages` in your Github repository, which you need to define in the `_config.yml` file as the "sourcebranch".
The Travis-CI server will commit the generate website onto the `master` or `gh-pages` github branch depending on your case.
Once you have all the necessary configurations done, Travis-CI will be happily deploying your site on Github.
If you want the site to be deployed on a host other than Github, you may want to modify and run the `publish.sh` bash script to synchronize your locally generated `_site` folder or the master/gh-pages branch updated by Travis-CI to your target site host.


Copyrights and Licenses
=======================

[MIT](http://opensource.org/licenses/MIT) license for the plugins (in the `_plugins` directory of this repo) shown initially written by Carl Boettiger or Xiaodong Qi.
Creative Commons Attributions 3.0 Unported [CC-BY](http://creativecommons.org/licenses/by/3.0/deed.en_US) license for the content originally created by David Ketcheson.
Creative Commons Attributions 4.0 [CC-BY](https://creativecommons.org/licenses/by/4.0/) license for content other than plugins originally written by Xiaodong Qi and all the other unspecified cases.
If a license is clarified at a much specified scope, that specified license should apply to the scope it covers.
You can find the full editing history of each file.
Credits should be given appropriately to the origination and the initial author at less and all following contributors if situation permits.
For instance, you can cite or attribute posts/works originally from this site/repository as:

Xiaodong Qi ("Page publication date"), "Page Title", Lab Notebook, [http://i2000s.github.io](http://i2000s.github.io)

with appropriate page title and publication date as indicated.
[Greycite](http://greycite.knowledgeblog.org/) is an excellent online tool that can generate the citation information for any particular page given it's URL.
