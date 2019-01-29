-- MySQL dump 10.13  Distrib 8.0.12, for el7 (x86_64)
--
-- Host: 127.0.0.1    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article_tags`
--

DROP TABLE IF EXISTS `article_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `article_tags` (
  `article_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  KEY `article_tags_article_id_index` (`article_id`),
  KEY `article_tags_tag_id_index` (`tag_id`),
  CONSTRAINT `article_tags_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `article_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_tags`
--

LOCK TABLES `article_tags` WRITE;
/*!40000 ALTER TABLE `article_tags` DISABLE KEYS */;
INSERT INTO `article_tags` VALUES (1,3),(1,4),(2,5),(2,6),(2,1);
/*!40000 ALTER TABLE `article_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '文章标题',
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'keywords',
  `desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `content` longtext COLLATE utf8_unicode_ci COMMENT '文章内容,markdown格式',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章编写人,对应users表',
  `cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章分类',
  `comment_count` int(11) NOT NULL DEFAULT '0' COMMENT '评论数量',
  `read_count` int(11) NOT NULL DEFAULT '0' COMMENT '阅读数量',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '文章状态：0-公开;1-私密',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `html_content` longtext COLLATE utf8_unicode_ci COMMENT '文章内容,html格式',
  PRIMARY KEY (`id`),
  KEY `articles_cate_id_index` (`cate_id`),
  KEY `articles_user_id_index` (`user_id`),
  KEY `articles_title_index` (`title`),
  KEY `articles_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'vue学习摘要-模板语法/计算属性和监听器','vue 计算属性 监听器 computed watch vue语法','记录学习vue前端框架知识点以至后续回来梳理','#### 指令\r\n##### 指令语法\r\n例子：v-bind:href=\'\'\r\n其中v-开头为vue的指令，href为指令的参数\r\n##### 指令的缩写\r\nv-bind  缩写后为 :\r\nv-on    缩写后为 @\r\n##### 特殊记录的指令\r\nv-once	拥有该属性的节点只在该节点的vue对象实例时绑定数据 后续vue对象数据改变后该节点属性不会改变\r\nv-html=\"<span style=\'color:red\'></span>\"	将数据按照html格式渲染\r\n\r\n------------\r\n\r\n#### 计算属性和监听器\r\n##### 计算属性 computed\r\n计算属性相当于一个函数，在html中使用的时候和使用vue的数据方式相同\r\n计算属性会缓存计算后的数值，如果依赖属性没有发生变化每次调用会直接提取缓存数据不进行计算\r\n##### 侦听器\r\n侦听器函数名称与它对应的变量名称相同，当其对应的变量发生变化是即可触发该侦听器函数执行\r\n\r\n##### 其他\r\n_.debounce(函数名称, 毫秒数)\r\n该函数是控制在指定毫秒数内调用多次该代码只执行一次函数内函数名称对应的函数\r\n\r\n------------\r\n\r\n相关连接\r\n[计算属性和侦听器-vue.js](https://cn.vuejs.org/v2/guide/computed.html \"计算属性和侦听器-vue.js\")',1,3,0,12,0,0,'2018-08-25 03:08:50','2018-08-25 11:25:00','<h4 id=\"h4-u6307u4EE4\"><a name=\"指令\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>指令</h4><h5 id=\"h5-u6307u4EE4u8BEDu6CD5\"><a name=\"指令语法\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>指令语法</h5><p>例子：v-bind:href=’’<br>其中v-开头为vue的指令，href为指令的参数</p>\r\n<h5 id=\"h5-u6307u4EE4u7684u7F29u5199\"><a name=\"指令的缩写\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>指令的缩写</h5><p>v-bind  缩写后为 :<br>v-on    缩写后为 @</p>\r\n<h5 id=\"h5-u7279u6B8Au8BB0u5F55u7684u6307u4EE4\"><a name=\"特殊记录的指令\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>特殊记录的指令</h5><p>v-once    拥有该属性的节点只在该节点的vue对象实例时绑定数据 后续vue对象数据改变后该节点属性不会改变<br>v-html=”&lt;span style=\'color:red\'&gt;&lt;/span&gt;“    将数据按照html格式渲染</p>\r\n<hr>\r\n<h4 id=\"h4-u8BA1u7B97u5C5Eu6027u548Cu76D1u542Cu5668\"><a name=\"计算属性和监听器\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>计算属性和监听器</h4><h5 id=\"h5--computed\"><a name=\"计算属性 computed\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>计算属性 computed</h5><p>计算属性相当于一个函数，在html中使用的时候和使用vue的数据方式相同<br>计算属性会缓存计算后的数值，如果依赖属性没有发生变化每次调用会直接提取缓存数据不进行计算</p>\r\n<h5 id=\"h5-u4FA6u542Cu5668\"><a name=\"侦听器\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>侦听器</h5><p>侦听器函数名称与它对应的变量名称相同，当其对应的变量发生变化是即可触发该侦听器函数执行</p>\r\n<h5 id=\"h5-u5176u4ED6\"><a name=\"其他\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>其他</h5><p>_.debounce(函数名称, 毫秒数)<br>该函数是控制在指定毫秒数内调用多次该代码只执行一次函数内函数名称对应的函数</p>\r\n<hr>\r\n<p>相关连接<br><a href=\"https://cn.vuejs.org/v2/guide/computed.html\" title=\"计算属性和侦听器-vue.js\">计算属性和侦听器-vue.js</a></p>\r\n'),(2,'laravel定时发送邮件备份sql','数据库备份,laravel发送邮件','定时备份blog数据库sql后用邮件发送','#### laravel下创建定视备份数据库脚本\r\n生成app/Console/Commands/BackupSql.php 用来备份数据库sql文件到指定文件夹\r\n```php\r\nphp aritsan make console BackupSql\r\n```\r\n在该文件中设置命令\r\n```php\r\nprotected $signature = \'backup:sql\';\r\n```\r\n在该文件下的handle方法中\r\n```php\r\npublic function handle()\r\n{\r\n	//从配置文件中获取数据库信息\r\n	$DB_HOST = getenv(\'DB_HOST\');\r\n	$DB_DATABASE = getenv(\'DB_DATABASE\');\r\n	$DB_USERNAME = getenv(\'DB_USERNAME\');\r\n	$DB_PASSWORD = getenv(\'DB_PASSWORD\');\r\n	$backupDir = \'/data/backup/blogSqls/\';\r\n\r\n	$dumpfname = $backupDir.$DB_DATABASE . \"_\" . date(\"Y-m-d\").\".sql\";\r\n	$command = \"mysqldump --host=$DB_HOST --user=$DB_USERNAME \";\r\n	if ($DB_PASSWORD) $command.= \"--password=\". $DB_PASSWORD .\" \";\r\n	$command.= $DB_DATABASE;\r\n	$command.= \" > \" . $dumpfname;\r\n	system($command);\r\n}\r\n```\r\n\r\n在app/Console/Kernel.php中注册这个类\r\n```php\r\nprotected $commands = [\r\n        // Commands\\Inspire::class,\r\n        BackupSql::class\r\n];\r\n```\r\ncrontab -e 添加定时执行器',1,5,0,3,0,0,'2018-08-26 03:57:09','2018-08-26 04:44:00','<h4 id=\"h4-laravel-\"><a name=\"laravel下创建定视备份数据库脚本\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>laravel下创建定视备份数据库脚本</h4><p>生成app/Console/Commands/BackupSql.php 用来备份数据库sql文件到指定文件夹</p>\r\n<pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code class=\"lang-php\"><span class=\"pln\">php aritsan make console </span><span class=\"typ\">BackupSql</span></code></li></ol></pre>\r\n<p>在该文件中设置命令</p>\r\n<pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code class=\"lang-php\"><span class=\"kwd\">protected</span><span class=\"pln\"> $signature </span><span class=\"pun\">=</span><span class=\"pln\"> </span><span class=\"str\">\'backup:sql\'</span><span class=\"pun\">;</span></code></li></ol></pre>\r\n<p>在该文件下的handle方法中</p>\r\n<pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code class=\"lang-php\"><span class=\"kwd\">public</span><span class=\"pln\"> </span><span class=\"kwd\">function</span><span class=\"pln\"> handle</span><span class=\"pun\">()</span></code></li><li class=\"L1\"><code class=\"lang-php\"><span class=\"pun\">{</span></code></li><li class=\"L2\"><code class=\"lang-php\"><span class=\"pln\">    </span><span class=\"com\">//从配置文件中获取数据库信息</span></code></li><li class=\"L3\"><code class=\"lang-php\"><span class=\"pln\">    $DB_HOST </span><span class=\"pun\">=</span><span class=\"pln\"> getenv</span><span class=\"pun\">(</span><span class=\"str\">\'DB_HOST\'</span><span class=\"pun\">);</span></code></li><li class=\"L4\"><code class=\"lang-php\"><span class=\"pln\">    $DB_DATABASE </span><span class=\"pun\">=</span><span class=\"pln\"> getenv</span><span class=\"pun\">(</span><span class=\"str\">\'DB_DATABASE\'</span><span class=\"pun\">);</span></code></li><li class=\"L5\"><code class=\"lang-php\"><span class=\"pln\">    $DB_USERNAME </span><span class=\"pun\">=</span><span class=\"pln\"> getenv</span><span class=\"pun\">(</span><span class=\"str\">\'DB_USERNAME\'</span><span class=\"pun\">);</span></code></li><li class=\"L6\"><code class=\"lang-php\"><span class=\"pln\">    $DB_PASSWORD </span><span class=\"pun\">=</span><span class=\"pln\"> getenv</span><span class=\"pun\">(</span><span class=\"str\">\'DB_PASSWORD\'</span><span class=\"pun\">);</span></code></li><li class=\"L7\"><code class=\"lang-php\"><span class=\"pln\">    $backupDir </span><span class=\"pun\">=</span><span class=\"pln\"> </span><span class=\"str\">\'/data/backup/blogSqls/\'</span><span class=\"pun\">;</span></code></li><li class=\"L8\"><code class=\"lang-php\"></code></li><li class=\"L9\"><code class=\"lang-php\"><span class=\"pln\">    $dumpfname </span><span class=\"pun\">=</span><span class=\"pln\"> $backupDir</span><span class=\"pun\">.</span><span class=\"pln\">$DB_DATABASE </span><span class=\"pun\">.</span><span class=\"pln\"> </span><span class=\"str\">\"_\"</span><span class=\"pln\"> </span><span class=\"pun\">.</span><span class=\"pln\"> date</span><span class=\"pun\">(</span><span class=\"str\">\"Y-m-d\"</span><span class=\"pun\">).</span><span class=\"str\">\".sql\"</span><span class=\"pun\">;</span></code></li><li class=\"L0\"><code class=\"lang-php\"><span class=\"pln\">    $command </span><span class=\"pun\">=</span><span class=\"pln\"> </span><span class=\"str\">\"mysqldump --host=$DB_HOST --user=$DB_USERNAME \"</span><span class=\"pun\">;</span></code></li><li class=\"L1\"><code class=\"lang-php\"><span class=\"pln\">    </span><span class=\"kwd\">if</span><span class=\"pln\"> </span><span class=\"pun\">(</span><span class=\"pln\">$DB_PASSWORD</span><span class=\"pun\">)</span><span class=\"pln\"> $command</span><span class=\"pun\">.=</span><span class=\"pln\"> </span><span class=\"str\">\"--password=\"</span><span class=\"pun\">.</span><span class=\"pln\"> $DB_PASSWORD </span><span class=\"pun\">.</span><span class=\"str\">\" \"</span><span class=\"pun\">;</span></code></li><li class=\"L2\"><code class=\"lang-php\"><span class=\"pln\">    $command</span><span class=\"pun\">.=</span><span class=\"pln\"> $DB_DATABASE</span><span class=\"pun\">;</span></code></li><li class=\"L3\"><code class=\"lang-php\"><span class=\"pln\">    $command</span><span class=\"pun\">.=</span><span class=\"pln\"> </span><span class=\"str\">\" &gt; \"</span><span class=\"pln\"> </span><span class=\"pun\">.</span><span class=\"pln\"> $dumpfname</span><span class=\"pun\">;</span></code></li><li class=\"L4\"><code class=\"lang-php\"><span class=\"pln\">    system</span><span class=\"pun\">(</span><span class=\"pln\">$command</span><span class=\"pun\">);</span></code></li><li class=\"L5\"><code class=\"lang-php\"><span class=\"pun\">}</span></code></li></ol></pre>\r\n<p>在app/Console/Kernel.php中注册这个类</p>\r\n<pre class=\"prettyprint linenums prettyprinted\" style=\"\"><ol class=\"linenums\"><li class=\"L0\"><code class=\"lang-php\"><span class=\"kwd\">protected</span><span class=\"pln\"> $commands </span><span class=\"pun\">=</span><span class=\"pln\"> </span><span class=\"pun\">[</span></code></li><li class=\"L1\"><code class=\"lang-php\"><span class=\"pln\">        </span><span class=\"com\">// Commands\\Inspire::class,</span></code></li><li class=\"L2\"><code class=\"lang-php\"><span class=\"pln\">        </span><span class=\"typ\">BackupSql</span><span class=\"pun\">::</span><span class=\"kwd\">class</span></code></li><li class=\"L3\"><code class=\"lang-php\"><span class=\"pun\">];</span></code></li></ol></pre>\r\n<p>crontab -e 添加定时执行器</p>\r\n');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_lft_index` (`lft`),
  KEY `categories_rgt_index` (`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,1,2,0,'日常流水账','2018-08-24 08:02:04','2018-08-25 02:40:22'),(2,NULL,3,6,0,'前端','2018-08-25 02:40:35','2018-08-25 02:40:43'),(3,2,4,5,1,'vue','2018-08-25 02:40:43','2018-08-25 02:40:43'),(4,NULL,7,10,0,'php','2018-08-26 04:35:19','2018-08-26 04:35:34'),(5,4,8,9,1,'laravel','2018-08-26 04:35:34','2018-08-26 04:35:34');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sequence` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1),('2016_07_25_130523_create_articles_table',1),('2016_07_25_143011_create_tags_table',1),('2016_07_30_064321_create_categories_table',1),('2016_08_14_123836_add_users_table',1),('2016_08_24_162228_add_tags_table',1),('2016_08_28_145612_create_article_tags_table',1),('2016_08_31_143604_create_links_table',1),('2016_09_03_051144_create_navigations_table',1),('2016_09_10_113755_create_systems_table',1),('2016_09_21_134642_add_html_content_to_articles_table',1),('2016_09_24_132253_create_pages_table',1),('2016_11_14_142731_change_valus_field_to_systems_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations`
--

DROP TABLE IF EXISTS `navigations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `navigations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-正常显示;1-隐藏',
  `sequence` smallint(6) NOT NULL COMMENT '排序',
  `nav_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '导航类型;0-自定义;1-分类导航',
  `article_cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章分类id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations`
--

LOCK TABLES `navigations` WRITE;
/*!40000 ALTER TABLE `navigations` DISABLE KEYS */;
/*!40000 ALTER TABLE `navigations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '页面标题',
  `link_alias` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接别名',
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'keywords',
  `desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `content` longtext COLLATE utf8_unicode_ci COMMENT '页面markdown格式',
  `html_content` longtext COLLATE utf8_unicode_ci COMMENT '页面html',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_link_alias_unique` (`link_alias`),
  KEY `pages_link_alias_index` (`link_alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systems`
--

DROP TABLE IF EXISTS `systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `systems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `systems_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systems`
--

LOCK TABLES `systems` WRITE;
/*!40000 ALTER TABLE `systems` DISABLE KEYS */;
INSERT INTO `systems` VALUES (1,'blog_name','YTY '),(2,'motto','好记性不如烂笔头'),(3,'title',''),(4,'seo_keyword',''),(5,'seo_desc',''),(6,'github_url',''),(7,'weibo_url',''),(8,'comment_plugin',''),(9,'disqus_short_name',''),(10,'duoshuo_short_name',''),(11,'icp',''),(12,'statistics_script','');
/*!40000 ALTER TABLE `systems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '标签名字',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_tag_name_unique` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'php','2018-08-24 07:57:55','2018-08-24 08:06:19'),(3,'前端','2018-08-25 03:08:50','2018-08-25 03:08:50'),(4,'vue','2018-08-25 03:08:50','2018-08-25 03:08:50'),(5,'laravel','2018-08-26 04:34:59','2018-08-26 04:34:59'),(6,'mysql','2018-08-26 04:36:29','2018-08-26 04:36:29');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_pic` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '博客用户头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'杨天宇','17600200818@163.com','$2y$10$JFTa2yO7D3CedEz/j7TnOOS.RycfmtZulc6P7E70eRNJFp1kNwUGS','VEPjpCxtMuUTMklcawRI1N31eY2l68smYIl5c1PwvQQX4USyFo0G4JEeaYK0',NULL,'2018-08-25 02:38:55','27971d3aab7cba2bef6c24694963df40.jpg');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-26 18:23:05
