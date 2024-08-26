import { http } from '@kit.NetworkKit'
import {DailyWeather} from '../bean/DailyWeather/DailyWeather'
import {TimelyWeather} from '../bean/TimelyWeather/TimelyWeather'
import {TimelyAir} from  '../bean/TimelyAir/TimelyAir'
import {HourlyWeather} from  '../bean/HourlyWeather/HourlyWeather'
import {WeatherPoint} from '../bean/WeatherPoint/WeatherPoint'

export class getWeatherUtil{

  //获取实时天气
  getTimelyWeather()
  {
    return new Promise<TimelyWeather>((resolve, reject) => {

      let request = http.createHttp()

      request.request(`https://devapi.qweather.com/v7/weather/now?location=101010100&key=16d8d9c11a9848d1be949b4f440c3611&gzip=n`,
        {
          method: http.RequestMethod.GET
        }
      )
        .then(res => {
          if (res.responseCode === 200) {
            console.log('testTag1', res.result)
            resolve(JSON.parse(res.result.toString()))
          } else {
            console.log('查询失败1,', JSON.stringify(res.result))
            reject('失败1')
          }
        })
        .catch((err: Error) => {
          console.log('查询失败2,', JSON.stringify(err))
          reject('失败2')
        })
    })
  }

  //获取单个城市实时天气
  async getTimelyWeather_1(): Promise<TimelyWeather>{

    const weatherModel = await this.getTimelyWeather()
    console.log(weatherModel.code)
    return weatherModel

  }

  //获取未来七天天气
  getDailyWeather()
  {
    return new Promise<DailyWeather>((resolve, reject) => {

      let request = http.createHttp()

      request.request(`https://devapi.qweather.com/v7/weather/7d?location=101010100&key=16d8d9c11a9848d1be949b4f440c3611&gzip=n`,
        {
          method: http.RequestMethod.GET
        }
      )
        .then(res => {
          if (res.responseCode === 200) {
            console.log('testTag1', res.result)
            resolve(JSON.parse(res.result.toString()))
          } else {
            console.log('查询失败1,', JSON.stringify(res.result))
            reject('失败1')
          }
        })
        .catch((err: Error) => {
          console.log('查询失败2,', JSON.stringify(err))
          reject('失败2')
        })
    })
  }

  //获取单个城市未来七天天气
  async getDailyWeather_1(): Promise<DailyWeather>{

    const weatherModel = await this.getDailyWeather()
    console.log(weatherModel.code)
    return weatherModel

  }

  //获取实时空气质量
  getTimelyAir()
  {
    return new Promise<TimelyAir>((resolve, reject) => {

      let request = http.createHttp()

      request.request(`https://devapi.qweather.com/v7/air/now?location=101010100&key=16d8d9c11a9848d1be949b4f440c3611&gzip=n`,
        {
          method: http.RequestMethod.GET
        }
      )
        .then(res => {
          if (res.responseCode === 200) {
            console.log('testTag1', res.result)
            resolve(JSON.parse(res.result.toString()))
          } else {
            console.log('查询失败1,', JSON.stringify(res.result))
            reject('失败1')
          }
        })
        .catch((err: Error) => {
          console.log('查询失败2,', JSON.stringify(err))
          reject('失败2')
        })
    })
  }

  //获取单个城市实时空气质量
  async getTimelyAir_1(): Promise<TimelyAir>{

    const weatherModel = await this.getTimelyAir()
    console.log(weatherModel.code)
    return weatherModel

  }

  //获取未来24小时天气
  getHourlyWeather()
  {
    return new Promise<HourlyWeather>((resolve, reject) => {

      let request = http.createHttp()

      request.request(`https://devapi.qweather.com/v7/weather/24h?location=101010100&key=16d8d9c11a9848d1be949b4f440c3611&gzip=n`,
        {
          method: http.RequestMethod.GET
        }
      )
        .then(res => {
          if (res.responseCode === 200) {
            console.log('testTag1', res.result)
            resolve(JSON.parse(res.result.toString()))
          } else {
            console.log('查询失败1,', JSON.stringify(res.result))
            reject('失败1')
          }
        })
        .catch((err: Error) => {
          console.log('查询失败2,', JSON.stringify(err))
          reject('失败2')
        })
    })
  }

  //获取单个城市未来24小时天气
  async getHourlyWeather_1(): Promise<HourlyWeather>{

    const weatherModel = await this.getHourlyWeather()
    console.log(weatherModel.code)
    return weatherModel

  }


//获取全部天气指数
getWeatherPoint()
{
  return new Promise<WeatherPoint>((resolve, reject) => {

    let request = http.createHttp()

    request.request(`https://devapi.qweather.com/v7/indices/1d?type=0&location=101010100&key=16d8d9c11a9848d1be949b4f440c3611&gzip=n`,
      {
        method: http.RequestMethod.GET
      }
    )
      .then(res => {
        if (res.responseCode === 200) {
          console.log('testTag1', res.result)
          resolve(JSON.parse(res.result.toString()))
        } else {
          console.log('查询失败1,', JSON.stringify(res.result))
          reject('失败1')
        }
      })
      .catch((err: Error) => {
        console.log('查询失败2,', JSON.stringify(err))
        reject('失败2')
      })
  })
}

//获取单个城市未来24小时天气
async getWeatherPoint_1(): Promise<WeatherPoint>{

  const weatherModel = await this.getWeatherPoint()
  console.log(weatherModel.code)
  return weatherModel

}
}


let getweatherUtil = new getWeatherUtil()
export default getweatherUtil as getWeatherUtil
