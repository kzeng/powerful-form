#超级表单
人人可用的在线表单工具
超级表单帮你收集和管理日常工作中的数据，把几小时的工作节约至零。

##安装与配置
  1. 通过Git安装

    ```bash
    cd /var/www/
    git clone https://git.oschina.net/kzeng/powerful-form.git mysite.com
    ```

  2. 初始化

     执行 `init` 命令，然后选择 `dev` or `prod` 环境.

      ```bash
      cd /var/www/mysite.com/
      php init
      ```
  
  3. 配置Web服务器:

     Apache 服务器参考配置如下:
     
     ```apacheconf
     <VirtualHost *:80>
       ServerName mysite.com
       ServerAlias www.mysite.com
       DocumentRoot "/var/www/mysite.com/"
       <Directory "/var/www/mysite.com/">
         AllowOverride All
         Order deny,allow
         Allow from all
         Require all granted
       </Directory>
     </VirtualHost>
     ```
     Nginx 服务器参考配置如下:
     
     ```nginx
     server {
         charset      utf-8;
         client_max_body_size  200M;
         listen       80;
     
         server_name  mysite.com;
         root         /var/www/mysite.com;
     
         location / {
             root  /var/www/mysite.com/frontend/web;
             try_files  $uri /frontend/web/index.php?$args;
     
             # avoiding processing of calls to non-existing static files by Yii
             location ~ \.(js|css|png|jpg|gif|swf|ico|pdf|mov|fla|zip|rar)$ {
                 access_log  off;
                 expires  360d;
                 try_files  $uri =404;
             }
         }
     
         location /admin {
             alias  /var/www/mysite.com/backend/web;
             rewrite  ^(/admin)/$ $1 permanent;
             try_files  $uri /backend/web/index.php?$args;
         }
     
         # avoiding processing of calls to non-existing static files by Yii
         location ~ ^/admin/(.+\.(js|css|png|jpg|gif|swf|ico|pdf|mov|fla|zip|rar))$ {
             access_log  off;
             expires  360d;
     
             rewrite  ^/admin/(.+)$ /backend/web/$1 break;
             rewrite  ^/admin/(.+)/(.+)$ /backend/web/$1/$2 break;
             try_files  $uri =404;
         }
     
         location ~ \.php$ {
             include  fastcgi_params;
             # check your /etc/php5/fpm/pool.d/www.conf to see if PHP-FPM is listening on a socket or port
             fastcgi_pass  unix:/var/run/php5-fpm.sock; ## listen for socket
             #fastcgi_pass  127.0.0.1:9000; ## listen for port
             fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;
             try_files  $uri =404;
         }
         #error_page  404 /404.html;
     
         location = /requirements.php {
             deny all;
         }
     
         location ~ \.(ht|svn|git) {
             deny all;
         }
     }
     ```
    
       
  4. 创建一个新数据库，调整`components['db']`配置在`common/config/main-local.php`.
  

##数据库
提供两种方式创建数据库。

1.（推荐）使用migrate迁移数据表，命令如下：

```
yii migrate 
yii migrate --migrationPath=backend/migrations/
```
或者

2.直接导入SQL文件 /backend/models/db.sql 。


##基本功能
1. 用户网站注册
2. 用户通过自定义表单字段生成表单
3. 用户能方便的引用表单连接来使用自定义表单，用来收集其客户的信息。
4. 用户登录网站，可查看自己创建的表单及数据。
5. 用户能轻松的导出数据。
6. 表单创建时可以预览效果。高级版本支持！
7. 应增加表单页面头部图片展示或轮播。高级版本支持！
8. 表单页底部增加企业名称，口号等信息。高级版本支持！
9. 内置典型行业模板表单，一键选用。高级版本支持！
10. 表单提交成功后的结束页面。
11. 前端首页再设计.https://github.com/alvarotrigo/fullPage.js
（全屏滚动插件演示：http://www.dowebok.com/demo/2014/77/）
12. 增加手机预览功能，二维码。
13. 后续将支持收集数据的类型：单选、多选、图片

##屏幕截图

![demo1](http://www.yiichina.com/uploads/images/201707/01143106668.png)

![demo2](https://git.oschina.net/uploads/images/2017/0701/143359_bcbaed34_537766.png)

![demo3](https://git.oschina.net/uploads/images/2017/0701/143423_87671e38_537766.png)

![demo4](https://git.oschina.net/uploads/images/2017/0701/143455_36ba1f78_537766.png)

![demo5](https://git.oschina.net/uploads/images/2017/0701/143514_fb23706c_537766.png)

