*(wip)*

## Server

Install dnsmasq
---------------
```bash
brew install dnsmasq
```

Add DNS Domains
-----------------
```bash
mkdir -p /usr/local/etc/ &&
echo "address=/build/127.0.0.1" >> /usr/local/etc/dnsmasq.conf && 
echo "address=/stage/192.168.10.200" >> /usr/local/etc/dnsmasq.conf && 
echo "listen-address=127.0.0.1" >> /usr/local/etc/dnsmasq.conf
```

Enable dnsmasq daemon
-------------
```bash
sudo cp "/usr/local/Cellar/dnsmasq/2.57/homebrew.mxcl.dnsmasq.plist" "/Library/LaunchDaemons" &&
sudo launchctl load -w "/Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist"
```

Add Localhost to /etc/resolver
-----------------------------------
```bash
sudo -s
sudo mkdir -p /etc/resolver
sudo echo 'nameserver 127.0.0.1' > /etc/resolver/build

#flush cache
dscacheutil -flushcache

#ensure it works
scutil --dns
```


Enable virtual hosts
--------------------
```bash
subl "/etc/apache2/users/$USER.conf"
```

```bash
DocumentRoot "/Users/Joel/Sites/"
NameVirtualHost *:80
<Directory "/Users/Joel/Sites/">
    Options Indexes MultiViews FollowSymLinks Includes
    AllowOverride All
    Order allow,deny
    Allow from all
</Directory>
<VirtualHost *:80>
    UseCanonicalName off
    VirtualDocumentRoot /Users/Joel/Sites/%-2+/httpdocs
</VirtualHost>
```




```bash
#open apache config
subl "/etc/apache2/httpd.conf"
```

Configure httpd.conf
---------------------

