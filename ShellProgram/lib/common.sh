############################################################################### 
#  Dscription  : As Common Function Lib
#  Args        : None
#  Author      : Doctor Ferry
#  Date        : 2018-10-03
###############################################################################

## Discription : ouput log to file
## Parameters  : arg1 : debug messages
function print_to_file()
{
	local LOCAL_DEBUG_INFO=$1
	local LOCAL_LOG_FILE="${HOME}/.LOG/`basename $0`_log$$"
	
	local sec="date +'%Y-%m-%d %H:%M:%S'"
	local nas="date +%N | cut -c 1-3"
	# create log file
	mkdir -p "`dirname ${LOCAL_LOG_FILE}`"

	# write debug info to file
	if [ -e "${LOCAL_LOG_FILE}" ]; then
		echo "[`(eval "${sec}")`.`(eval "${nas}")`]: ${LOCAL_DEBUG_INFO}" >> "${LOCAL_LOG_FILE}"
	else
		echo "[`(eval "${sec}")`.`(eval "${nas}")`]: ${LOCAL_DEBUG_INFO}" > "${LOCAL_LOG_FILE}"
	fi
}

## Discription : Add debug info at the beginning of development,remove it at the end of development
## Parameters  : $@ all input parameters
function debug()
{
	# judge environment variable ${DEBUG} =? true
	if [ "${DEBUG}" = "true" ]; then
		$@
	fi
}
