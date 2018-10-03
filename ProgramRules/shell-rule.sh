#! /bin/bash                       
# 1> Sha-Bang特殊字符 后面跟着解释器

# 2> 上面留出一行空格
############################################################################### 3> 80个字符or 100个字符看个人喜好
#  Dscription  : How to standardize shell programming
#  Args        : None (arg1 -> ..   arg2->..)
#  Author      : Doctor Ferry
#  Date        : 2018-10-01
###############################################################################

# 4> print output messages in English
export LC_ALL=C

# 5> 定义error code
SUCCESS=0
ERROR_CD_FAILED=1
ERROR_MKDIR_FAILED=2
ERROR_INPUT_PARAMETR=3

# 6> 定义全局变量
GLOBAL_WORK_DIRECTORY=`pwd`

# 7> 定义函数
## Description : print "Welcome to ShellScript World!"
## Parameters  : arg1 : Only match "help"
function print_hello()
{
	local LOCAL_ARG1=$1 # 8>将输入参数转换成临时参数在函数中使用

	# 9> 变量定义和逻辑处理之间最好保留一个空行
	if [ $# -ge 1 ]; then
		if [ "x${LOCAL_ARG1}" = "xhelp" ]; then
			echo "No need Input Parameters!"
		else
			echo "ERROR : Input Parameters > 2!"
			exit ${ERROR_INPUT_PARAMETR}
		fi
	else
		echo "Welcome to ShellScript World!"
	fi
}


# 10> 定义一个main函数来控制工作流程，库函数脚本不使用
## Discription : main
## Parameters  : args : script input parameters
function main()
{
	cd "${GLOBAL_WORK_DIRECTORY}" || exit ${ERROR_CD_FAILED}
	print_hello $@
}

#start
main $@
