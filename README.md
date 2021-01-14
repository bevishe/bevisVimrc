#bevisVimrc

基本功能：

* 1.设置图形化界面中文（否则，后面设置utf-8的时候图像化界面会出现乱码）

	* ```properties
		set nocompatible
		let $LANG = 'en'  "set message language 
		set langmenu=en   "set menu's language of gvim. no spaces beside '=' 
		```

* 2.设置注释的快捷键（ci 注释,cu取消注释）

	* ```pro
		    :vnoremap ci :s/^/\/\/<cr>
		    :vnoremap cu :s/\/\//<cr>
		    :nnoremap ci :s/^/\/\/<cr>
		    :nnoremap cu :s/\/\//<cr>
		```

* 3.设置语法高亮和主题高亮

	* ```
		" 高亮
		syntax on
		" 主题高亮
		colorscheme desert
		```

* 4.禁止生成备份文件和swap交换文件

	* ```
		set nobackup
		set noswapfile
		```

* 5.设置utf-8编码，否则在使用后面任务管理器插件的时候会出现字符乱码

	* ```
		set nobackup
		set noswapfile
		```

* 6.设置tab键为4个空格

	* ```
		set ts=4
		set expandtab
		```

* 7.可以用系统里面的粘贴和vim里面的复制粘贴共享

	* ```
		set clipboard=unnamed
		```

* 8.显示行号

	* ```
		set nu
		```

		

* 9.在vim编辑页面显示十字光标

* 10.设置字体和字体大小