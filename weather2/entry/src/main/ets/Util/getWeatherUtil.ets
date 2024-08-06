import {WeatherModel} from  "../bean/WeatherModel"
import { http } from '@kit.NetworkKit'
import { TimelyWeatherModel } from '../bean/TimelyWeatherModel'


class getWeatherUtil {
  //发送一个url，返回对应的数据
  getWeather(cityCode: number) {
    return new Promise<WeatherModel>((resolve, reject) => {
      let request = http.createHttp()
      let url = `https://restapi.amap.com/v3/weather/weatherInfo?city=${cityCode}&key=bf5e57565d9c91c97d8d6db8cbe1c456&extensions=all`

      let result = request.request(url)

      result.then((res) => {
        if (res.responseCode === 200) {
          console.log(res.result.toString())
          resolve(JSON.parse(res.result.toString()))
        }
      }).catch((err: ESObject) => {
        console.log(err)
      })
    })
  }

  //直接发送多个url 结果一并返回
  async getWeathers(cityCodes: Array<number>) {
    let promise: Array<Promise<WeatherModel>> = []
    let weatherModels: Array<WeatherModel> = []
    for (let i = 0; i < cityCodes.length; i++) {
      promise.push(this.getWeather(cityCodes[i]))
    }

    await Promise.all(promise).then(result => {
      for (const element of result) {
        console.log(element.forecasts[0].city);

      }
      weatherModels = result
    })
    return weatherModels
  }

  getTimelyWeather(cityCode: number) {
    return new Promise<TimelyWeatherModel>((resolve, reject) => {
      let request = http.createHttp()
      let url = `https://restapi.amap.com/v3/weather/weatherInfo?city=${cityCode}&key=bf5e57565d9c91c97d8d6db8cbe1c456&extensions=base`
      let result = request.request(url)

      result.then((res) => {
        if (res.responseCode === 200) {
          console.log(res.result.toString())
          resolve(JSON.parse(res.result.toString()))
        }
      }).catch((err: ESObject) => {
        console.log(err)
      })
    })
  }

  async getTimelyWeathers(cityCodes: Array<number>) {
    let promise: Array<Promise<TimelyWeatherModel>> = []
    let Timelyweather: Array<TimelyWeatherModel> = []
    for (let i = 0; i < cityCodes.length; i++) {
      promise.push(this.getTimelyWeather(cityCodes[i]))
    }

    await Promise.all(promise).then(result => {
      for (const element of result) {
        console.log(element.lives[0].city);

      }
      Timelyweather = result
    })
    return Timelyweather
  }
}
let getweatherUtil = new getWeatherUtil()
export default getweatherUtil as getWeatherUtil