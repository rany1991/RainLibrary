using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class XTimerUtil
{
    public const float S2MS = 1000.0f;
    public const float MS2S = 0.001f;

    public static int GetMSTime()
    {
        int nTime = (int)(Time.realtimeSinceStartup * S2MS);
        return nTime;
    }

    /// <summary>
    /// 	Gets the current time by unix mode.
    /// </summary>
    /// <returns>The current time by unix.</returns>
    public static long GetCurrentSecondsByUnix()
    {
        return (DateTime.Now.ToUniversalTime().Ticks - 621355968000000000) / 10000000;
    }

    public static long GetUTCSecondsByUnix()
    {
        return (DateTime.UtcNow.Ticks - 621355968000000000) / 10000000;
    }

    public static long GetLocalSecondsByUnix()
    {
        return (DateTime.Now.Ticks - 621355968000000000) / 10000000;
    }

    /// <summary>
    /// 时间戳转为C#格式时间
    /// </summary>
    /// <param name="timeStamp">Unix时间戳格式</param>
    /// <returns>C#格式时间</returns>
    public static DateTime GetTimeTickFromUnixTick(string timeStamp)
    {
        DateTime dtStart = TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));
        if (string.IsNullOrEmpty(timeStamp))
        {
            return dtStart;
        }

        long lTime;
        if (long.TryParse(timeStamp + "0000000", out lTime))
        {
            TimeSpan toNow = new TimeSpan(lTime);

            return dtStart.Add(toNow);
        }
        else
        {
            return dtStart;
        }
    }

    public static DateTime GetTimeTickFromUnixTick(long timeSecneds)
    {
        DateTime dtStart = TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));
        return dtStart.AddSeconds(timeSecneds);
    }

    /// <summary>
    /// Gets the seconds by unix.
    /// </summary>
    /// <returns>The seconds by unix.</returns>
    /// <param name="_unixSeconds">_unix seconds.</param>
    public static long GetSecondsByUnix(long _unixSeconds)
    {
        DateTime datetime = new DateTime(_unixSeconds);
        return (datetime.ToUniversalTime().Ticks - 621355968000000000) / 10000000;
    }

    /// <summary>
    /// Gets the remain time.
    /// </summary>
    /// <returns>The remain time.</returns>
    /// <param name="currentSecond">Current second.</param>
    /// <param name="targetSecond">Target second.</param>
    public static TimeSpan GetRemainTime(long currentSecond, long targetSecond)
    {
        TimeSpan timespan1 = TimeSpan.FromSeconds(currentSecond);
        TimeSpan timespan2 = TimeSpan.FromSeconds(targetSecond);
        TimeSpan remainTimeSpan = timespan2 - timespan1;

        return remainTimeSpan;
    }

    /// <summary>
    /// Formats to "hh:mm:ss"
    /// </summary>
    /// <returns>The HM.</returns>
    /// <param name="_hour">_hour.</param>
    /// <param name="_minute">_minute.</param>
    /// <param name="second">Second.</param>
    public static string FormatHMS(int _hour, int _minute, int _second)
    {
        if (_hour < 0)
        {
            _hour = 0;
        }

        if (_minute < 0)
        {
            _minute = 0;
        }

        if (_second < 0)
        {
            _second = 0;
        }

        return string.Format("{0:D2}:{1:D2}:{2:D2}", _hour, _minute, _second);
    }

    public static string FormatMS(int _minute, int _second)
    {
        if (_minute < 0)
        {
            _minute = 0;
        }

        if (_second < 0)
        {
            _second = 0;
        }

        return string.Format("{0:D2}:{1:D2}", _minute, _second);
    }

    /// <summary>
    /// Gets the remain time from specified next day to now.
    /// </summary>
    /// <returns>The remain time from next day to now.</returns>
    /// <param name="_nextDays">the specified next day number</param>
    /// <param name="_hour">the hour of next day</param>
    /// <param name="_minute">the minute of next day</param>
    /// <param name="_second">the second of next day</param>
    public static TimeSpan GetRemainTimeFromNextDayToNow(int _nextDays, int _hour, int _minute, int _second)
    {
        DateTime now = DateTime.Now;
        DateTime next = now.AddDays(_nextDays);
        next = new DateTime(next.Year, next.Month, next.Day, _hour, _minute, _second);
        TimeSpan nextDay = TimeSpan.FromTicks(next.Ticks);
        TimeSpan result = TimeSpan.FromTicks(nextDay.Ticks - now.Ticks);
        return result;
    }

    public static string GetDateTime()
    {
        DateTime now = DateTime.Now;
        string strTime = string.Format("{0}-{1}-{2}_{3}:{4}:{5}_{6}",
            now.Year, now.Month, now.Day, now.Hour, now.Minute, now.Second, now.Millisecond);
        return strTime;
    }

    /// <summary>
    /// 时间，秒数转化为24小时制，“00：00：00”
    /// </summary>
    /// <param name="seconds">总秒数</param>
    /// <returns></returns>
    public static string Get24HRDigitalTime(float seconds)
    {
        int nTime = Mathf.RoundToInt(seconds);
        int hour = nTime / 3600;
        int minute = nTime % 3600 / 60;
        int second = nTime % 60;
        return string.Format("{0:D2}:{1:D2}:{2:D2}", hour, minute, second);
    }

    public static string Get24HRDigitalTime(double seconds)
    {
        int nTime = Convert.ToInt32(seconds);
        int hour = nTime / 3600;
        int minute = nTime % 3600 / 60;
        int second = nTime % 60;
        return string.Format("{0:D2}:{1:D2}:{2:D2}", hour, minute, second);
    }

    public static string Get24HRShortTime(double seconds)
    {
        int nTime = Convert.ToInt32(seconds);
        int minute = nTime % 3600 / 60;
        int second = nTime % 60;
        return string.Format("{0:D2}:{1:D2}", minute, second);
    }

    /// <summary>
    /// 获得天数
    /// </summary>
    /// <param name="seconds"></param>
    /// <returns></returns>
    public static string GetDayTime(double seconds)
    {
        int nTime = Convert.ToInt32(seconds);

        int day = nTime / 86400;//3600*24

        day++;

        return day.ToString();
    }

    public static string Get24DayClockTime(double seconds)
    {
        int nTime = Convert.ToInt32(seconds);

        //int day = nTime / 86400;//3600*24
        int hour = nTime % 86400 / 3600;
        int minute = nTime % 3600 / 60;

        return string.Format("{0:D2}:{1:D2}", hour, minute);
    }

    public static string Get12HRDigitalTime(float seconds)
    {
        int nTime = Mathf.RoundToInt(seconds);
        int hour = nTime / 3600;
        int minute = nTime % 3600 / 60;
        int second = nTime % 60;
        return hour > 12 ? string.Format("PM{0:D2}:{1:D2}:{2:D2}", hour % 12, minute, second) : string.Format("AM{0:D2}:{1:D2}:{2:D2}", hour, minute, second);
    }

    /// <summary>
    /// 判断服务器时间是否过了一天
    /// </summary>
    public static bool IsOverOneDay(uint startTime, uint endTime)
    {
        return (startTime / 86400 != endTime / 86400);
    }
}