/**
 * @ProjectName : HarmonyInterviewDemo
 * @FileName : Logger.ets
 * @Date: 2025/3/11
 * @Author :  shaozj
 * @Description : 日志输出工具
 */
import hilog from '@ohos.hilog'

class Logger {
  private domain: number
  private tag: string

  constructor(domain: number, tag: string) {
    this.domain = domain
    this.tag = tag
  }

  info(format: string = '%{public}s', ...args: ESObject[]) {
    hilog.info(this.domain, this.tag, format, args)
  }

  debug(format: string = '%{public}s', ...args: ESObject[]) {
    hilog.debug(this.domain, this.tag, format, args)
  }

  warn(format: string = '%{public}s', ...args: ESObject[]) {
    hilog.warn(this.domain, this.tag, format, args)
  }

  error(format: string = '%{public}s', ...args: ESObject[]) {
    hilog.error(this.domain, this.tag, format, args)
  }

  fail(format: string = '%{public}s', ...args: ESObject[]) {
    hilog.fatal(this.domain, this.tag, format, args)
  }
}

export const logger = new Logger(0xFF00, 'interview_logger')