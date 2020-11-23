
alias dwmr 'cd /home/srillia/mine/dwm && rm -rf config.h && sudo make install && rm -rf config.h *.o'

set GOHOME /home/srillia/go
set JAVA_HOME /home/srillia/App/jdk1.8.0_271
set PATH $PATH $GOHOME/bin $JAVA_HOME/bin

#定义 fzf的alias 使用vim打开查寻到的文件
function fz 
    set result (find ~ 2>/dev/null | fzf)
    if test -f "$result"
      vim $result
    else if test -d "$result"
      cd $result && ls
    end
end