```bash
ServerRoot "/usr"

Listen 80

LoadModule authn_file_module libexec/apache2/mod_authn_file.so
LoadModule authn_dbm_module libexec/apache2/mod_authn_dbm.so
LoadModule authn_anon_module libexec/apache2/mod_authn_anon.so
LoadModule authn_dbd_module libexec/apache2/mod_authn_dbd.so
LoadModule authn_default_module libexec/apache2/mod_authn_default.so
LoadModule authz_host_module libexec/apache2/mod_authz_host.so
LoadModule authz_groupfile_module libexec/apache2/mod_authz_groupfile.so
LoadModule authz_user_module libexec/apache2/mod_authz_user.so
LoadModule authz_dbm_module libexec/apache2/mod_authz_dbm.so
LoadModule authz_owner_module libexec/apache2/mod_authz_owner.so
LoadModule authz_default_module libexec/apache2/mod_authz_default.so
LoadModule auth_basic_module libexec/apache2/mod_auth_basic.so
LoadModule auth_digest_module libexec/apache2/mod_auth_digest.so
LoadModule cache_module libexec/apache2/mod_cache.so
LoadModule disk_cache_module libexec/apache2/mod_disk_cache.so
LoadModule mem_cache_module libexec/apache2/mod_mem_cache.so
LoadModule dbd_module libexec/apache2/mod_dbd.so
LoadModule dumpio_module libexec/apache2/mod_dumpio.so
LoadModule reqtimeout_module libexec/apache2/mod_reqtimeout.so
LoadModule ext_filter_module libexec/apache2/mod_ext_filter.so
LoadModule include_module libexec/apache2/mod_include.so
LoadModule filter_module libexec/apache2/mod_filter.so
LoadModule substitute_module libexec/apache2/mod_substitute.so
LoadModule deflate_module libexec/apache2/mod_deflate.so
LoadModule log_config_module libexec/apache2/mod_log_config.so
LoadModule log_forensic_module libexec/apache2/mod_log_forensic.so
LoadModule logio_module libexec/apache2/mod_logio.so
LoadModule env_module libexec/apache2/mod_env.so
LoadModule mime_magic_module libexec/apache2/mod_mime_magic.so
LoadModule cern_meta_module libexec/apache2/mod_cern_meta.so
LoadModule expires_module libexec/apache2/mod_expires.so
LoadModule headers_module libexec/apache2/mod_headers.so
LoadModule ident_module libexec/apache2/mod_ident.so
LoadModule usertrack_module libexec/apache2/mod_usertrack.so
#LoadModule unique_id_module libexec/apache2/mod_unique_id.so
LoadModule setenvif_module libexec/apache2/mod_setenvif.so
LoadModule version_module libexec/apache2/mod_version.so
LoadModule proxy_module libexec/apache2/mod_proxy.so
LoadModule proxy_connect_module libexec/apache2/mod_proxy_connect.so
LoadModule proxy_ftp_module libexec/apache2/mod_proxy_ftp.so
LoadModule proxy_http_module libexec/apache2/mod_proxy_http.so
LoadModule proxy_scgi_module libexec/apache2/mod_proxy_scgi.so
LoadModule proxy_ajp_module libexec/apache2/mod_proxy_ajp.so
LoadModule proxy_balancer_module libexec/apache2/mod_proxy_balancer.so
LoadModule ssl_module libexec/apache2/mod_ssl.so
LoadModule mime_module libexec/apache2/mod_mime.so
LoadModule dav_module libexec/apache2/mod_dav.so
LoadModule status_module libexec/apache2/mod_status.so
LoadModule autoindex_module libexec/apache2/mod_autoindex.so
LoadModule asis_module libexec/apache2/mod_asis.so
LoadModule info_module libexec/apache2/mod_info.so
LoadModule cgi_module libexec/apache2/mod_cgi.so
LoadModule dav_fs_module libexec/apache2/mod_dav_fs.so
LoadModule vhost_alias_module libexec/apache2/mod_vhost_alias.so
LoadModule negotiation_module libexec/apache2/mod_negotiation.so
LoadModule dir_module libexec/apache2/mod_dir.so
LoadModule imagemap_module libexec/apache2/mod_imagemap.so
LoadModule actions_module libexec/apache2/mod_actions.so
LoadModule speling_module libexec/apache2/mod_speling.so
LoadModule userdir_module libexec/apache2/mod_userdir.so
LoadModule alias_module libexec/apache2/mod_alias.so
LoadModule rewrite_module libexec/apache2/mod_rewrite.so
#LoadModule perl_module libexec/apache2/mod_perl.so
LoadModule php5_module libexec/apache2/libphp5.so
#LoadModule hfs_apple_module libexec/apache2/mod_hfs_apple.so

<IfModule !mpm_netware_module>
<IfModule !mpm_winnt_module>

User _www
Group _www

</IfModule>
</IfModule>

ServerAdmin saetia@gmail.com

ServerName localhost

DocumentRoot "/Library/WebServer/Documents"

<Directory />
    Options FollowSymLinks
    AllowOverride None
    Order deny,allow
    Deny from all
</Directory>

<Directory "/Library/WebServer/Documents">
    Options Indexes FollowSymLinks MultiViews
    AllowOverride None
    Order allow,deny
    Allow from all
</Directory>

<IfModule dir_module>
    DirectoryIndex index.php index.html
</IfModule>

<FilesMatch "^\.([Hh][Tt]|[Dd][Ss]_[Ss])">
    Order allow,deny
    Deny from all
    Satisfy All
</FilesMatch>

<Files "rsrc">
    Order allow,deny
    Deny from all
    Satisfy All
</Files>

<DirectoryMatch ".*\.\.namedfork">
    Order allow,deny
    Deny from all
    Satisfy All
</DirectoryMatch>

ErrorLog "/private/var/log/apache2/error_log"

LogLevel warn

<IfModule log_config_module>

    LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
    LogFormat "%h %l %u %t \"%r\" %>s %b" common

    <IfModule logio_module>
      LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O" combinedio
    </IfModule>

    CustomLog "/private/var/log/apache2/access_log" common

</IfModule>

<IfModule alias_module>
    ScriptAliasMatch ^/cgi-bin/((?!(?i:webobjects)).*$) "/Library/WebServer/CGI-Executables/$1"
</IfModule>

<IfModule cgid_module>
</IfModule>

<Directory "/Library/WebServer/CGI-Executables">
    AllowOverride None
    Options None
    Order allow,deny
    Allow from all
</Directory>

DefaultType text/plain

<IfModule mime_module>

    TypesConfig /private/etc/apache2/mime.types

    AddType application/x-compress .Z
    AddType application/x-gzip .gz .tgz

</IfModule>

TraceEnable off

Include /private/etc/apache2/extra/httpd-mpm.conf
Include /private/etc/apache2/extra/httpd-autoindex.conf
Include /private/etc/apache2/extra/httpd-languages.conf
Include /private/etc/apache2/extra/httpd-userdir.conf
Include /private/etc/apache2/extra/httpd-manual.conf

<IfModule ssl_module>
    SSLRandomSeed startup builtin
    SSLRandomSeed connect builtin
</IfModule>

<IfModule php5_module>
    AddType application/x-httpd-php .php
    AddType application/x-httpd-php-source .phps
    <IfModule dir_module>
        DirectoryIndex index.html index.php
    </IfModule>
</IfModule>

Include /private/etc/apache2/other/*.conf
```

Enable centOS style /var/www/vhosts
-----------------------------------

```bash
sudo mkdir -p /var/www/ &&
sudo ln -s ~/Sites /var/www/vhosts
```





XDebug
------


```bash
brew install https://github.com/josegonzalez/homebrew-php/raw/master/Formula/xdebug-php.rb
```

MySQL
-----

```bash
brew install mysql
```

MySQL Settings
--------------


```bash

#setup daemon
mkdir -p ~/Library/LaunchAgents && cp /usr/local/Cellar/mysql/5.5.20/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents/ && launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist


#Set up databases to run as your user account
unset TMPDIR && mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp

#start mysql
mysql.server start

#secure mysql
/usr/local/Cellar/mysql/5.5.20/bin/mysql_secure_installation
```


PostgreSQL
-----

```bash
brew install --without-ossp-uuid https://raw.github.com/briancunnie/homebrew/postgres-no-ossp-uuid/Library/Formula/postgresql.rb
```

PostgreSQL Settings
--------------


```bash
#create database
initdb /usr/local/var/postgres

#autostart
mkdir -p ~/Library/LaunchAgents
cp /usr/local/Cellar/postgresql/9.0.4/org.postgresql.postgres.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/org.postgresql.postgres.plist

#fix the psql error
sudo mkdir /var/pgsql_socket/
ln -s /private/tmp/.s.PGSQL.5432 /var/pgsql_socket/

#create user and databases
createuser user
createdb -Ouser -Eutf8 -T template0 user_development
createdb -Ouser -Eutf8 -T template0 user_test
```