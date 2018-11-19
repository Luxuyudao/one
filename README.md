# 项目管理云平台
---

## 1. 项目介绍

![流程图](http://gatherlife.cn/images/pmcloud/s1.png)

项目管理云平台是专门针对项目需求方和服务方提供项目管理的服务平台。平台提供专业的项目顾问，对需求方的项目进行需求分析并提供解决方案。项目在顾问的监管下，由服务方执行，对项目进行跟踪监管，直到项目验收结束。

## 2. 功能介绍

![功能介绍](http://gatherlife.cn/images/pmcloud/s2.png)

## 3. 流程和用例

> 业务流程

![流程图](http://gatherlife.cn/images/pmcloud/l1.png)

> 角色用例

![角色用例图](http://gatherlife.cn/images/pmcloud/uc01.png)

## 4. 界面展示

> 雇主中心页面

雇主角色登录成功后首先进入“雇主中心”页面，雇主角色可以发布需求、查看发布项目详情、查看发布需求列表。

<a target="_blank" href="http://gatherlife.cn/images/pmcloud/employer_index.png"><img src="http://gatherlife.cn/images/pmcloud/employer_index.png"></a>

> 系统用户管理页面

管理员角色在“系统用户管理”页面，可以对系统用户权限进行编辑管理、禁用系统用户、删除系统用户和初始化密码等操作。

<a target="_blank" href="http://gatherlife.cn/images/pmcloud/houtat_yonghu.png"><img src="http://gatherlife.cn/images/pmcloud/houtat_yonghu.png"></a>

> 会员管理页面

客服角色在“会员管理”页面，可以对会员进行资质认证审核和查看会员基本信息。

<a target="_blank" href="http://gatherlife.cn/images/pmcloud/huiyuan.png"><img src="http://gatherlife.cn/images/pmcloud/huiyuan.png"></a>

> 加盟申请页面

会员在“用户中心”页面，点击“我要赚钱”操作按钮，进入这个页面：

<a target="_blank" href="http://gatherlife.cn/images/pmcloud/jiameng.png"><img src="http://gatherlife.cn/images/pmcloud/jiameng.png"></a>

会员在此页面可以向平台申请加盟成为服务商角色。

> 代发项目页面

运营角色在“代发项目”页面，点击页面中“新增雇主”按钮，看到这个弹窗后：

<a target="_blank" href="http://gatherlife.cn/images/pmcloud/xinzengguzhu.png"><img src="http://gatherlife.cn/images/pmcloud/xinzengguzhu.png"></a>

运营人员在此页面编辑雇主信息，从而进行帮助雇主代发需求的操作。 
 
> 账单列表页面

财务角色在“财务列表”页面，对会员账单进行提现审核、查看账单详情的操作。

<a target="_blank" href="http://gatherlife.cn/images/pmcloud/zhangadn.png"><img src="http://gatherlife.cn/images/pmcloud/zhangadn.png"></a>

## 5. 演示环境

> Host配置

	218.247.143.208		sso.demo1.com				#前端用户登录系统
	218.247.143.208		sso.boss.demo1.com			#系统用户登录系统
	218.247.143.208		employer.demo1.com			#雇主平台
	218.247.143.208		advisor.demo1.com			#专家平台
	218.247.143.208		provider.demo1.com			#服务商平台
	218.247.143.208		file.demo1.com				#文件系统
	218.247.143.208		user.demo1.com 				#用户中心
	218.247.143.208		manager.boss.demo1.com 		#系统后台

> 地址和账号

前台用户登录地址: <http://sso.demo1.com/platformlogin.jsp>

登录账号: 

| 角色 | 用户名/密码 |
| :--: | :--|
| 顾问 | 陈顾问/123456 |
| 雇主 | 陈雇主/123456 |
| 服务商 | 陈服务商/123456 |
	
后台用户登录地址:<http://sso.boss.demo1.com/systemlogin.jsp>

登录账号:

| 角色 | 用户名/密码 |
| :--: | :-- |
| 管理员 | 管理员/123456 |
| 客服 | 客服/123456 |
| 运营 | 运营/123456 |
| 财务 | 财务/123456 |

## 6. 系统架构

![系统架构](http://gatherlife.cn/images/pmcloud/02.png)

![系统架构](http://www.gatherlife.cn/images/laboratory/00.png)

## 7. 安装部署

![部署示例图](http://www.gatherlife.cn/images/laboratory/01.png)

### 7.1 数据库安装

**方式一：**使用Navicat for MySQL导入sql脚本，依次执行附件中的*0.建库.sql、1.tvr_db.sql*创建数据库环境。  
**方式二：**可参考[MySQL导入sql 文件的5大步骤](http://database.51cto.com/art/201005/200739.htm "MySQL导入sql 文件的5大步骤")导入附件中的sql脚本

然后修改`taovr-services\src\main\resources\tangyuan-configuration.xml`中的数据库连接和用户名密码。

### 7.2 Redis

redis是一种存储在内存中的数据库，以键值对的方式存储数据的。*(如何安装redis,再与服务器项目连接，可以另去redis官网学一下。）*本系统使用redis存储用户请求登录成功后的token信息，当前项目使用redis默认端口，127.0.0.1访问。  

**配置参考示例：**  

    JedisMode=BASIC
	Jedis.clientName=life_client
	Jedis.host=127.0.0.1
	
	Jedis.pool.maxTotal=8
	Jedis.pool.maxIdle=8
	Jedis.pool.minIdle=2
	
	Jedis.pool.testOnCreate=false
	Jedis.pool.testOnBorrow=false
	Jedis.pool.testOnReturn=false
	Jedis.pool.testWhileIdle=false
	
	Jedis.pool.maxWaitMillis=-1
	Jedis.pool.minEvictableIdleTimeMillis=1800000
	Jedis.pool.timeBetweenEvictionRunsMillis=-1
	Jedis.pool.numTestsPerEvictionRun=3

### 7.3 Host配置

	127.0.0.1		all.demo1.service			#系统服务
	127.0.0.1		sso.demo1.com				#前端用户登录系统
	127.0.0.1		sso.boss.demo1.com			#系统用户登录系统
	127.0.0.1		employer.demo1.com			#雇主平台
	127.0.0.1		advisor.demo1.com			#专家平台
	127.0.0.1		provider.demo1.com			#服务商平台
	127.0.0.1		file.demo1.com				#文件系统
	127.0.0.1		user.demo1.com 				#用户中心
	127.0.0.1		manager.boss.demo1.com 		#系统后台
	127.0.0.1		s1.demo1.redis				#redis
	127.0.0.1		writetvr.demo1.mysql		#数据库:写库
	127.0.0.1		readtvr.demo1.mysql			#数据库:读库

### 7.4 Tomcat配置

**部署流程**  

1. 创建目录 /webSite  
2. 拷贝项目到 /webSite目录下直接部署

**参考示例：**(*具体根据服务器情况配置*)

	<Host name="sso.demo1.com"  appBase="" unpackWARs="true" autoDeploy="true">		
		<Alias>sso.boss.demo1.com</Alias>
		<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"  prefix="sso-demo1." suffix=".log" timestamp="true"	pattern="%h %l %u %t &quot;%r&quot; %s %b" resolveHosts="false"/>
		<Context path="" docBase="D:\webSite\demo1-sso"  caseSensitive="false" debug="0"></Context>
	</Host>
	<Host name="employer.demo1.com"  appBase="" unpackWARs="true" autoDeploy="true">			
		<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"  prefix="employer-demo1." suffix=".log" timestamp="true"	pattern="%h %l %u %t &quot;%r&quot; %s %b" resolveHosts="false"/>
		<Context path="" docBase="D:\webSite\demo1-employer"  caseSensitive="false" debug="0"></Context>
	</Host>
	<Host name="advisor.demo1.com"  appBase="" unpackWARs="true" autoDeploy="true">			
		<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"  prefix="advisor-demo1." suffix=".log" timestamp="true"	pattern="%h %l %u %t &quot;%r&quot; %s %b" resolveHosts="false"/>
		<Context path="" docBase="D:\webSite\demo1-advisor"  caseSensitive="false" debug="0"></Context>
	</Host>
	<Host name="provider.demo1.com"  appBase="" unpackWARs="true" autoDeploy="true">			
		<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"  prefix="provider-demo1." suffix=".log" timestamp="true"	pattern="%h %l %u %t &quot;%r&quot; %s %b" resolveHosts="false"/>
		<Context path="" docBase="D:\webSite\demo1-provider"  caseSensitive="false" debug="0"></Context>
	</Host>
	<Host name="manager.boss.demo1.com"  appBase="" unpackWARs="true" autoDeploy="true">			
		<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"  prefix="demo1-boss-all." suffix=".log" timestamp="true"	pattern="%h %l %u %t &quot;%r&quot; %s %b" resolveHosts="false"/>
		<Context path="" docBase="D:\webSite\demo1-boss-all"  caseSensitive="false" debug="0"></Context>
	</Host>
	<Host name="file.demo1.com"  appBase="" unpackWARs="true" autoDeploy="true">			
		<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"  prefix="file-demo1." suffix=".log" timestamp="true"	pattern="%h %l %u %t &quot;%r&quot; %s %b" resolveHosts="false"/>
		<Context path="" docBase="D:\webSite\demo1-file"  caseSensitive="false" debug="0"></Context>
	</Host>
	<Host name="user.demo1.com"  appBase="" unpackWARs="true" autoDeploy="true">			
		<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"  prefix="user-demo1." suffix=".log" timestamp="true"	pattern="%h %l %u %t &quot;%r&quot; %s %b" resolveHosts="false"/>
		<Context path="" docBase="D:\webSite\demo1-user"  caseSensitive="false" debug="0"></Context>
	</Host>
	<Host name="all.demo1.service"  appBase="" unpackWARs="true" autoDeploy="true">			
		<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"  prefix="demo1-services." suffix=".log" timestamp="true"	pattern="%h %l %u %t &quot;%r&quot; %s %b" resolveHosts="false"/>
		<Context path="" docBase="D:\webSite\demo1-services"  caseSensitive="false" debug="0"></Context>
	</Host>

