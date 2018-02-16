#! /bin/ksh
#-----------
# . /usr/local/bin/oraenv
who am i
xuseri=`whoami`
num=1
for x in `ls -t`
  do
    if [ $num -gt 4 ]; then
    continue
    fi
    lc1=`echo $x | cut -c2-`
    lc2=`echo $x | tr '[a-z]' '[A-Z]'`
    lc3=`echo $lc2 | cut -c1`
    #!echo $lc3$lc1
    namef=`echo $x | sed '$s/....$//'`1.log
    echo Attaching $namef...
    awk 'sub("$","\r")' $x > $namef
    NAME[$num]=$namef
    num=`expr $num + 1`
done
> out.mail
for x in ${NAME[*]}
do
  uuencode $x $x >> out.mail
done
echo
#!mail $xuseri@att.com < out.mail
mailx -m -r $xuseri@viper.sbms.sbc.com -s "No Changes List" $xuseri@att.com < out.mail
rm -f out.mail
echo "Email sent."
