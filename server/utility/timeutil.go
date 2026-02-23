package utility

import (
	"time"

	"github.com/gogf/gf/v2/os/gtime"
)

// NowUnix 返回当前 UTC 秒级时间戳
func NowUnix() int64 {
	return gtime.Now().Unix()
}

// NowUnixMilli 返回当前 UTC 毫秒级时间戳
func NowUnixMilli() int64 {
	return gtime.Now().UnixMilli()
}

// UnixToTime 将秒级时间戳转换为 UTC time.Time
func UnixToTime(sec int64) time.Time {
	return time.Unix(sec, 0).UTC()
}

// UnixMilliToTime 将毫秒级时间戳转换为 UTC time.Time
func UnixMilliToTime(ms int64) time.Time {
	return time.Unix(0, ms*int64(time.Millisecond)).UTC()
}

// UnixToGTime 将秒级时间戳转换为 gtime.Time
func UnixToGTime(sec int64) *gtime.Time {
	t := UnixToTime(sec)
	return gtime.New(t)
}

// UnixMilliToGTime 将毫秒级时间戳转换为 gtime.Time
func UnixMilliToGTime(ms int64) *gtime.Time {
	t := UnixMilliToTime(ms)
	return gtime.New(t)
}
