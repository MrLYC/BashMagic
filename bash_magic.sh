#!/bin/bash

var=$1

function print() {
    echo -en "\033[1;32;40m"
    echo -n "${BASH_LINENO}"
    echo -en "\033[0m"
    echo " $@"
}

# 重定向
## 重定向到命令标准输入
stdin=123
print ${stdin} | cat
cat <<< ${stdin}

## 多行输入
read input << EOF
hello
EOF
print ${input}

# 参数和变量
## 命令名
print $0

## 获取参数
print $1

## 参数个数
print $#

## 参数列表
print $*
print $@

## 上一个命令返回值
true; print $?

## 当前shell的PID
print $$

## 最近的后台任务PID
sleep 500 &
print $!

## 变量为空默认值
print ${var:-1000}

## 变量不为空默认值
print ${var:+1000}

## 默认初始值
print ${var:=1}

## 从下标1获取长度为2的子串
print ${var:1:2}

## 获取变量长度
print ${#var}

## 剔除从左开始第一个符合模式的字符串
path=$0
print ${path#*bash_magic.}

## 剔除从左开始最后一个符合模式的字符串
path=$0
print ${path##*.}

## 剔除从右开始第一个符合模式的字符串
path=$0
print ${path%bash_magic*}

## 剔除从右开始最后一个符合模式的字符串
path=$0
print ${path%%bash_magic*}

## 替换第一个符合模式的字符串
path=$0
print ${path/./`pwd`}

## 替换符合模式的字符串
path=`pwd`
print ${path//*\//}

## 首字母大写
title="this is a title"
print ${title^}

## 转成大写
text="text"
print ${textarea^^}

## 首字母小写
title="This is a title"
print ${title,}

## 转成小写
text="TEXT"
print ${text,,}

# 数组
## 声明一个数组
declare -a array

## 为数组赋值
array[0]=1
array[1]=2
array[2]=3

## 获得第一个元素
print ${array}
print ${array[0]}

## 获得所有元素
print ${array[*]}
print ${array[@]}

## 获得元素个数
print ${#array[*]}

## 获得所有元素索引
print ${!array[*]}
print ${!array[@]}

## 关联数组
## 声明一个关联数组
declare -A dict

## 为关联数组赋值
dict["name"]=Mary
dict["age"]=12

## 获得第一个元素
print ${dict}
print ${dict[0]}

## 获得所有元素
print ${dict[*]}
print ${dict[@]}

## 获得元素个数
print ${#dict[*]}

## 获得所有元素索引
print ${!dict[*]}
print ${!dict[@]}

# 运算
## 笛卡尔积
var=`echo {a,b,c}{1,2,3}`
print ${var}

## 整数四则运算
print $((1%2+3*4-5/6))
