import {DailyWeather} from '../bean/DailyWeather/DailyWeather'
import {daily} from '../bean/DailyWeather/daily'
import getweatherUtil from '../Util/getWeatherUtil'

@Component
export struct NewFutureDailyWeather {

  private locationId: string = '101010100'

  @State FutureWeather: DailyWeather = new DailyWeather()
  @State FutureWeatherData: Array<daily> = []

  @State tempMax : number[] = []
  @State tempMin : number[] = []
  @State weatherDates : string[] = []
  @State weatherConditions : string[] = []

  // 定义左右边距
  sideMargin: number = 40; // 根据需要调整
  //使用RenderingContext在Canvas组件上进行绘制，绘制对象可以是矩形、文本、图片等。
  settings: RenderingContextSettings = new RenderingContextSettings(true);   //settings配置，这个ture为启用alpha通道
  context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);   //创建CanvasRenderingContext2D对象
  // canvasHeight：表示曲线图高度，itemWidth：表示每两天的温度点之间的距离。
  canvasHeight: number = 200;
  itemWidth: number = 80;


  aboutToAppear(): void {
    this.initDate()
  }

  //初始化方法
  async initDate() {

    let result1: DailyWeather = await getweatherUtil.getDailyWeather_1(this.locationId)
    this.FutureWeather = result1
    this.FutureWeatherData = result1.daily
    console.log("Date_test"+this.FutureWeatherData[0].fxDate)

    let i:number
    for( i=0; i<this.FutureWeatherData.length ; i++){
      this.tempMax[i] = Number(this.FutureWeatherData[i].tempMax)
      this.tempMin[i] = Number(this.FutureWeatherData[i].tempMin)
      this.weatherDates[i] = this.DateChange(this.FutureWeatherData[i].fxDate)
      this.weatherConditions[i] = this.FutureWeatherData[i].textDay
    }


  }


  weatherUrl(weather: string) {

    if (weather === '晴') {
      return "resources/base/media/tianqi_qing.png"

    }

    else if (weather === '阴') {
      return "resources/base/media/tianqi_yintian.png"

    }

    else if (weather === '多云') {
      return "resources/base/media/tianqi_duoyun.png"

    }

    else if (weather.includes("雨")) {
      return "resources/base/media/tianqi_zhongyu.png"

    }
    else return "error"

  }

  formatDate(date: Date): string {
    // 获取年、月、日等部分
    let year = date.getFullYear();
    let month = (date.getMonth() + 1).toString().padStart(2, '0');
    let day = date.getDate().toString().padStart(2, '0');

    // 组合成所需的日期格式
    return `${month}/${day}`;
  }

  DateChange(dates:string):string{
    //i 假设的时间字符串
    let dateString: string = dates

    // 使用Date对象解析时间字符串
    let date = new Date(dateString);

    // 创建一个格式化日期时间的函数


    // 调用函数并打印结果
    let formattedTime:string = this.formatDate(date);
    return formattedTime  // 输出: 下午10点00分
  }

  build(){
     Column(){
       Row(){
         Column(){
           Text("多日预报")
             .textAlign(TextAlign.Start)
             .fontSize(15)
             .fontColor(Color.White)
             .opacity(0.5)
             .width("100%")
             .margin({top:20,left:30})

           Blank()

           Scroll(){
             Canvas(this.context)
               .width(this.tempMax.length * this.itemWidth + this.itemWidth + this.sideMargin * 2)
               .height("80%")
               .onReady(()=>{
                 //找出高温曲线的最大值和低温曲线的最小值
                 const maxTemp: number = Math.max(...this.tempMax)
                 const minTemp: number = Math.max(...this.tempMin)
                 //每改变一度，曲线变化幅度
                 const step: number = this.canvasHeight*0.4/(maxTemp - minTemp)
                 const curveChartMargin: number = this.canvasHeight * 0.09

                 //设置线条配置
                 this.context.lineWidth = 2
                 this.context.font = '13vp sans-serif'
                 this.context.fillStyle = '#ffffff'
                 this.context.strokeStyle = '#ffffff'
                 this.context.globalAlpha = 1
                 this.context.textAlign = 'start'

                 //设置x坐标
                 let xPos: number[] = []
                 let tempMaxPos: number[] = []
                 let tempMinPos: number[] = []

                 for(let i: number = 0;i<this.tempMax.length;i++){
                   //确定高低温温度点的坐标
                   let x: number = this.sideMargin + (i * this.itemWidth)
                   let yHeight: number = this.canvasHeight - (curveChartMargin + (this.tempMax [i] - minTemp) * step)+20
                   let yLow: number = this.canvasHeight - (curveChartMargin + (this.tempMin[i] - minTemp) * step)

                   //存放数据
                   xPos.push(x)
                   tempMaxPos.push(yHeight)
                   tempMinPos.push(yLow)

                   //画出每个结点
                   this.context.fillStyle = "white"
                   let region: Path2D = new Path2D()
                   region.ellipse(x, yHeight, 4, 4, 0, 0, Math.PI * 2)
                   region.ellipse(x, yLow, 4, 4, 0, 0, Math.PI * 2)
                   this.context.fill(region)

                   //绘制日期
                   this.context.fillStyle = "rgba(255,255,255,0.5)"
                   this.context.font = '60px Arial'
                   let dateStr: string = this.weatherDates[i]
                   this.context.fillText(dateStr,x - this.context.measureText(dateStr).width / 2,20)

                   //绘制天气图标
                   let iconUrl: string = this.weatherUrl(this.weatherConditions[i])
                   let imgIcon = new ImageBitmap(iconUrl)
                   this.context.drawImage(imgIcon, x - this.context.measureText(dateStr).width/2+10,30,30,35)

                   //绘制天气状态
                   let highConditionStr: string = this.weatherConditions[i]
                   this.context.fillText(highConditionStr, x-this.context.measureText(highConditionStr).width/2,90)

                   //绘制高温低温的文字
                   this.context.fillStyle = "white"
                   let maxTemperatureStr: string = `${this.tempMax[i]}℃`
                   let minTemperatureStr: string = `${this.tempMin[i]}℃`
                   this.context.fillText(maxTemperatureStr, x-this.context.measureText(maxTemperatureStr).width/2,yHeight-8)
                   this.context.fillText(minTemperatureStr, x-this.context.measureText(minTemperatureStr).width/2,yLow+25)

                 }

                 //绘制高温曲线
                 this.context.beginPath()
                 this.context.moveTo(xPos[0],tempMaxPos[0])
                 for(let i: number=1;i<xPos.length;i++){
                   let x0: number = xPos[i-1]
                   let y0: number = tempMaxPos[i-1]
                   //绘制一条三次贝塞尔曲线
                   this.context.bezierCurveTo(x0+(xPos[i]-x0)*0.3,y0,xPos[i]-(xPos[i]-x0)*0.3,tempMaxPos[i],xPos[i],tempMaxPos[i])
                 }
                 this.context.stroke()    //调用stroke方法来实际绘制出路径

                 //绘制低温曲线
                 this.context.beginPath()
                 this.context.moveTo(xPos[0],tempMinPos[0])
                 for(let i: number=1;i<xPos.length;i++){
                   let x0: number = xPos[i-1]
                   let y0: number = tempMinPos[i-1]
                   this.context.bezierCurveTo(x0+(xPos[i]-x0)*0.3,y0,xPos[i]-(xPos[i]-x0)*0.3,tempMinPos[i] ,xPos[i],tempMinPos[i])
                 }
                 this.context.stroke()
               })
           }
           .scrollable(ScrollDirection.Horizontal)
           .scrollBar(BarState.Off)
         }
         .width("95%")
         .height("45%")
         .backgroundColor('rgba(255, 255, 255, 0.1)')
         .borderRadius(20)
         .margin({top:20})
       }
     }
  }
}