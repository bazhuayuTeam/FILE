function initProgressBar(setting) {
    var initProgressBar = {};
    //调用开始函数
    if (setting.startFunction) {
        setting.startFunction();
    }
    //初始化默认值函数
    initProgressBar.initSet = function (set) {
        if (!set.time) {
            set.time = 1000;
        }
        if (!set.width) {
            set.width = 10;
        }
        if (!set.color) {
            set.color = "red";
        }
        if (!set.lineCap) {
            set.lineCap = "round";
        }
        return set;
    }
    //初始化默认值
    setting = initProgressBar.initSet(setting);
    //刷新函数
    initProgressBar.remainTime = function () {
        if (setting.runX1) {
            x1 = setting.runX1(x1);
            if (x1 >= endW) {
                x1 = endW;
            }
        }
        if (setting.runY1) {
            y1 = setting.runY1(y1);
            if (y1 >= endH) {
                y1 = endH;
            }
        }
        if (setting.runX2) {
            x2 = setting.runX2(x2);
            if (x2 >= endW) {
                x2 = endW;
            }
        }
        if (setting.runY2) {
            y2 = setting.runY2(y2);
            if (y2 >= endH) {
                y2 = endH;
            }

        }
        initProgressBar.draw(x1, y1, x2, y2, setting.width, setting.lineCap, setting.color);
        //判断结束
        if (y2 >= endH || y1 >= endH || x1 >= endW || x2 >= endW) {
            clearInterval(initProgressBar.run);
            if (setting.endFunction) {
                setting.endFunction();//调用结束函数
            }
        }
    }
    //初始化画布，调用刷新函数
    if (setting.id) {
        initProgressBar.canvas = document.getElementById(setting.id);
        console.log(setting.id);
        initProgressBar.context = initProgressBar.canvas.getContext("2d");
        initProgressBar.run = setInterval(initProgressBar.remainTime, setting.time);//1000为1秒钟
    } else {
        alert("初始化错误，没有id");
    }
    var x1 = setting.width / 2;//起始点的坐标x
    var y1 = setting.width / 2;//起始点的坐标y
    var x2 = setting.width / 2;//结束点的坐标x
    var y2 = setting.width / 2;//结束点的坐标y
    var endH = initProgressBar.canvas.height - setting.width;
    var endW = initProgressBar.canvas.width - setting.width;
   
    //画进度条
    initProgressBar.draw = function draw(x1, y1, x2, y2, width, lineCap, color) {
        //清除内容
        initProgressBar.context.clearRect(0, 0, canvas.width, canvas.height);
        initProgressBar.context.beginPath();
        initProgressBar.context.strokeStyle = color;
        initProgressBar.context.lineCap = lineCap;
        initProgressBar.context.moveTo(x1, y1);
        initProgressBar.context.lineWidth = width;
        initProgressBar.context.lineTo(x2, y2);
        initProgressBar.context.stroke();
    }
}