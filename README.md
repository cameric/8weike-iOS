# iOS Client
iOS client for the expert-finder service (name TBD).

## `cocoapods` setup for first use
This repo uses Cocoapods for dependency management. Dependencies and their
version numbers are saved in the repo (see `Podfile`), but the files themselves
are not. The first time you use this repo, run

    sudo gem install cocoapods
    pod install

This will download and set up the dependencies specified in `Podfile`. **You must
open the project via `iosClient.xcworkspace`** rather than the `.xcodeproj` file
for dependencies to be imported correctly.

## Using `synx` to synchronize project directories

NOTE: Synx currently doesn't support multilanguage projects. Use [Spencer's fork](https://github.com/sxmichaels/synx) instead.

By default, Xcode puts all source code files in the project root directory,
which is messy. If you've created new groups or files, before you commit, please
use `synx` to organize the project directory structure based on its
representation in Xcode.

Install:

    sudo gem install synx

Run (**do this before you commit if you've added new files/groups in Xcode**):

    synx ./iosClient.xcodeproj

## 解决RubyGem国内被墙的问题
如果 `ping https://rubygems.org/` 一直timeout，尝试替换成国内淘宝的镜像：

	gem sources --remove http://rubygems.org/
	gem sources --remove https://rubygems.org/
	gem sources -a https://ruby.taobao.org/
	gem sources -l

这时source应该只有淘宝的镜像：

	*** CURRENT SOURCES ***

	https://ruby.taobao.org/

如果在过程中出现ssl问题，首先安装最新stable版本ruby：

	rbenv install 2.1.2

然后检查当前ruby的版本：

	ruby -v

如果不是v2.1.2，用rvm切换：

	rvm use 2.1.2

ssl配置更新完后就可以添加境内source

## Note on HTTPS TLS/1 Domain Exceptions
So far we integrate two third-party libraries: LeanEngine for Back-end services and
Weibo for third-party login. Unfortunately, both libararies haven't conformed to
the newest TLS/2 HTTPS license for cross-domain HTTP requests. However, during the most
recent WWDC Apple recommended (or asked) every app to migrate their HTTP calls to TLS/2
security level.

Thus the only way to get around this (at this point) is to add the corresponding
domains for the two frameworks to the whitelist of our app.
All relative domains have been included in Info.plist.

> Note: I made this section for reminder purposes. In the future if any (or both) of the
> frameworks update their API server to TLS/2 license, we will eliminate those domains
> from exception list immediately for security reasons.
> - Tony

Reference:
-  [Great StackOverflow page on this issue](http://stackoverflow.com/questions/30739473/nsurlsession-nsurlconnection-http-load-failed-on-ios-9)
-  [Official Apple announcement on App Transport Security (ATS)](https://developer.apple.com/library/ios/releasenotes/General/WhatsNewIniOS/Articles/iOS9.html#//apple_ref/doc/uid/TP40016198-DontLinkElementID_13)
