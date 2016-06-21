;
function initProgressRing(setting) {
    var initProgressRing = {};
    initProgressRing.all = 0;
    initProgressRing.startY = Math.PI;
    initProgressRing.endY1 = initProgressRing.startY + 2 * Math.PI;
    initProgressRing.endY2 = initProgressRing.startY - 2 * Math.PI;
    //调用开始函数
    if (setting.startFunction) {
        setting.startFunction();
    }
    //初始化默认值函数
    initProgressRing.initSet = function (set) {
        if (!set.counterclockwise) {
            set.counterclockwise = false;
        }
        if (!set.time) {
            set.time = 1000;
        }
        if (!set.width) {
            set.width = 10;
        }
        if (!set.backgroundColor) {
            set.color = "red";
        }
        if (!set.foregroundColor) {
            set.color = "blue";
        }
        if (!set.radius) {
            set.radius = 10;
        }
        return set;
    }
    //初始化默认值
    setting = initProgressRing.initSet(setting);
    //刷新函数
    initProgressRing.remainTime = function () {
        initProgressRing.all += setting.runFunction();
        initProgressRing.startY += 2 * Math.PI / 360 * setting.runFunction();
        initProgressRing.text = Math.round((initProgressRing.all / 360 * 10000) / 100) + "%";
        //判断结束
        if (initProgressRing.startY > initProgressRing.endY1 || initProgressRing.startY < initProgressRing.endY2) {
            initProgressRing.text = "100%";
            clearInterval(initProgressRing.run);
            if (setting.endFunction) {
                setting.endFunction();//调用结束函数
            }
        }
        initProgressRing.draw(setting.x, setting.y, setting.raduis, setting.width, setting.backgroundColor, setting.foregroundColor, setting.counterclockwise);

    }
    //初始化画布，调用刷新函数
    if (setting.id) {
        initProgressRing.canvas = document.getElementById(setting.id);
        console.log(setting.id);
        initProgressRing.context = initProgressRing.canvas.getContext("2d");
        initProgressRing.run = setInterval(initProgressRing.remainTime, setting.time);//1000为1秒钟
    } else {
        alert("初始化错误，没有id");
    }
    //画进度条
    initProgressRing.draw = function draw(x, y, raduis, width, backgroundColor, foregroundColor, counterclockwise) {
        //清除内容
        initProgressRing.context.clearRect(0, 0, canvas.width, canvas.height);
        initProgressRing.context.lineWidth = width;
        initProgressRing.context.beginPath();
        initProgressRing.context.strokeStyle = backgroundColor;
        initProgressRing.context.arc(x, y, raduis, 0, 2 * Math.PI, false);
        initProgressRing.context.stroke();
        initProgressRing.context.beginPath();
        initProgressRing.context.strokeStyle = foregroundColor;
        initProgressRing.context.arc(x, y, raduis, Math.PI, initProgressRing.startY, counterclockwise);
        initProgressRing.context.stroke();
        if (setting.showText) {
            console.log(initProgressRing.text);
            initProgressRing.context.fillText(initProgressRing.text, x - 7, y + 5, 40);
        }
    }
}