# 查看系统类型
cat /proc/version

# 查看进程的启动命令
function start_cmd(){
	cat /proc/$1/cmdline | tr '\000' ' '
	echo ""
}

# 查看进程的启动目录
function cwd(){
	ls -al /proc/$1/cwd
}

# 递归搜索指定类型的文件
find . -name "*.py" | xargs grep -rn --color=auto "ua_info_list"

# hive加载hadoop文件
hive -e "load data inpath '{0}' overwrite into table {1} partition (dt={2});"

# hive加载本地文件
hive -e "load data local inpath '{0}' overwrite into table {1} partition (dt={2});"

# 查看端口占用
netstat -natp | grep :21
netstat -an|grep 2181

# 查看磁盘余量
df -hl

# 查看第一级子目录占用磁盘的大小
du -h --max-depth=1

# watch查看管道命令
watch -n 0.2 'cmd'

# watch同时监控多条命令
watch -n 0.2 'cmd1; cmd2'

# 生成文件md5值
md5sum sour_file > dist_file

# 统计空行数量
grep -e "^$" file_name | wc -l

# find命令集合
find / -size +1M -a -type f  # 查找所有大于1M的文件

# ubuntu下提升用户为sudo组
usermod -aG sudo liaochangzeng

# 在远程机器上开启端口作为反向隧道入口
ssh -p 22 -qngfNTR 6766:127.0.0.1:22 usera@a.site

# 在远程机器上登录反向入口
ssh -p 6766 userb@127.0.0.1

# 随机打乱文件
shuf input_file -o output_file

# top命令详解
VIRT：virtual memory usage(虚拟内存)
    1、进程“需要的”虚拟内存大小，包括进程使用的库、代码、数据等 
    2、假如进程申请100m的内存，但实际只使用了10m，那么它会增长100m，而不是实际的使用量 
RES：resident memory usage(常驻内存) 
    1、进程当前使用的内存大小，但不包括swap out 
    2、包含其他进程的共享 
    3、如果申请100m的内存，实际使用10m，它只增长10m，与VIRT相反 
    4、关于库占用内存的情况，它只统计加载的库文件所占内存大小 
SHR：shared memory(共享内存)
    1、除了自身进程的共享内存，也包括其他进程的共享内存 
    2、虽然进程只使用了几个共享库的函数，但它包含了整个共享库的大小 
    3、计算某个进程所占的物理内存大小公式：RES – SHR 
    4、swap out后，它将会降下来 
DATA(数据)
    1、数据占用的内存。如果top没有显示，按f键可以显示出来。 
    2、真正的该程序要求的数据空间，是真正在运行中要使用的。
TIME/TIME+(时间)
	1、进程占用CPU时间(分钟:秒.毫秒),257:14.655代表257分钟14秒655毫秒