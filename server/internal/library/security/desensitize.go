package security

import (
	"strings"
)

// MaskMobile 手机号脱敏: 138****1234
func MaskMobile(mobile string) string {
	if len(mobile) < 7 {
		return mobile
	}
	// 保留前3位和后4位
	return mobile[:3] + "****" + mobile[len(mobile)-4:]
}

// MaskEmail 邮箱脱敏: u***r@example.com
func MaskEmail(email string) string {
	at := strings.Index(email, "@")
	if at <= 0 {
		return email
	}

	name := email[:at]
	domain := email[at:]

	if len(name) <= 1 {
		return name + "***" + domain
	}
	if len(name) <= 3 {
		return string(name[0]) + "***" + domain
	}
	// 保留首尾各1位
	return string(name[0]) + "***" + string(name[len(name)-1]) + domain
}

// MaskIDCard 身份证脱敏: 110***********1234
func MaskIDCard(idCard string) string {
	if len(idCard) < 8 {
		return idCard
	}
	return idCard[:3] + strings.Repeat("*", len(idCard)-7) + idCard[len(idCard)-4:]
}
