function my$(id) {                     //定义my$函数根据id获取元素对象	
    return document.getElementById(id); //返回元素的id对象
}

function animate(element, target) {    //动画函数——任意一个元素移动到指定的目标位置	
    clearInterval(element.timeId);     //先清理定时器 避免开启多个定时器加速现象
    element.timeId = setInterval(function () {  //开启定时器		
        var current = element.offsetLeft;       //获取div的当前的位置		
        var step = 120;                         //div每次移动多少像素---步数		
        step = current < target ? step : -step; // 判断移动的方向		
        current += step;                        //每次移动后的距离		
        if (Math.abs(target - current) > Math.abs(step)) {   //判断当前移动后的位置是否到达目标位置			                                                 
            element.style.left = current + "px";             //达到目标
        } else {
            clearInterval(element.timeId);                 //清理定时器			
            element.style.left = target + "px";              //移动距离小于目标步数
        }
    }, 100);
}

//获取所需元素
var box = my$("box");                //最外边盒子元素
var screen = box.children[0];        //获取相框
var imgWidth = screen.offsetWidth; //获取相框的宽度
var ulObj = screen.children[0];    //获取移动元素ul
var list = ulObj.children;         //获取ul中的li元素
var olObj = screen.children[1];    //获取小圆点的容器元素ol
var arr = my$("arr");              //获取左右焦点
var pic = 0;                       //全局变量
for (var i = 0; i < list.length; i++) {         //创建小按钮----根据ul中的li个数	
    var liObj = document.createElement("li");   //创建li标签,加入到ol中	
    olObj.appendChild(liObj);                   // 把li元素追加到ol	
    liObj.setAttribute("index", i);             //在每个ol中的li标签上添加一个自定义属性,存储索引值	
    liObj.onmouseover = function () {           //注册鼠标进入事件		
        for (var j = 0; j < olObj.children.length; j++) {  //先干掉所有的ol中的li的背景颜色			
            olObj.children[j].removeAttribute("class");    //让li失去背景颜色
        }
        this.className = "current";                       //设置当前鼠标进来的li的背景颜色		
        pic = this.getAttribute("index");                 //获取鼠标进入的li的当前索引值
        animate(ulObj, -pic * imgWidth);                  //移动ul
    };
}
olObj.children[0].className = "current";       //设置当前按钮的样式
ulObj.appendChild(list[0].cloneNode(true));  //复制ul中的第一个子元素并且添加到ul的最后
var timeId = setInterval(clickHandle, 3000);    //让图片自动播放
box.onmouseover = function () {                //鼠标进入box 显示左右焦点div	
    arr.style.display = "block";               //显示左右焦点	
    clearTimeout(timeId);                    //鼠标进入后清理定时器
};
box.onmouseout = function () {                 //鼠标离开box 隐藏左右焦点div	
    arr.style.display = "none";                //隐藏左右焦点	
    timeId = setInterval(clickHandle, 3000);    //重新开始自动移动
};
my$("left").onclick = function () {            //左边按钮点击事件	
    if (pic == 0) {                              //判断变量pic为0的情况		
        pic = 5;                               //pic为0时直接变为5		
        ulObj.style.left = -pic * imgWidth + "px"; //设置ul的宽度
    }
    pic--;                                   //变量减去1	
    animate(ulObj, -pic * imgWidth);            //移动ul	
    for (var i = 0; i < olObj.children.length; i++) {   //设置小按钮的颜色---所有的小按钮干掉颜色		
        olObj.children[i].removeAttribute("class");     //所有的小按钮干掉颜色
    }
    olObj.children[pic].className = "current";          //当前的pic索引对应的按钮设置颜色
};
my$("right").onclick = clickHandle;                       //右边按钮点击事件
function clickHandle() {                                //定义点击函数         
    if (pic == list.length - 1) {                             //判断最后一张图片的情况		
        pic = 0;                                          //ul重新回到原点位置		
        ulObj.style.left = 0 + "px";                        //ul重新回到原点位置
    }
    pic++;                                              //右焦点递加	
    animate(ulObj, -pic * imgWidth);                       //移动ul	
    if (pic == list.length - 1) {                             //同步ol中的li		
        olObj.children[olObj.children.length - 1].className = ""; //当图片移动到最后一张时应该清除ol中第5个元素样式		
        olObj.children[0].className = "current";                    //设置第一个li小圆点当前样式
    } else {
        for (var i = 0; i < olObj.children.length; i++) {                 //遍历所有小圆点   			
            olObj.children[i].removeAttribute("class");           //去掉其他小圆点样式
        }
        olObj.children[pic].className = "current";                  //设置第一个li小圆点当前样式
    }
}

